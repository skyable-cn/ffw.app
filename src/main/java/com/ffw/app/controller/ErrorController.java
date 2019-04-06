package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

	@RequestMapping(value = { "/error/param" })
	public ModelAndView info() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/param");
		return mv;
	}

}
