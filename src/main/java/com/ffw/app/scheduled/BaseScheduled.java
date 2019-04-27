package com.ffw.app.scheduled;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ffw.api.model.PageData;
import com.ffw.api.util.DateUtil;
import com.ffw.app.config.WXPayConfigImpl;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.tasker.BaseTasker;
import com.ffw.app.util.RestTemplateUtil;
import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConstants.SignType;
import com.github.wxpay.sdk.WXPayUtil;

@Component
public class BaseScheduled {

	private Logger LOGGER = LoggerFactory.getLogger(BaseScheduled.class);

	@Autowired
	BaseTasker baseTasker;

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	WXPayConfigImpl config;

	@Autowired
	RestTemplateUtil rest;

	@Scheduled(cron = "0 0 5 * * ?")
	public void executeTask1() {

		try {
			autoDownloadBill();
			LOGGER.info("更新微信账单数据成功");
		} catch (Exception e) {
			LOGGER.info("更新微信账单数据失败");
		}
	}

	@Scheduled(cron = "0 0 6 * * ?")
	public void executeTask2() {

		baseTasker.refreshTempWXAttach();

		LOGGER.info("更新微信临时素材");
	}

	private void autoDownloadBill() throws Exception {

		String DATE = DateUtil.getAfterDayDate("-1").split(" ")[0].replace("-",
				"");
		LOGGER.info("开始下载" + DATE + "微信账单数据");

		WXPay wxpay = new WXPay(config, SignType.MD5);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("appid", wechatMiniConfig.getAppid());
		parameters.put("mchid", wechatMiniConfig.getMchid());
		parameters.put("nonce_str", WXPayUtil.generateNonceStr());
		parameters.put("bill_date", DATE);
		parameters.put("bill_type", "ALL");

		// 签名
		String sign = WXPayUtil.generateSignature(parameters,
				wechatMiniConfig.getMchkey());
		parameters.put("sign", sign);

		Map<String, String> result = wxpay
				.downloadBill(parameters, config.getHttpConnectTimeoutMs(),
						config.getHttpReadTimeoutMs());

		String data = result.get("data");

		if (null == data) {
			LOGGER.info("再次更新微信账单数据");
			autoDownloadBill();
			return;
		}

		System.err.println(data);

		String newStr = data.replaceAll(",", " "); // 去空格
		String[] tempStr = newStr.split("`"); // 数据分组
		String[] t = tempStr[0].split(" ");// 分组标题
		int k = 1; // 纪录数组下标
		int j = tempStr.length / t.length; // 计算循环次数

		PageData pd = null;

		for (int i = 0; i < j; i++) {
			pd = new PageData();
			for (int m = 0; m < t.length; m++) {
				// 如果是最后列且是最后一行数据时，去除数据里的汉字
				if ((i == j - 1) && (m == t.length - 1)) {
					String reg = "[\u4e00-\u9fa5]";// 汉字的正则表达式
					Pattern pat = Pattern.compile(reg);
					Matcher mat = pat.matcher(tempStr[m + k]);
					String repickStr = mat.replaceAll("");
					pd.put("K" + (m + 1), repickStr);
				} else {
					pd.put("K" + (m + 1), tempStr[m + k]);
				}
			}

			rest.post(IConstant.FFW_SERVICE_KEY, "bill/save", pd,
					PageData.class);

			k = k + t.length;
		}

	}
}
