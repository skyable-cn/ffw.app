package com.ffw.app.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.app.constant.IConstant;
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class DiscountController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/discount" })
	public ModelAndView index() {

		logger.info("进入周四五折");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.putAll(location());

		PageData pd1 = new PageData();

		pd1.put("SHOPSTATE_ID", IConstant.STRING_2);
		List<PageData> shopData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"shop/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("shopData", shopData);

		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int w = cal.get(Calendar.DAY_OF_WEEK) - 2;
		pd.put("ZSFLAG", IConstant.STRING_0);
		if (w == 4) {
			pd.put("ZSFLAG", IConstant.STRING_1);
		}

		Map<String, String> config = JSSDKUtil.config();
		pd.put("config", config);

		mv.addObject("pd", pd);
		mv.setViewName("discount/index");
		return mv;
	}
}
