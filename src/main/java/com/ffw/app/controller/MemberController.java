package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController extends BaseController {

	@RequestMapping(value = { "/member" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/index");
		mv.addObject("nav", "member");
		return mv;
	}

}
