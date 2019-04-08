package com.ffw.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class StandController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/stand" })
	public ModelAndView index() {
		logger.info("进入展位列表");
		ModelAndView mv = new ModelAndView();

		PageData pd1 = new PageData();
		List<PageData> standData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"stand/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("standData", standData);

		mv.setViewName("stand/index");
		return mv;
	}

}
