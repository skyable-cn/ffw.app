package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShopController {

	@RequestMapping(value = { "/shop" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/index");
		return mv;
	}

	@RequestMapping(value = { "/shop/info" })
	public ModelAndView info() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/info");
		return mv;
	}

}
