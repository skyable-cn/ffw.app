package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StandController {

	@RequestMapping(value = { "/stand" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("stand/index");
		return mv;
	}

}
