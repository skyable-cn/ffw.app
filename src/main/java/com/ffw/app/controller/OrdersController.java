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

import com.ffw.api.model.PageData;
import com.ffw.api.util.DateUtil;
import com.ffw.app.constant.IConstant;
import com.ffw.app.model.ReturnModel;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class OrdersController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/goBuy" })
	public ModelAndView index() {
		logger.info("进入立即购买");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "goods/find", pd,
				PageData.class);
		mv.addObject("pd", pd);

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> cardsData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"cards/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("cardsData", cardsData);

		mv.setViewName("orders/index");
		return mv;
	}

	@RequestMapping(value = { "/orders/save" })
	@ResponseBody
	public ReturnModel sellerSave() throws Exception {
		logger.info("提交订单保存");
		PageData pd = new PageData();
		pd = this.getPageData();
		String CARD_ID = pd.getString("CARD_ID");
		String GOODS_ID = pd.getString("GOODS_ID");
		String NUMBER = pd.getString("NUMBER");

		pd.put("ORDERSN",
				new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
						+ randomNumber(5));
		pd.put("MEMBER_ID", memberId());
		pd.put("CDT", DateUtil.getTime());
		pd.put("STATE", IConstant.STRING_0);
		ReturnModel rm = new ReturnModel();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/save", pd,
				PageData.class);
		rm.setFlag(true);
		rm.setMessage(getMessage("MSG_CODE_ADD_SUCCESS", new Object[] { "订单" },
				""));
		rm.setData(pd);

		PageData pdc = new PageData();
		pdc.put("CARD_ID", CARD_ID);
		pdc.put("STATE", IConstant.STRING_1);
		pdc.put("ORDER_ID", pd.getString("ORDER_ID"));
		rest.post(IConstant.FFW_SERVICE_KEY, "cards/edit", pdc, PageData.class);

		PageData pdg = new PageData();
		pdg.put("GOODS_ID", GOODS_ID);
		pdg = rest.post(IConstant.FFW_SERVICE_KEY, "goods/find", pdg,
				PageData.class);

		PageData pdoi = new PageData();
		pdoi.put("ORDER_ID", pd.getString("ORDER_ID"));
		pdoi.put("GOODS_ID", GOODS_ID);
		pdoi.put("MONEY", pdg.getString("SELLMONEY"));
		pdoi.put("NUMBER", NUMBER);
		rest.post(IConstant.FFW_SERVICE_KEY, "ordersitem/save", pdoi,
				PageData.class);

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

	@RequestMapping(value = { "/orders/waitpay" })
	public ModelAndView waitPay() {
		logger.info("进入待支付");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_0);
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersData", ordersData);

		mv.setViewName("orders/waitpay");
		return mv;
	}

	@RequestMapping(value = { "/orders/payed" })
	public ModelAndView payed() {
		logger.info("进入已支付");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_1);
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersData", ordersData);

		mv.setViewName("orders/payed");
		return mv;
	}

	@RequestMapping(value = { "/orders/waituse" })
	public ModelAndView waitUse() {
		logger.info("进入待使用");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_2);
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersData", ordersData);

		mv.setViewName("orders/waituse");
		return mv;
	}

	@RequestMapping(value = { "/orders/used" })
	public ModelAndView waitUsed() {
		logger.info("进入已使用");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		pd2.put("STATE", IConstant.STRING_3);
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersData", ordersData);

		mv.setViewName("orders/used");
		return mv;
	}

	@RequestMapping(value = { "/orders/all" })
	public ModelAndView all() {
		logger.info("进入全部订单");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		pd2.put("MEMBER_ID", memberId());
		List<PageData> ordersData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"orders/listAll", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("ordersData", ordersData);

		mv.setViewName("orders/all");
		return mv;
	}
}
