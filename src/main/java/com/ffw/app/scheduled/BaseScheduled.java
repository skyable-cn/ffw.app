package com.ffw.app.scheduled;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ffw.app.tasker.BaseTasker;

@Component
public class BaseScheduled {

	@Autowired
	BaseTasker baseTasker;

	private Logger LOGGER = LoggerFactory.getLogger(BaseScheduled.class);

	@Scheduled(cron = "0 0 0 * * ?")
	public void executeTask1() {

		baseTasker.refreshTempWXAttach();

		LOGGER.info("更新微信临时素材");
	}

}
