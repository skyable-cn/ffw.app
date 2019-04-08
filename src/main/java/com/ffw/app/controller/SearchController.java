package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController extends BaseController {

	@RequestMapping(value = { "/search" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/index");
		mv.addObject("nav", "search");
		return mv;
	}

}
