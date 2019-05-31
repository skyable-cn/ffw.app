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
public class RankController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/rank" })
	public ModelAndView complate() {
		logger.info("进入排行榜");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		pd1.put("MARKET_ID", marketId());
		pd1.put("CLASS", IConstant.STRING_CLASS_WX);
		List<PageData> chargesData = rest.postForList(IConstant.FFW_SERVICE_KEY, "member/listCharges", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("chargesData", chargesData);

		PageData pd2 = new PageData();
		pd2.put("MARKET_ID", marketId());
		pd2.put("CLASS", IConstant.STRING_CLASS_WX);
		List<PageData> numberData = rest.postForList(IConstant.FFW_SERVICE_KEY, "member/listNumber", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("numberData", numberData);

		mv.setViewName("my/rank");
		return mv;
	}
}
