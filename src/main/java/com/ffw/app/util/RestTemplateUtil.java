package com.ffw.app.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Component
public class RestTemplateUtil {

	@Autowired
	RestTemplate restTemplate;

	private String getBaseUrl(String serviceId, String restfulUrl) {
		return "http://" + serviceId + "/" + restfulUrl;
	}

	private String getBaseGetUrl(String serviceId, String restfulUrl,
			Map<String, Object> params) {
		String url = getBaseUrl(serviceId, restfulUrl);

		if (null != params && !params.isEmpty()) {
			StringBuilder templateStr = new StringBuilder();
			Iterator<Entry<String, Object>> items = params.entrySet()
					.iterator();
			while (items.hasNext()) {
				Entry<String, Object> item = items.next();
				String key = item.getKey();
				if (StringUtils.isNotBlank(key)) {
					if (templateStr.length() == 0) {
						templateStr.append(key + "={" + key + "}");
					} else {
						templateStr.append("&" + key + "={" + key + "}");
					}
				}
			}

			url += "?" + templateStr.toString();
		} else {
			params = new HashMap<String, Object>();
		}

		return url;
	}

	public <O> O post(String serviceId, String restfulUrl,
			Map<String, Object> params, Class<O> clazz) {

		if (null == params || params.isEmpty()) {
			params = new HashMap<String, Object>();
		}

		ResponseEntity<O> responseEntity = restTemplate
				.postForEntity(getBaseUrl(serviceId, restfulUrl), params,
						clazz, new Object[0]);

		return responseEntity.getBody();

	}

	public <O> O get(String serviceId, String restfulUrl,
			Map<String, Object> params, Class<O> clazz) {
		String url = getBaseGetUrl(serviceId, restfulUrl, params);
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder
				.fromUriString(url);
		UriComponents uriComponents = uriComponentsBuilder.build().encode();
		if (null != params && !params.isEmpty()) {
			uriComponentsBuilder.build().expand(params).encode();
		} else {
			params = new HashMap<String, Object>();
		}

		return restTemplate.getForObject(uriComponents.toUri(), clazz);

	}
}
