package com.ffw.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.Page;
import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class StandController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/stand" })
	public ModelAndView index() {
		logger.info("进入展位列表");
		ModelAndView mv = new ModelAndView();

		mv.setViewName("stand/index");
		return mv;
	}

	@RequestMapping(value = { "/stand/search" })
	@ResponseBody
	public PageData indexSearch() {
		logger.info("进入展位查询");
		PageData pd = new PageData();
		pd = this.getPageData();
		Page page = rest.post(IConstant.FFW_SERVICE_KEY, "stand/listPage", pd,
				Page.class);
		pd.put("page", page);
		return pd;
	}

}
