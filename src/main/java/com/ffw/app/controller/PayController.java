package com.ffw.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.app.config.WXPayConfigImpl;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;
import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConstants.SignType;
import com.github.wxpay.sdk.WXPayUtil;

@Controller
public class PayController extends BaseController {

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	WXPayConfigImpl config;

	@Autowired
	RestTemplateUtil rest;

	private String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("X-Real-IP");
		if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
			return ip;
		}
		return request.getRemoteAddr();
	}

	@RequestMapping("wxPay")
	@ResponseBody
	public Map<String, String> wxPay() {

		logger.info("进入下单处理");
		PageData pd = new PageData();
		pd = this.getPageData();

		String SNID = null;
		String BODYDESC = null;
		if ("goods".equals(pd.getString("TYPE"))) {
			pd.put("ORDER_ID", pd.getString("ID"));
			pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", pd,
					PageData.class);
			SNID = "GOODS_"+pd.getString("ORDER_ID");
			BODYDESC = "饭饭网产品消费";
		} else if ("product".equals(pd.getString("TYPE"))) {
			pd.put("RECHARGE_ID", pd.getString("ID"));
			pd = rest.post(IConstant.FFW_SERVICE_KEY, "recharge/find", pd,
					PageData.class);
			SNID = "PRODUCT_"+pd.getString("RECHARGE_ID");
			BODYDESC = "饭饭网会员充值";
		} else {

		}

		// 生成的随机字符串
		String nonce_str = WXPayUtil.generateNonceStr();
		// 获取客户端的ip地址
		String spbill_create_ip = getIpAddr(getRequest());

		// 统一下单接口
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("appid", wechatMiniConfig.getAppid());
		data.put("mch_id", wechatMiniConfig.getMchid());
		data.put("nonce_str", nonce_str);
		data.put("body", BODYDESC); // 商品描述
		data.put("out_trade_no", SNID);// 商户订单号
		String fee = String
				.valueOf(Float.parseFloat(pd.getString("MONEY")) * 100);
		data.put("total_fee", fee.substring(0, fee.indexOf(".")) + "");// 支付金额，这边需要转成字符串类型，否则后面的签名会失败
		data.put("spbill_create_ip", spbill_create_ip);
		data.put("notify_url", wechatMiniConfig.getNoticeurl());// 支付成功后的回调地址
		data.put("trade_type", "JSAPI");// 支付方式
		data.put("openid", openId());

		// 返回给小程序端需要的参数
		Map<String, String> response = new HashMap<String, String>();
		response.put("appId", wechatMiniConfig.getAppid());

		WXPay wxpay = new WXPay(config, SignType.MD5);
		try {
			Map<String, String> rMap = wxpay.unifiedOrder(data);
			System.out.println("统一下单接口返回: " + rMap);
			String return_code = rMap.get("return_code");// 返回状态码
			String result_code = rMap.get("result_code");//
			String nonceStr = WXPayUtil.generateNonceStr();
			response.put("nonceStr", nonceStr);
			Long timeStamp = System.currentTimeMillis() / 1000;
			if ("SUCCESS".equals(return_code)
					&& return_code.equals(result_code)) {
				String prepayid = rMap.get("prepay_id");
				// response.put("prepayid", rMap.get("prepay_id"));
				response.put("package", "prepay_id=" + prepayid);
				response.put("signType", "MD5");
				response.put("timeStamp", timeStamp + "");// 这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误
				System.out.println("二次签名参数response ： " + response);

				// 再次签名，这个签名用于小程序端调用wx.requesetPayment方法
				String sign = WXPayUtil.generateSignature(response,
						wechatMiniConfig.getMchkey());
				response.put("paySign", sign);
				System.out.println("生成的签名paySign : " + sign);

				response.put("order", JSONObject.fromObject(pd).toString());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping(value = "/wxNotify")
	public void wxNotify() throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(
				getRequest().getInputStream()));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		br.close();
		String notityXml = sb.toString();
		System.out.println("接收到的报文：" + notityXml);

		Map<String, String> dataMap = WXPayUtil.xmlToMap(notityXml);

		String returnCode = dataMap.get("return_code");
		if ("SUCCESS".equals(returnCode)) {

		}

	}
}
