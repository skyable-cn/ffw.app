package com.ffw.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;

@Controller
public class SellerController extends BaseController {

	@RequestMapping(value = { "/seller" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("seller/index");
		return mv;
	}

	@RequestMapping(value = { "/sellerInit" })
	public ModelAndView sellerInit() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("seller/index");
		return mv;
	}

}
