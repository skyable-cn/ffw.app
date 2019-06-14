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
public class HomeController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/home" })
	public ModelAndView index() {
		logger.info("进入首页");
		ModelAndView mv = new ModelAndView();

		PageData pd1 = new PageData();
		pd1.put("MEMBER_ID", memberId());
		pd1.put("CLASS", IConstant.STRING_CLASS_WX);
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY, "orders/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersNum", ordersData.size());

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY, "cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsNum", cardsData.size());

		PageData pd3 = new PageData();
		pd3.put("STATE", IConstant.STRING_1);
		pd3.put("MARKET_ID", marketId());
		List<PageData> standData = rest.postForList(IConstant.FFW_SERVICE_KEY, "stand/listAll", pd3,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		if (standData.size() > 3) {
			standData = standData.subList(0, 3);
		}

		mv.addObject("standData", standData);

		mv.setViewName("home/index");
		mv.addObject("nav", "home");
		return mv;
	}

	@RequestMapping(value = { "/home/search" })
	@ResponseBody
	public PageData indexSearch() {
		logger.info("进入首页查询");
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		pd1.put("MARKET_ID", marketId());
		pd1.put("WXFLAG", IConstant.STRING_1);
		pd1.put("STATE", IConstant.STRING_1);
		pd1.put("SEARCHTYPE", IConstant.STRING_1);
		pd1.put("page_currentPage", pd.getString("page_currentPage"));
		Page page = rest.post(IConstant.FFW_SERVICE_KEY, "goods/listPage", pd1, Page.class);

		PageData pd2 = new PageData();
		pd2.put("MARKET_ID", marketId());
		pd2.put("WXFLAG", IConstant.STRING_1);
		pd2.put("STATE", IConstant.STRING_1);
		pd2.put("SEARCHTYPE", IConstant.STRING_2);
		pd2.put("page_currentPage", pd.getString("page_currentPage"));
		Page page1 = rest.post(IConstant.FFW_SERVICE_KEY, "goods/listPage", pd2, Page.class);

		pd.put("page", page);
		pd.put("page1", page1);
		return pd;
	}
}
