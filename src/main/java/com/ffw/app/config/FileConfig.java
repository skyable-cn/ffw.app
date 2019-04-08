package com.ffw.app.config;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "server.file")
public class FileConfig {

	private String dir;

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getDirImage() {
		return getDir() + File.separator + "image";
	}

	@PostConstruct
	public void init() {

		String tempPath = getDir() + File.separator + "image";

		File ft = new File(tempPath);
		if (!ft.exists()) {
			ft.mkdir();
		}
	}
}
