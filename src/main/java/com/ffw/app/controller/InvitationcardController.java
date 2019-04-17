package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class InvitationcardController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/invitationcard" })
	public ModelAndView complate() {
		logger.info("进入邀请名片");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.setViewName("my/invitationcard");
		return mv;
	}
}
