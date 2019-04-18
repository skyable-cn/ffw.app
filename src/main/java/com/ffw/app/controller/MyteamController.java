package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class MyteamController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/myteam" })
	public ModelAndView complate() {
		logger.info("进入我的团队");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.setViewName("my/team");
		return mv;
	}
}
