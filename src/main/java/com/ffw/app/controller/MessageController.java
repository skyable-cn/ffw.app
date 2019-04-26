package com.ffw.app.controller;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.HttpUtils;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class MessageController extends BaseController {

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/message" })
	@ResponseBody
	public JSONObject message() {
		logger.info("发送消息");
		PageData pd = new PageData();
		pd = this.getPageData();

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		String openid = pd.getString("openid");

		pd = rest.post(IConstant.FFW_SERVICE_KEY, "groups/find", pd,
				PageData.class);

		String token = JSSDKUtil.AccessToken(wechatMiniConfig.getAppid(),
				wechatMiniConfig.getAppsecret());

		String json = "{\"touser\": \"" + openid
				+ "\",\"msgtype\": \"image\", \"image\": {\"media_id\": \""
				+ pd.getString("MEDIA_ID") + "\"}}";
		JSONObject rs = null;
		try {
			String str = HttpUtils.post(
					"https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="
							+ token, json);
			rs = JSONObject.fromObject(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.err.println(rs);
		return rs;
	}
}
