package com.ffw.app.config;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import com.github.wxpay.sdk.WXPayConfig;

@Component
public class WXPayConfigImpl implements WXPayConfig {

	private byte[] certData;

	public WXPayConfigImpl() {
		String certPath = "classpath:apiclient_cert.p12";
		// String certPath = "C:/apiclient_cert.p12";
		try {
			File file = ResourceUtils.getFile(certPath);
			InputStream certStream = new FileInputStream(file);
			this.certData = new byte[(int) file.length()];
			certStream.read(this.certData);
			certStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Override
	public String getAppID() {
		return wechatMiniConfig.getAppid();
	}

	@Override
	public String getMchID() {
		return wechatMiniConfig.getMchid();
	}

	@Override
	public String getKey() {
		return wechatMiniConfig.getMchkey();
	}

	@Override
	public InputStream getCertStream() {
		// TODO Auto-generated method stub
		ByteArrayInputStream certBis = new ByteArrayInputStream(this.certData);
		return certBis;
	}

	@Override
	public int getHttpConnectTimeoutMs() {
		// TODO Auto-generated method stub
		return 60000;
	}

	@Override
	public int getHttpReadTimeoutMs() {
		// TODO Auto-generated method stub
		return 60000;
	}

}
