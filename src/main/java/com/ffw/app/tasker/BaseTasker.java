package com.ffw.app.tasker;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;

import com.ffw.api.model.PageData;
import com.ffw.app.config.FileConfig;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.HttpPostUploadUtil;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Component
public class BaseTasker implements CommandLineRunner {

	@Autowired
	RestTemplateUtil rest;

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	FileConfig fileConfig;

	@Override
	public void run(String... args) throws Exception {
		refreshTempWXAttach();
	}

	public void refreshTempWXAttach() {
		PageData pd = new PageData();
		List<PageData> data = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"groups/listAll", pd,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		for (PageData pageData : data) {

			String token = JSSDKUtil.AccessToken(wechatMiniConfig.getAppid(),
					wechatMiniConfig.getAppsecret());
			String filepath = fileConfig.getDirImage() + File.separator
					+ pageData.getString("FILEPATH2");
			String urlStr = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token="
					+ token + "&type=image";
			Map<String, String> textMap = new HashMap<String, String>();
			textMap.put("key1", "value1");
			Map<String, String> fileMap = new HashMap<String, String>();
			fileMap.put("file", filepath);
			String ret = HttpPostUploadUtil
					.formUpload(urlStr, textMap, fileMap);
			System.out.println(ret);

			pageData.put("MEDIA_ID",
					JSONObject.fromObject(ret).getString("media_id"));

			rest.post(IConstant.FFW_SERVICE_KEY, "groups/edit", pageData,
					PageData.class);

		}
	}

}
