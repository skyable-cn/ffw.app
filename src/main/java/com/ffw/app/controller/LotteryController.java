package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LotteryController {

	@RequestMapping(value = { "/lottery" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("lottery/index");
		return mv;
	}

	@RequestMapping(value = { "/lottery/info" })
	public ModelAndView info() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("lottery/info");
		return mv;
	}

}
