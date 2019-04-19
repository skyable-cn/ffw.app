package com.ffw.app.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
public class SupermaninfoController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/supermaninfo" })
	public ModelAndView complate() {
		logger.info("进入达人申请");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pds = new PageData();
		pds.put("MEMBER_ID", memberId());
		pds = rest.post(IConstant.FFW_SERVICE_KEY, "supermaninfo/findBy", pds,
				PageData.class);
		mv.addObject("supermaninfo", pds);

		mv.setViewName("my/supermaninfo");
		return mv;
	}

	@RequestMapping(value = { "/supermaninfo/save" })
	@ResponseBody
	public ReturnModel complateSave() {
		logger.info("进入达人申请保存");
		ReturnModel rm = new ReturnModel();
		PageData pd = new PageData();
		pd = this.getPageData();

		if (StringUtils.isEmpty(pd.getString("SUPERMANINFO_ID"))) {
			pd.put("CDT", DateUtil.getTime());
			pd.put("MEMBER_ID", memberId());
			pd.put("SUPERMANINFO_ID", null);
			pd = rest.post(IConstant.FFW_SERVICE_KEY, "supermaninfo/save", pd,
					PageData.class);

			String MEMBERTYPE_ID = userSession().getString("MEMBERTYPE_ID");
			PageData pdmember = new PageData();
			pdmember.put("MEMBER_ID", memberId());
			if (MEMBERTYPE_ID.equals(IConstant.STRING_1)) {
				pdmember.put("MEMBERTYPE_ID", IConstant.STRING_3);
			} else if (MEMBERTYPE_ID.equals(IConstant.STRING_2)) {
				pdmember.put("MEMBERTYPE_ID", IConstant.STRING_4);
			}
			rest.post(IConstant.FFW_SERVICE_KEY, "member/edit", pdmember,
					PageData.class);

		} else {
			rest.post(IConstant.FFW_SERVICE_KEY, "supermaninfo/edit", pd,
					PageData.class);
		}

		rm.setFlag(true);
		rm.setData(pd);
		return rm;
	}
}
