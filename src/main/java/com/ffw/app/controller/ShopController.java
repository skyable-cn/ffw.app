package com.ffw.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.Page;
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

	@RequestMapping(value = { "/shop/search" })
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

	@RequestMapping(value = { "/shop/info" })
	public ModelAndView info() {
		logger.info("进入商家详情");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd = rest.post(IConstant.FFW_SERVICE_KEY, "shop/find", pd,
				PageData.class);
		mv.addObject("pd", pd);

		PageData pd4 = new PageData();
		pd4.put("STATE", IConstant.STRING_1);
		pd4.put("SHOP_ID", pd.getString("SHOP_ID"));
		List<PageData> goodsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"goods/listAll", pd4,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("goodsData", goodsData);

		mv.setViewName("shop/info");
		return mv;
	}

}
