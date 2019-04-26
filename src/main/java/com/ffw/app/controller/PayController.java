package com.ffw.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.api.util.DateUtil;
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

		String type = pd.getString("TYPE");

		if ("goods".equals(type)) {
			pd.put("ORDER_ID", pd.getString("ID"));
			pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", pd,
					PageData.class);
			SNID = pd.getString("ORDERSN");
			BODYDESC = "饭饭网产品消费";
		} else if ("product".equals(type)) {
			pd.put("RECHARGE_ID", pd.getString("ID"));
			pd = rest.post(IConstant.FFW_SERVICE_KEY, "recharge/find", pd,
					PageData.class);
			SNID = pd.getString("RECHARGESN");
			BODYDESC = "饭饭网会员充值";
		} else {

		}

		// 返回给小程序端需要的参数
		Map<String, String> response = new HashMap<String, String>();

		if (null == pd) {
			response.put("STATEFLAG", "NO");
			response.put("STATEMESSAGE", "参数异常");
			return response;
		}

		if (StringUtils.isNotEmpty(pd.getString("WEIXINSN"))) {
			response.put("STATEFLAG", "NO");
			response.put("STATEMESSAGE", "订单已支付");
			return response;
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
		data.put("attach", type);

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

				response.put("STATEFLAG", "OK");

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
			String transaction_id = dataMap.get("transaction_id");
			String out_trade_no = dataMap.get("out_trade_no");
			String type = dataMap.get("attach");
			PageData pd = new PageData();
			if ("goods".equals(type)) {
				pd.put("ORDERSN", out_trade_no);

				pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/findBy", pd,
						PageData.class);

				if (StringUtils.isNotEmpty(pd.getString("WEIXINSN"))) {
					return;
				}

				pd.put("WEIXINSN", transaction_id);
				pd.put("STATE", IConstant.STRING_1);
				rest.post(IConstant.FFW_SERVICE_KEY, "orders/edit", pd,
						PageData.class);

				if (pd.getString("VIPFLAG").equals(IConstant.STRING_1)) {

					PageData pd1 = new PageData();
					List<PageData> product = rest.postForList(
							IConstant.FFW_SERVICE_KEY, "product/listAll", pd1,
							new ParameterizedTypeReference<List<PageData>>() {
							});

					PageData pd0 = new PageData();
					pd0.put("RECHARGESN",
							new SimpleDateFormat("yyyyMMddHHmmss")
									.format(new Date()) + randomNumber(5));
					pd0.put("PRODUCT_ID", product.get(0)
							.getString("PRODUCT_ID"));
					pd0.put("MEMBER_ID", pd.getString("MEMBER_ID"));
					pd0.put("ORIGINAL", product.get(0)
							.getString("PRODUCTMONEY"));
					pd0.put("MONEY", product.get(0).getString("PRODUCTMONEY"));
					pd0.put("DERATE", IConstant.STRING_0);
					pd0.put("CDT", DateUtil.getTime());
					pd0.put("STATE", IConstant.STRING_1);
					rest.post(IConstant.FFW_SERVICE_KEY, "recharge/save", pd0,
							PageData.class);

					PageData vipinfo = new PageData();
					vipinfo.put("MEMBER_ID", pd.getString("MEMBER_ID"));
					vipinfo = rest.post(IConstant.FFW_SERVICE_KEY,
							"vipinfo/findBy", vipinfo, PageData.class);
					if (null == vipinfo) {
						PageData pd2 = new PageData();
						pd2.put("VIPSN", DateUtil.getNumber());
						pd2.put("MEMBER_ID", pd.getString("MEMBER_ID"));
						pd2.put("CDT", DateUtil.getTime());
						pd2.put("LASTTIME", DateUtil.getAfterDayDate(product
								.get(0).getString("PRODUCTTIME")));
						rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/save",
								pd2, PageData.class);

						PageData pd21 = new PageData();
						pd21.put("MEMBER_ID", pd.getString("MEMBER_ID"));
						pd21 = rest.post(IConstant.FFW_SERVICE_KEY,
								"member/find", pd21, PageData.class);
						if (IConstant.STRING_1.equals(pd21
								.getString("MEMBERTYPE_ID"))) {
							pd21.put("MEMBERTYPE_ID", IConstant.STRING_2);
							rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
									pd21, PageData.class);
						} else if (IConstant.STRING_3.equals(pd21
								.getString("MEMBERTYPE_ID"))) {
							pd21.put("MEMBERTYPE_ID", IConstant.STRING_4);
							rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
									pd21, PageData.class);
						} else {

						}
					} else {
						Date lasttime = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss").parse(vipinfo
								.getString("LASTTIME"));
						if (lasttime.getTime() > new Date().getTime()) {
							vipinfo.put("LASTTIME", DateUtil
									.getAfterDayDateWith(
											lasttime,
											product.get(0).getString(
													"PRODUCTTIME")));
						} else {
							vipinfo.put("LASTTIME", DateUtil
									.getAfterDayDate(product.get(0).getString(
											"PRODUCTTIME")));
						}
						rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/edit",
								vipinfo, PageData.class);
					}

					Double goodsMoney = Double.parseDouble(pd
							.getString("MONEY"))
							- Double.parseDouble(product.get(0).getString(
									"PRODUCTMONEY"));
					if (goodsMoney <= 0) {
						pd.put("MONEY", IConstant.STRING_0);
					} else {
						pd.put("MONEY", String.valueOf(goodsMoney));
					}

					rest.post(IConstant.FFW_SERVICE_KEY, "orders/edit", pd,
							PageData.class);

				}

				PageData pdgoods = new PageData();
				pdgoods.put("GOODS_ID", pd.getString("GOODS_ID"));
				pdgoods = rest.post(IConstant.FFW_SERVICE_KEY, "goods/find",
						pdgoods, PageData.class);

				pdgoods.put("BUYNUMBER",
						Integer.parseInt(pdgoods.getString("BUYNUMBER"))
								+ Integer.parseInt(pd.getString("NUMBER")));
				rest.post(IConstant.FFW_SERVICE_KEY, "goods/edit", pdgoods,
						PageData.class);

				PageData pdmember = new PageData();
				pdmember.put("MEMBER_ID", pd.getString("MEMBER_ID"));
				pdmember = rest.post(IConstant.FFW_SERVICE_KEY, "member/find",
						pdmember, PageData.class);

				if (pdmember.getString("MEMBERTYPE_ID").equals(
						IConstant.STRING_1)
						|| pdmember.getString("MEMBERTYPE_ID").equals(
								IConstant.STRING_3)) {
					String GIVEMONEY = String.valueOf(Double
							.parseDouble(pdgoods.getString("MEMBERBACKMONEY"))
							* Double.parseDouble(pd.getString("NUMBER")));

					PageData pdaccount = new PageData();
					pdaccount.put("ORDER_ID", pd.getString("ORDER_ID"));
					pdaccount.put("MEMBER_ID", pd.getString("MEMBER_ID"));
					pdaccount.put("GIVEMONEY", GIVEMONEY);
					pdaccount.put("DESCRIPTION", "普通/达人用户购买返利");
					pdaccount.put("TYPE", IConstant.STRING_1);
					pdaccount.put("CDT", DateUtil.getTime());
					rest.post(IConstant.FFW_SERVICE_KEY, "member/saveAccount",
							pdaccount, PageData.class);

					PageData pdwaitaccount = new PageData();
					pdwaitaccount.put("MEMBER_ID", pd.getString("MEMBER_ID"));
					String waitaccount = String.valueOf(Double
							.parseDouble(pdmember.getString("WAITACCOUNT"))
							+ Double.parseDouble(GIVEMONEY));
					pdwaitaccount.put("WAITACCOUNT", waitaccount);
					rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
							pdwaitaccount, PageData.class);

				} else if (pdmember.getString("MEMBERTYPE_ID").equals(
						IConstant.STRING_2)
						|| pdmember.getString("MEMBERTYPE_ID").equals(
								IConstant.STRING_4)) {
					String GIVEMONEY = String.valueOf(Double
							.parseDouble(pdgoods.getString("VIPBACKMONEY"))
							* Double.parseDouble(pd.getString("NUMBER")));

					PageData pdaccount = new PageData();
					pdaccount.put("ORDER_ID", pd.getString("ORDER_ID"));
					pdaccount.put("MEMBER_ID", pd.getString("MEMBER_ID"));
					pdaccount.put("GIVEMONEY", GIVEMONEY);
					pdaccount.put("DESCRIPTION", "普通/达人会员购买返利");
					pdaccount.put("CDT", DateUtil.getTime());
					pdaccount.put("TYPE", IConstant.STRING_1);
					rest.post(IConstant.FFW_SERVICE_KEY, "member/saveAccount",
							pdaccount, PageData.class);

					PageData pdwaitaccount = new PageData();
					pdwaitaccount.put("MEMBER_ID", pd.getString("MEMBER_ID"));
					String waitaccount = String.valueOf(Double
							.parseDouble(pdmember.getString("WAITACCOUNT"))
							+ Double.parseDouble(GIVEMONEY));
					pdwaitaccount.put("WAITACCOUNT", waitaccount);
					rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
							pdwaitaccount, PageData.class);
				} else {

				}

				PageData pd1 = new PageData();
				if (StringUtils.isNotEmpty(pd.getString("FROMWXOPEN_ID"))) {
					pd1.put("ORDER_ID", pd.getString("ORDER_ID"));
					String GIVEMONEY0 = String.valueOf(Double
							.parseDouble(pdgoods.getString("BACKMONEY0"))
							* Double.parseDouble(pd.getString("NUMBER")));
					pd1.put("GIVEMONEY", GIVEMONEY0);
					pd1.put("GDT", DateUtil.getTime());
					rest.post(IConstant.FFW_SERVICE_KEY, "orders/edit", pd1,
							PageData.class);

					PageData pdmember0 = new PageData();
					pdmember0.put("WXOPEN_ID", pd.getString("FROMWXOPEN_ID"));
					pdmember0 = rest.post(IConstant.FFW_SERVICE_KEY,
							"member/findBy", pdmember0, PageData.class);

					PageData pdaccount0 = new PageData();
					pdaccount0.put("ORDER_ID", pd.getString("ORDER_ID"));
					pdaccount0.put("MEMBER_ID",
							pdmember0.getString("MEMBER_ID"));
					pdaccount0.put("GIVEMONEY", GIVEMONEY0);
					pdaccount0.put("DESCRIPTION", "分销本级返利");
					pdaccount0.put("TYPE", IConstant.STRING_2);
					pdaccount0.put("CDT", DateUtil.getTime());
					rest.post(IConstant.FFW_SERVICE_KEY, "member/saveAccount",
							pdaccount0, PageData.class);

					PageData pdwaitaccount0 = new PageData();
					pdwaitaccount0.put("MEMBER_ID",
							pdmember0.getString("MEMBER_ID"));
					String waitaccount = String.valueOf(Double
							.parseDouble(pdmember0.getString("WAITACCOUNT"))
							+ Double.parseDouble(GIVEMONEY0));
					pdwaitaccount0.put("WAITACCOUNT", waitaccount);
					rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
							pdwaitaccount0, PageData.class);

					if (StringUtils.isNotEmpty(pdmember0
							.getString("FROMWXOPEN_ID"))) {
						String GIVEMONEY1 = String.valueOf(Double
								.parseDouble(pdgoods.getString("BACKMONEY1"))
								* Double.parseDouble(pd.getString("NUMBER")));

						PageData pdmember1 = new PageData();
						pdmember1.put("WXOPEN_ID",
								pdmember0.getString("FROMWXOPEN_ID"));
						pdmember1 = rest.post(IConstant.FFW_SERVICE_KEY,
								"member/findBy", pdmember1, PageData.class);

						PageData pdaccount1 = new PageData();
						pdaccount1.put("ORDER_ID", pd.getString("ORDER_ID"));
						pdaccount1.put("MEMBER_ID",
								pdmember1.getString("MEMBER_ID"));
						pdaccount1.put("GIVEMONEY", GIVEMONEY1);
						pdaccount1.put("DESCRIPTION", "分销一级返利");
						pdaccount1.put("TYPE", IConstant.STRING_3);
						pdaccount1.put("CDT", DateUtil.getTime());
						rest.post(IConstant.FFW_SERVICE_KEY,
								"member/saveAccount", pdaccount1,
								PageData.class);

						PageData pdwaitaccount1 = new PageData();
						pdwaitaccount1.put("MEMBER_ID",
								pdmember1.getString("MEMBER_ID"));
						String waitaccount1 = String
								.valueOf(Double.parseDouble(pdmember1
										.getString("WAITACCOUNT"))
										+ Double.parseDouble(GIVEMONEY1));
						pdwaitaccount1.put("WAITACCOUNT", waitaccount1);
						rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
								pdwaitaccount1, PageData.class);

						if (StringUtils.isNotEmpty(pdmember1
								.getString("FROMWXOPEN_ID"))) {
							String GIVEMONEY2 = String
									.valueOf(Double.parseDouble(pdgoods
											.getString("BACKMONEY2"))
											* Double.parseDouble(pd
													.getString("NUMBER")));

							PageData pdmember2 = new PageData();
							pdmember2.put("WXOPEN_ID",
									pdmember1.getString("FROMWXOPEN_ID"));
							pdmember2 = rest.post(IConstant.FFW_SERVICE_KEY,
									"member/findBy", pdmember2, PageData.class);

							PageData pdaccount2 = new PageData();
							pdaccount2
									.put("ORDER_ID", pd.getString("ORDER_ID"));
							pdaccount2.put("MEMBER_ID",
									pdmember2.getString("MEMBER_ID"));
							pdaccount2.put("GIVEMONEY", GIVEMONEY2);
							pdaccount2.put("DESCRIPTION", "分销二级返利");
							pdaccount2.put("TYPE", IConstant.STRING_4);
							pdaccount2.put("CDT", DateUtil.getTime());
							rest.post(IConstant.FFW_SERVICE_KEY,
									"member/saveAccount", pdaccount2,
									PageData.class);

							PageData pdwaitaccount2 = new PageData();
							pdwaitaccount2.put("MEMBER_ID",
									pdmember2.getString("MEMBER_ID"));
							String waitaccount2 = String.valueOf(Double
									.parseDouble(pdmember2
											.getString("WAITACCOUNT"))
									+ Double.parseDouble(GIVEMONEY2));
							pdwaitaccount2.put("WAITACCOUNT", waitaccount2);
							rest.post(IConstant.FFW_SERVICE_KEY, "member/edit",
									pdwaitaccount2, PageData.class);
						}
					}
				}

			} else if ("product".equals(type)) {
				pd.put("RECHARGESN", out_trade_no);

				pd = rest.post(IConstant.FFW_SERVICE_KEY, "recharge/findBy",
						pd, PageData.class);
				if (StringUtils.isNotEmpty(pd.getString("WEIXINSN"))) {
					return;
				}

				pd.put("WEIXINSN", transaction_id);
				pd.put("STATE", IConstant.STRING_1);
				rest.post(IConstant.FFW_SERVICE_KEY, "recharge/edit", pd,
						PageData.class);

				pd = rest.post(IConstant.FFW_SERVICE_KEY, "recharge/find", pd,
						PageData.class);

				String WXOPEN_ID = dataMap.get("openid");
				PageData pd1 = new PageData();
				pd1.put("WXOPEN_ID", WXOPEN_ID);
				pd1 = rest.post(IConstant.FFW_SERVICE_KEY, "member/findBy",
						pd1, PageData.class);
				if (IConstant.STRING_1.equals(pd1.getString("MEMBERTYPE_ID"))) {
					pd1.put("MEMBERTYPE_ID", IConstant.STRING_2);
					rest.post(IConstant.FFW_SERVICE_KEY, "member/edit", pd1,
							PageData.class);
				} else if (IConstant.STRING_3.equals(pd1
						.getString("MEMBERTYPE_ID"))) {
					pd1.put("MEMBERTYPE_ID", IConstant.STRING_4);
					rest.post(IConstant.FFW_SERVICE_KEY, "member/edit", pd1,
							PageData.class);
				} else {

				}

				PageData pd2 = new PageData();
				pd2.put("MEMBER_ID", pd1.getString("MEMBER_ID"));
				pd2 = rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/findBy",
						pd2, PageData.class);

				PageData pdr = new PageData();
				pdr.put("PRODUCT_ID", pd.getString("PRODUCT_ID"));
				pdr = rest.post(IConstant.FFW_SERVICE_KEY, "product/find", pdr,
						PageData.class);

				if (pd2 != null) {
					Date lasttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.parse(pd2.getString("LASTTIME"));
					if (lasttime.getTime() > new Date().getTime()) {
						pd2.put("LASTTIME",
								DateUtil.getAfterDayDateWith(lasttime,
										pdr.getString("PRODUCTTIME")));
					} else {
						pd2.put("LASTTIME", DateUtil.getAfterDayDate(pdr
								.getString("PRODUCTTIME")));
					}
					rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/edit", pd2,
							PageData.class);

				} else {

					pd2 = new PageData();
					pd2.put("VIPSN", DateUtil.getNumber());
					pd2.put("MEMBER_ID", pd1.getString("MEMBER_ID"));
					pd2.put("CDT", DateUtil.getTime());
					pd2.put("LASTTIME", DateUtil.getAfterDayDate(pdr
							.getString("PRODUCTTIME")));
					rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/save", pd2,
							PageData.class);

				}

			} else {

			}

			String response = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
			getResponse().getOutputStream().write(response.getBytes());
		}

	}

	private String randomNumber(int length) {
		StringBuilder sb = new StringBuilder();
		Random r = new Random();
		String s = "0123456789";
		for (int i = 0; i < length; i++) {
			sb.append(s.charAt(r.nextInt(s.length())));
		}
		return sb.toString();
	}
}
