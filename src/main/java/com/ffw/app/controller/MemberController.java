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
public class MemberController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/member" })
	public ModelAndView index() {
		logger.info("进入会员页面");
		ModelAndView mv = new ModelAndView();

		PageData old = (PageData) getSession().getAttribute(
				IConstant.USER_SESSION);
		old = rest.post(IConstant.FFW_SERVICE_KEY, "member/find", old,
				PageData.class);
		getSession().setAttribute(IConstant.USER_SESSION, old);

		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		List<PageData> productData = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "product/listAll", pd1,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("productData", productData);

		PageData vipinfo = new PageData();
		vipinfo.put("MEMBER_ID", memberId());
		vipinfo = rest.post(IConstant.FFW_SERVICE_KEY, "vipinfo/findBy",
				vipinfo, PageData.class);
		mv.addObject("vipinfo", vipinfo);

		PageData friends = new PageData();
		friends.put("FROMWXOPEN_ID", openId());
		List<PageData> friendData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"member/listAll", friends,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		if (friendData.size() > 2) {
			friendData = friendData.subList(0, 2);
		}
		mv.addObject("friendData", friendData);

		mv.setViewName("member/index");
		mv.addObject("nav", "member");
		return mv;
	}

}
