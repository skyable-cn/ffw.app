package com.ffw.app.config;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.github.wxpay.sdk.WXPayConfig;

@Component
public class WXPayConfigImpl implements WXPayConfig {

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
		return null;
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
