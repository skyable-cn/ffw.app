package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController extends BaseController {

	@RequestMapping(value = { "/goods/info" })
	public ModelAndView info() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("goods/info");
		return mv;
	}

}
