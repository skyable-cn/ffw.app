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
public class SearchController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/search" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/index");
		mv.addObject("nav", "search");
		return mv;
	}

	@RequestMapping(value = { "/search/search" })
	@ResponseBody
	public PageData indexSearch() {
		logger.info("进入搜索查询");
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		pd1.put("STATE", IConstant.STRING_1);
		pd1.put("SEARCHTYPE", IConstant.STRING_1);
		pd1.put("page_currentPage", pd.getString("page_currentPage"));
		pd1.put("keywords", pd.getString("keywords"));
		pd1.put("LATITUDE", pd.getString("LATITUDE"));
		pd1.put("LONGITUDE", pd.getString("LONGITUDE"));
		pd1.put("DISTANCE", pd.getString("DISTANCE"));
		Page page = rest.post(IConstant.FFW_SERVICE_KEY, "goods/listPage", pd1,
				Page.class);

		PageData pd2 = new PageData();
		pd2.put("STATE", IConstant.STRING_1);
		pd2.put("SEARCHTYPE", IConstant.STRING_2);
		pd2.put("page_currentPage", pd.getString("page_currentPage"));
		pd2.put("keywords", pd.getString("keywords"));
		pd2.put("LATITUDE", pd.getString("LATITUDE"));
		pd2.put("LONGITUDE", pd.getString("LONGITUDE"));
		pd2.put("DISTANCE", pd.getString("DISTANCE"));
		Page page1 = rest.post(IConstant.FFW_SERVICE_KEY, "goods/listPage",
				pd2, Page.class);

		pd.put("page", page);
		pd.put("page1", page1);
		return pd;
	}

}
