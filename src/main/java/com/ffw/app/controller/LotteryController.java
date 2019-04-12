package com.ffw.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
public class LotteryController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/lottery" })
	public ModelAndView index() {
		logger.info("进入免费抽奖");
		ModelAndView mv = new ModelAndView();

		mv.setViewName("lottery/index");
		return mv;
	}

	@RequestMapping(value = { "/lottery/search" })
	@ResponseBody
	public PageData indexSearch() {
		logger.info("进入免费抽奖查询");

		PageData pd = new PageData();
		Page page = rest.post(IConstant.FFW_SERVICE_KEY, "lottery/listPage",
				pd, Page.class);
		pd.put("page", page);
		return pd;
	}

	@RequestMapping(value = { "/lottery/info" })
	public ModelAndView info() throws Exception {
		logger.info("进入抽奖详情");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "lottery/find", pd,
				PageData.class);

		Date now = new Date();
		Date start = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd
				.getString("STARTTIME"));
		Date end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd
				.getString("ENDTIME"));
		Date show = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd
				.getString("SHOWTIME"));
		pd.put("USESTATE", IConstant.STRING_0);
		if (now.getTime() - start.getTime() < 0) {
			pd.put("USESTATE", IConstant.STRING_0);
		}
		if (now.getTime() - start.getTime() >= 0
				&& now.getTime() - end.getTime() < 0) {
			pd.put("USESTATE", IConstant.STRING_1);
		}
		if (now.getTime() - end.getTime() >= 0
				&& now.getTime() - show.getTime() < 0) {
			pd.put("USESTATE", IConstant.STRING_2);
		}
		if (now.getTime() - show.getTime() >= 0) {
			pd.put("USESTATE", IConstant.STRING_3);
		}
		mv.addObject("pd", pd);

		PageData pd1 = new PageData();
		pd1.put("MEMBER_ID", memberId());
		pd1.put("LOTTERY_ID", pd.getString("LOTTERY_ID"));
		pd1 = rest.post(IConstant.FFW_SERVICE_KEY, "lotteryrecord/findBy", pd1,
				PageData.class);
		mv.addObject("pdme", pd1);

		PageData pd2 = new PageData();
		pd2.put("LOTTERY_ID", pd.getString("LOTTERY_ID"));
		List<PageData> lotteryrecordData = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "lotteryrecord/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("lotteryrecordData", lotteryrecordData);

		mv.setViewName("lottery/info");
		return mv;
	}

	@RequestMapping(value = { "/lottery/member" })
	public ModelAndView member() {
		logger.info("进入抽奖人员名单");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("LOTTERY_ID", pd.getString("LOTTERY_ID"));
		List<PageData> lotteryrecordData = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "lotteryrecord/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("lotteryrecordData", lotteryrecordData);

		mv.setViewName("lottery/member");
		return mv;
	}

	@RequestMapping(value = { "/lottery/member/selected" })
	public ModelAndView memberSelected() {
		logger.info("进入中奖人员名单");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("LOTTERY_ID", pd.getString("LOTTERY_ID"));
		pd2.put("STATE", IConstant.STRING_1);
		List<PageData> lotteryrecordData = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "lotteryrecord/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("lotteryrecordData", lotteryrecordData);

		mv.setViewName("lottery/memberselected");
		return mv;
	}

	@RequestMapping(value = { "/lottery/save" })
	@ResponseBody
	public ReturnModel lotterySave() throws Exception {
		logger.info("参与抽奖保存");
		PageData pd = new PageData();
		pd = this.getPageData();

		pd.put("MEMBER_ID", memberId());
		pd.put("CDT", DateUtil.getTime());
		String luckNumber = luckNumber(10);
		pd.put("LUCKNUMBER", luckNumber);
		pd.put("STATE", IConstant.STRING_0);
		ReturnModel rm = new ReturnModel();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "lotteryrecord/save", pd,
				PageData.class);
		rm.setFlag(true);
		rm.setData(luckNumber);
		rm.setMessage(getMessage("MSG_CODE_ADD_SUCCESS",
				new Object[] { "抽奖记录" }, ""));
		return rm;
	}

	private String luckNumber(int length) {
		StringBuilder sb = new StringBuilder();
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		for (int i = 0; i < length; i++) {
			sb.append(s.charAt(r.nextInt(s.length())));
		}
		return sb.toString();
	}

}
