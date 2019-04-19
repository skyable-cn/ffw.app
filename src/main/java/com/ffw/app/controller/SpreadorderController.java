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
public class SpreadorderController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/spreadorder" })
	public ModelAndView complate() {
		logger.info("进入推广订单");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("FROMWXOPEN_ID", userSession().getString("WXOPEN_ID"));
		pd.put("SQLCONDITION", " and os.GIVEMONEY is not null ");

		List<PageData> orderData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("orderData", orderData);

		mv.setViewName("my/spreadorder");
		return mv;
	}
}
