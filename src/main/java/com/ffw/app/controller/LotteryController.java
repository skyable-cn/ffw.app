package com.ffw.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class LotteryController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/lottery" })
	public ModelAndView index() {
		logger.info("进入免费抽奖");
		ModelAndView mv = new ModelAndView();
		
		PageData pd1 = new PageData();
		List<PageData> lotteryData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"lottery/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("lotteryData", lotteryData);
		
		mv.setViewName("lottery/index");
		return mv;
	}

	@RequestMapping(value = { "/lottery/info" })
	public ModelAndView info() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("lottery/info");
		return mv;
	}

	@RequestMapping(value = { "/lottery/member" })
	public ModelAndView member() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("lottery/member");
		return mv;
	}

}
