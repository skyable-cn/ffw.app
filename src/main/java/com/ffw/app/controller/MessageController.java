package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.HttpUtils;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

import net.sf.json.JSONObject;

@Controller
public class MessageController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/message" })
	@ResponseBody
	public JSONObject message() {
		logger.info("发送消息");
		PageData pd = new PageData();
		pd = this.getPageData();

		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		String openid = pd.getString("openid");

		PageData market = marketSession();

		pd = rest.post(IConstant.FFW_SERVICE_KEY, "groups/find", pd, PageData.class);

		String token = JSSDKUtil.AccessToken(market.getString("WXAPPID"), market.getString("WXAPPSECRET"));

		String json = "{\"touser\": \"" + openid + "\",\"msgtype\": \"image\", \"image\": {\"media_id\": \""
				+ pd.getString("MEDIA_ID") + "\"}}";
		JSONObject rs = null;
		try {
			String str = HttpUtils.post("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + token,
					json);
			rs = JSONObject.fromObject(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
