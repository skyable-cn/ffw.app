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
public class MyteamController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/myteam" })
	public ModelAndView complate() {
		logger.info("进入我的团队");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("WXOPEN_ID", userSession().getString("WXOPEN_ID"));

		List<PageData> teamtData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"member/listTeam", pd,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("teamtData", teamtData);

		mv.setViewName("my/team");
		return mv;
	}
}
