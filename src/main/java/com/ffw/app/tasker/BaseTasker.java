package com.ffw.app.tasker;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;

import com.ffw.api.model.PageData;
import com.ffw.app.config.FileConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.HttpPostUploadUtil;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

import net.sf.json.JSONObject;

@Component
public class BaseTasker implements CommandLineRunner {

	@Autowired
	RestTemplateUtil rest;

	@Autowired
	FileConfig fileConfig;

	@Override
	public void run(String... args) throws Exception {
		refreshTempWXAttach();
	}

	public void refreshTempWXAttach() {
		PageData pd = new PageData();

		List<PageData> marketList = rest.postForList(IConstant.FFW_SERVICE_KEY, "market/listAll", pd,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		Map<String, PageData> marketMap = new HashMap<String, PageData>();
		for (PageData pageData : marketList) {
			marketMap.put(pageData.getString("MARKET_ID"), pageData);
		}

		List<PageData> groupList = rest.postForList(IConstant.FFW_SERVICE_KEY, "groups/listAll", pd,
				new ParameterizedTypeReference<List<PageData>>() {
				});

		for (PageData pageData : groupList) {

			PageData market = marketMap.get(pageData.getString("MARKET_ID"));

			if (market.getString("WXFLAG").equals(IConstant.STRING_1)) {

				String token = JSSDKUtil.AccessToken(market.getString("WXAPPID"), market.getString("WXAPPSECRET"));
				String filepath = fileConfig.getDirImage() + File.separator + pageData.getString("FILEPATH2");
				String urlStr = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=" + token + "&type=image";
				Map<String, String> textMap = new HashMap<String, String>();
				textMap.put("key1", "value1");
				Map<String, String> fileMap = new HashMap<String, String>();
				fileMap.put("file", filepath);
				String ret = HttpPostUploadUtil.formUpload(urlStr, textMap, fileMap);
				pageData.put("MEDIA_ID", JSONObject.fromObject(ret).getString("media_id"));

				rest.post(IConstant.FFW_SERVICE_KEY, "groups/edit", pageData, PageData.class);

			}

		}
	}

}
