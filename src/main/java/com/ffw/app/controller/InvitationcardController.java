package com.ffw.app.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.config.FileConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class InvitationcardController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@Autowired
	RestTemplate restTemplateOther;

	@Autowired
	FileConfig fileConfig;

	@RequestMapping(value = { "/invitationcard" })
	public ModelAndView complate() {
		logger.info("进入邀请名片");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("MARKET_ID", marketId());

		List<PageData> posterData = rest.postForList(IConstant.FFW_SERVICE_KEY, "poster/listAll", pd,
				new ParameterizedTypeReference<List<PageData>>() {
				});

		pd = posterData.get(0);
		mv.addObject("pd", pd);

		mv.setViewName("my/invitationcard");
		return mv;
	}

	@RequestMapping("/poster")
	public void imageFile(HttpServletRequest request, HttpServletResponse response) {
		PageData pd = new PageData();
		pd = this.getPageData();

		String WXOPEN_ID = openId();
		if (StringUtils.isEmpty(WXOPEN_ID)) {
			WXOPEN_ID = "o_egB5bfyOQBmzWDydJxbKY8rjG8";
		}

		String fileName = WXOPEN_ID + ".png";

		File file = new File(fileConfig.getDirPoster() + File.separator + fileName);
		if (!file.exists()) {

			PageData market = marketSession();

			String token = JSSDKUtil.AccessToken(market.getString("WXAPPID"), market.getString("WXAPPSECRET"));
			InputStream inputStream = null;
			OutputStream outputStream = null;
			try {
				String url = "https://api.weixin.qq.com/wxa/getwxacode?access_token=" + token;
				Map<String, Object> param = new HashMap<>();
				param.put("path", "pages/index/index?fromopenid=" + WXOPEN_ID);
				param.put("width", 430);
				param.put("auto_color", false);
				Map<String, Object> line_color = new HashMap<>();
				line_color.put("r", 0);
				line_color.put("g", 0);
				line_color.put("b", 0);
				param.put("line_color", line_color);
				MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
				HttpEntity<Object> requestEntity = new HttpEntity<Object>(param, headers);
				ResponseEntity<byte[]> entity = restTemplateOther.exchange(url, HttpMethod.POST, requestEntity,
						byte[].class, new Object[0]);
				byte[] result = entity.getBody();
				inputStream = new ByteArrayInputStream(result);

				if (!file.exists()) {
					file.createNewFile();
				}
				outputStream = new FileOutputStream(file);
				int len = 0;
				byte[] buf = new byte[1024];
				while ((len = inputStream.read(buf, 0, 1024)) != -1) {
					outputStream.write(buf, 0, len);
				}
				outputStream.flush();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (outputStream != null) {
					try {
						outputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

		}

		if (file.exists()) {
			response.reset();
			response.setContentType("image/png");
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
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
