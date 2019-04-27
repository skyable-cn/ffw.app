package com.ffw.app.controller;

import java.util.List;
import java.util.Map;

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
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class SellerController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/seller" })
	public ModelAndView index() {
		logger.info("进入商家入驻");
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
		logger.info("初始化商家入驻");
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
		logger.info("商家入驻保存");
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("CDT", DateUtil.getTime());
		pd.put("SHOPSTATE_ID", IConstant.STRING_1);

		pd.put("MEMBER_ID", memberId());
		pd.put("AVGMONEY", IConstant.STRING_0);

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
		logger.info("商家后台分店列表");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pdm = new PageData();
		pdm.put("MEMBER_ID", memberId());
		List<PageData> shopData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"shop/listAll", pdm,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("shopData", shopData);

		mv.setViewName("seller/list");
		return mv;
	}

	@RequestMapping(value = { "/seller/manage" })
	public ModelAndView manage() {
		logger.info("商家后台");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData shop = new PageData();
		shop.put("SHOP_ID", pd.getString("SHOP_ID"));
		shop = rest.post(IConstant.FFW_SERVICE_KEY, "shop/find", shop,
				PageData.class);
		mv.addObject("shop", shop);

		PageData pd1 = new PageData();
		pd1.put("SHOP_ID", pd.getString("SHOP_ID"));
		List<PageData> standData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"stand/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("standData", standData);

		Map<String, String> config = JSSDKUtil
				.config("https://fanfan.skyable.cn/app/seller/manage?SHOP_ID="
						+ pd.getString("SHOP_ID"));
		mv.addObject("config", config);

		mv.setViewName("seller/manage");
		return mv;
	}

	@RequestMapping(value = { "/orders/search" })
	@ResponseBody
	public PageData ordersSearch() {
		logger.info("进入核销查询");
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		pd1.put("page_currentPage", pd.getString("page_currentPage"));
		pd1.put("SHOP_ID", pd.getString("SHOP_ID"));
		pd1.put("SQLCONDITION", " AND os.STATE IN ( '2' , '3' ) ");
		pd1.put("keywords", pd.getString("keywords"));
		Page page = rest.post(IConstant.FFW_SERVICE_KEY, "orders/listPage",
				pd1, Page.class);
		pd.put("page", page);
		return pd;
	}
}
