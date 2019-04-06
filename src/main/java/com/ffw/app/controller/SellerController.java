package com.ffw.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.api.util.DateUtil;
import com.ffw.app.constant.IConstant;
import com.ffw.app.model.ReturnModel;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class SellerController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/seller" })
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();

		PageData pdm = new PageData();
		List<PageData> typeData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"shop/listAllType", pdm,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("typeData", typeData);

		mv.setViewName("seller/index");
		return mv;
	}

	@RequestMapping(value = { "/sellerInit" })
	public ModelAndView sellerInit() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);

		PageData pdm = new PageData();
		List<PageData> typeData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"shop/listAllType", pdm,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("typeData", typeData);

		mv.setViewName("seller/index");
		return mv;
	}

	@RequestMapping(value = { "/seller/save" })
	@ResponseBody
	public ReturnModel sellerSave() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("CDT", DateUtil.getTime());
		pd.put("SHOPSTATE_ID", IConstant.STRING_1);
		ReturnModel rm = new ReturnModel();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "shop/save", pd,
				PageData.class);
		rm.setFlag(true);
		rm.setMessage(getMessage("MSG_CODE_ADD_SUCCESS", new Object[] { "商户" },
				""));
		return rm;
	}

	@RequestMapping(value = { "/seller/list" })
	public ModelAndView list() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("seller/list");
		return mv;
	}

}
