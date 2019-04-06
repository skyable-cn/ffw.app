package com.ffw.app.controller;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.model.ReturnModel;
import com.ffw.app.util.HttpUtils;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class WeChatController extends BaseController {

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	RestTemplateUtil rest;

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

	@RequestMapping(value = { "/system/init" })
	@ResponseBody
	public ReturnModel init() {
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdm = new PageData();
		pdm.put("WXOPEN_ID", pd.getString("WXOPEN_ID"));
		pdm = rest.post(IConstant.FFW_SERVICE_KEY, "member/findBy", pdm,
				PageData.class);
		if (null == pdm) {
			rest.post(IConstant.FFW_SERVICE_KEY, "member/save", pd,
					PageData.class);
		} else {
			pdm.put("NICKNAME", pd.getString("NICKNAME"));
			pdm.put("SEX", pd.getString("SEX"));
			pdm.put("PHOTO", pd.getString("PHOTO"));
			pdm.put("SEX", pd.getString("SEX"));
			rest.post(IConstant.FFW_SERVICE_KEY, "member/edit", pdm,
					PageData.class);
		}

		return new ReturnModel();
	}
}
