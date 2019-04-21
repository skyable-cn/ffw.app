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
public class MyController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/my" })
	public ModelAndView index() {
		logger.info("进入我的");
		ModelAndView mv = new ModelAndView();

		PageData old = (PageData) getSession().getAttribute(
				IConstant.USER_SESSION);
		old = rest.post(IConstant.FFW_SERVICE_KEY, "member/find", old,
				PageData.class);
		getSession().setAttribute(IConstant.USER_SESSION, old);

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsNum", cardsData.size());

		PageData vipinfo = new PageData();
		vipinfo.put("MEMBER_ID", memberId());
		vipinfo = rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/findBy",
				vipinfo, PageData.class);
		mv.addObject("vipinfo", vipinfo);

		PageData supermaninfo = new PageData();
		supermaninfo.put("MEMBER_ID", memberId());
		supermaninfo = rest.post(IConstant.FFW_SERVICE_KEY,
				"supermaninfo/findBy", supermaninfo, PageData.class);
		mv.addObject("supermaninfo", supermaninfo);

		mv.setViewName("my/index");
		mv.addObject("nav", "my");
		return mv;
	}

	@RequestMapping(value = { "/my/cards" })
	public ModelAndView indexCards() {
		logger.info("进入我的卡券");
		ModelAndView mv = new ModelAndView();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsData", cardsData);

		mv.setViewName("my/cards");
		return mv;
	}

	@RequestMapping(value = { "/my/account" })
	public ModelAndView indexAccount() {
		logger.info("进入我的金库");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		pd1.put("MEMBER_ID", memberId());
		pd1.put("WXOPEN_ID", userSession().getString("WXOPEN_ID"));
		pd1 = rest.post(IConstant.FFW_SERVICE_KEY, "member/findIncome", pd1,
				PageData.class);
		mv.addObject("pd1", pd1);

		PageData pd2 = new PageData();
		pd2.put("WXOPEN_ID", userSession().getString("WXOPEN_ID"));
		List<PageData> incomeData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"member/listIncome", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("incomeData", incomeData);

		mv.setViewName("my/account");

		return mv;
	}

	@RequestMapping(value = { "/withdraw/save" })
	@ResponseBody
	public ReturnModel complateSave() {
		logger.info("进入提现信息保存");
		ReturnModel rm = new ReturnModel();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MEMBER_ID", memberId());
		pd.put("CDT", DateUtil.getTime());
		pd.put("STATE", IConstant.STRING_0);
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "withdraw/save", pd,
				PageData.class);

		PageData pdm = new PageData();
		pdm.put("MEMBER_ID", memberId());
		pdm.put("WAITACCOUNT",
				String.valueOf(Double.parseDouble(userSession().getString(
						"WAITACCOUNT"))
						- Double.parseDouble(pd.getString("MONEY"))));
		pdm.put("ALREADYACCOUNT",
				String.valueOf(Double.parseDouble(userSession().getString(
						"ALREADYACCOUNT"))
						+ Double.parseDouble(pd.getString("MONEY"))));
		rest.post(IConstant.FFW_SERVICE_KEY, "member/edit", pdm, PageData.class);

		rm.setFlag(true);
		rm.setData(pd);
		return rm;
	}

}
