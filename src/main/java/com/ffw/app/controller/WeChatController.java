package com.ffw.app.controller;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
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
		logger.info("获取用户信息");
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
		logger.info("系统信息初始化");
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdm = new PageData();
		pdm.put("WXOPEN_ID", pd.getString("WXOPEN_ID"));
		pdm = rest.post(IConstant.FFW_SERVICE_KEY, "member/findBy", pdm,
				PageData.class);
		if (null == pdm) {
			pd.put("MEMBERTYPE_ID", IConstant.STRING_1);
			pd.put("ACCOUNTBALANCE", IConstant.STRING_0);

			if (null == pd.get("FROMWXOPEN_ID")
					|| pd.getString("FROMWXOPEN_ID").equals("null")) {
				pd.remove("FROMWXOPEN_ID");
			}

			rest.post(IConstant.FFW_SERVICE_KEY, "member/save", pd,
					PageData.class);
		} else {
			pdm.put("NICKNAME", pd.getString("NICKNAME"));
			pdm.put("SEX", pd.getString("SEX"));
			pdm.put("PHOTO", pd.getString("PHOTO"));
			pdm.put("SEX", pd.getString("SEX"));

			if (null != pd.get("FROMWXOPEN_ID")
					&& !pd.getString("FROMWXOPEN_ID").equals("null")) {
				if (null == pdm.getString("FROMWXOPEN_ID")
						|| StringUtils.isEmpty(pdm.getString("FROMWXOPEN_ID"))) {
					if (!pd.getString("FROMWXOPEN_ID").equals(
							pd.getString("WXOPEN_ID"))) {
						pdm.put("FROMWXOPEN_ID", pd.getString("FROMWXOPEN_ID"));
					}
				}
			}
			rest.post(IConstant.FFW_SERVICE_KEY, "member/edit", pdm,
					PageData.class);
		}
		return new ReturnModel();
	}
}
