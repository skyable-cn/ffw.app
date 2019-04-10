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
public class HomeController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/home" })
	public ModelAndView index() {
		logger.info("进入首页");
		ModelAndView mv = new ModelAndView();

		PageData pd1 = new PageData();
		pd1.put("MEMBER_ID", memberId());
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersNum", ordersData.size());

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsNum", cardsData.size());

		PageData pd3 = new PageData();
		List<PageData> standData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"stand/listAll", pd3,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("standData", standData);

		PageData pd4 = new PageData();
		pd4.put("STATE", IConstant.STRING_1);
		pd4.put("SEARCHTYPE", IConstant.STRING_1);
		List<PageData> goodsDatatj = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "goods/listAll", pd4,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("goodsDatatj", goodsDatatj);

		PageData pd5 = new PageData();
		pd5.put("STATE", IConstant.STRING_1);
		pd5.put("SEARCHTYPE", IConstant.STRING_2);
		List<PageData> goodsDatazr = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "goods/listAll", pd5,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("goodsDatazr", goodsDatazr);

		mv.setViewName("home/index");
		mv.addObject("nav", "home");
		return mv;
	}
}
