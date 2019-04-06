package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class SellerController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

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

	@RequestMapping(value = { "/seller/save" })
	public ModelAndView sellerSave() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd = rest.post(IConstant.FFW_SERVICE_KEY, "shop/save", pd,
				PageData.class);
		mv.addObject("msg", "Ok");
		mv.setViewName("seller/index");
		return mv;
	}

}
