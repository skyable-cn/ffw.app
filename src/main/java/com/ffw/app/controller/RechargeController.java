package com.ffw.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffw.api.model.PageData;
import com.ffw.api.util.DateUtil;
import com.ffw.app.constant.IConstant;
import com.ffw.app.model.ReturnModel;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class RechargeController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/recharge/save" })
	@ResponseBody
	public ReturnModel sellerSave() throws Exception {
		logger.info("购买会员保存");
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("RECHARGESN",
				new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
						+ randomNumber(5));
		pd.put("MEMBER_ID", memberId());
		pd.put("CDT", DateUtil.getTime());
		pd.put("STATE", IConstant.STRING_0);
		ReturnModel rm = new ReturnModel();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "recharge/save", pd,
				PageData.class);
		rm.setFlag(true);
		rm.setMessage(getMessage("MSG_CODE_ADD_SUCCESS",
				new Object[] { "购买会员" }, ""));
		rm.setData(pd);

		return rm;
	}

	private String randomNumber(int length) {
		StringBuilder sb = new StringBuilder();
		Random r = new Random();
		String s = "0123456789";
		for (int i = 0; i < length; i++) {
			sb.append(s.charAt(r.nextInt(s.length())));
		}
		return sb.toString();
	}
}
