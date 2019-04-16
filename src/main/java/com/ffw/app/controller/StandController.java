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
import com.ffw.api.util.DateUtil;
import com.ffw.app.constant.IConstant;
import com.ffw.app.model.ReturnModel;
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

	@RequestMapping(value = { "/stand/goAdd" })
	public ModelAndView add() {
		logger.info("进入申请活动");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pdm = new PageData();
		List<PageData> typeData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"stand/listAllType", pdm,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("typeData", typeData);

		PageData pdm2 = new PageData();
		pdm2.put("STATE", IConstant.STRING_1);
		pdm2.put("SHOP_ID", pd.getString("SHOP_ID"));
		List<PageData> goodsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"goods/listAll", pdm2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("goodsData", goodsData);

		mv.addObject("pd", pd);

		mv.setViewName("stand/add");
		return mv;
	}

	@RequestMapping(value = { "/stand/save" })
	@ResponseBody
	public ReturnModel sellerSave() throws Exception {
		logger.info("申请活动保存");
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("CREATETIME", DateUtil.getTime());
		pd.put("STATE", IConstant.STRING_0);
		ReturnModel rm = new ReturnModel();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "stand/save", pd,
				PageData.class);
		rm.setFlag(true);
		rm.setMessage(getMessage("MSG_CODE_ADD_SUCCESS",
				new Object[] { "申请活动" }, ""));
		return rm;
	}

}
