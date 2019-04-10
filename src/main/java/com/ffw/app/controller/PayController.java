package com.ffw.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.app.config.WXPayConfigImpl;
import com.ffw.app.config.WechatMiniConfig;
import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConstants.SignType;
import com.github.wxpay.sdk.WXPayUtil;

@Controller
public class PayController extends BaseController {

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	WXPayConfigImpl config;

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

		// 生成的随机字符串
		String nonce_str = WXPayUtil.generateNonceStr();
		// 获取客户端的ip地址
		String spbill_create_ip = getIpAddr(getRequest());

		int price = 1;
		// 统一下单接口
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("appid", wechatMiniConfig.getAppid());
		data.put("mch_id", wechatMiniConfig.getMchid());
		data.put("nonce_str", nonce_str);
		data.put("body", "测试商品"); // 商品描述
		data.put("out_trade_no", "order-" + new Random().nextLong());// 商户订单号
		data.put("total_fee", String.valueOf(price));// 支付金额，这边需要转成字符串类型，否则后面的签名会失败
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
