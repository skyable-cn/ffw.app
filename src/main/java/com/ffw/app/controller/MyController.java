package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController extends BaseController {

	@RequestMapping(value = { "/my" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("my/index");
		mv.addObject("nav", "my");
		return mv;
	}

}
