package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.model.ReturnModel;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class GiftchangeController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/giftchange" })
	public ModelAndView complate() {
		logger.info("进入礼券兑换");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.setViewName("my/giftchange");
		return mv;
	}

	@RequestMapping(value = { "/giftchange/save" })
	@ResponseBody
	public ReturnModel complateSave() {
		logger.info("进入礼券兑换保存");
		ReturnModel rm = new ReturnModel();
		PageData pd = new PageData();
		pd = this.getPageData();

		rm.setFlag(true);
		rm.setData(pd);
		return rm;
	}
}
