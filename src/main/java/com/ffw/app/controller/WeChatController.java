package com.ffw.app.controller;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.util.HttpUtils;

@Controller
public class WeChatController extends BaseController {

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@RequestMapping(value = { "/wechat/user" })
	@ResponseBody
	public JSONObject index() {
		PageData pd = new PageData();
		pd = this.getPageData();
		String str = null;
		try {
			str = HttpUtils
					.get("https://api.weixin.qq.com/sns/jscode2session?appid="
							+ wechatMiniConfig.getAppid() + "&secret="
							+ wechatMiniConfig.getAppsecret() + "&js_code="
							+ pd.getString("CODE")
							+ "&grant_type=authorization_code");
		} catch (Exception e) {

		}
		JSONObject obj = JSONObject.fromObject(str);
		return obj;
	}
}
