package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LotteryController {

	@RequestMapping(value = { "/shop" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/index");
		return mv;
	}

}
