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
public class MyController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/my" })
	public ModelAndView index() {
		logger.info("进入我的");
		ModelAndView mv = new ModelAndView();

		PageData old = (PageData) getSession().getAttribute(
				IConstant.USER_SESSION);
		old = rest.post(IConstant.FFW_SERVICE_KEY, "member/find", old,
				PageData.class);
		getSession().setAttribute(IConstant.USER_SESSION, old);

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsNum", cardsData.size());

		PageData vipinfo = new PageData();
		vipinfo.put("MEMBER_ID", memberId());
		vipinfo = rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/findBy",
				vipinfo, PageData.class);
		mv.addObject("vipinfo", vipinfo);

		mv.setViewName("my/index");
		mv.addObject("nav", "my");
		return mv;
	}

	@RequestMapping(value = { "/my/cards" })
	public ModelAndView indexCards() {
		logger.info("进入我的卡券");
		ModelAndView mv = new ModelAndView();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsData", cardsData);

		mv.setViewName("my/cards");
		return mv;
	}

	@RequestMapping(value = { "/my/account" })
	public ModelAndView indexAccount() {
		logger.info("进入我的金库");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("my/account");
		return mv;
	}

}
