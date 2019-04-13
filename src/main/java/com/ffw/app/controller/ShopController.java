package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class ShopController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/shop" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/index");
		return mv;
	}

	@RequestMapping(value = { "/shop/info" })
	public ModelAndView info() {
		logger.info("进入商家详情");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd = rest.post(IConstant.FFW_SERVICE_KEY, "shop/find", pd,
				PageData.class);
		mv.addObject("pd", pd);
		mv.setViewName("shop/info");
		return mv;
	}

}
