package com.ffw.app.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.config.FileConfig;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.HttpUtils;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class InvitationcardController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	FileConfig fileConfig;

	@RequestMapping(value = { "/invitationcard" })
	public ModelAndView complate() {
		logger.info("进入邀请名片");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.setViewName("my/invitationcard");
		return mv;
	}

	@RequestMapping("/poster")
	public void imageFile(HttpServletRequest request,
			HttpServletResponse response) {
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData user = (PageData) getSession().getAttribute(
				IConstant.USER_SESSION);

		String fileName = user.getString("WXOPEN_ID");

		if (StringUtils.isNotEmpty(fileName)) {
			File file = new File(fileConfig.getDirPoster() + File.separator
					+ fileName);
			if (!file.exists()) {
				String token = JSSDKUtil.AccessToken(
						wechatMiniConfig.getAppid(),
						wechatMiniConfig.getAppsecret());
				Map<String, String> param = new HashMap<String, String>();
				param.put("access_token", token);
				param.put("path", "pages/index/index?fromopenid=" + fileName);
				try {
					String data = HttpUtils.post(
							"https://api.weixin.qq.com/wxa/getwxacode", param);
					FileOutputStream os = new FileOutputStream(new File(
							fileConfig.getDirPoster() + File.separator
									+ fileName + ".png"));
					os.write(data.getBytes());
					os.flush();
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (file.exists()) {
				response.reset();
				response.setContentType("image/png");
				response.setHeader("Content-Type", "application/octet-stream");
				response.setHeader("Content-Disposition",
						"attachment;filename=" + fileName + ".png");
				try {
					InputStream in = new FileInputStream(file);
					byte[] bytearray = new byte[1024];
					int len = 0;
					while ((len = in.read(bytearray)) != -1) {
						response.getOutputStream().write(bytearray);
					}
					response.getOutputStream().flush();
					in.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
