package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class RankController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/rank" })
	public ModelAndView complate() {
		logger.info("进入排行榜");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.setViewName("my/rank");
		return mv;
	}
}
