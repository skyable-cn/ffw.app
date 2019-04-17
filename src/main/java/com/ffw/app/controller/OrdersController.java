package com.ffw.app.controller;

import java.awt.image.BufferedImage;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;
import org.krysalis.barcode4j.HumanReadablePlacement;
import org.krysalis.barcode4j.impl.code39.Code39Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ffw.api.model.PageData;
import com.ffw.api.util.DateUtil;
import com.ffw.app.config.WXPayConfigImpl;
import com.ffw.app.config.WechatMiniConfig;
import com.ffw.app.constant.IConstant;
import com.ffw.app.model.ReturnModel;
import com.ffw.app.util.RestTemplateUtil;
import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConstants.SignType;

@Controller
public class OrdersController extends BaseController {

	@Autowired
	WechatMiniConfig wechatMiniConfig;

	@Autowired
	WXPayConfigImpl config;

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
		if (Double.parseDouble(pd.getString("MONEY")) > 0) {
			pd.put("STATE", IConstant.STRING_0);
		} else {
			pd.put("STATE", IConstant.STRING_1);
		}

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

	@RequestMapping(value = { "/orders/useinfo" })
	public ModelAndView complate() {
		logger.info("进入订单确认信息");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", pd,
				PageData.class);
		mv.addObject("pd", pd);

		mv.setViewName("orders/useinfo");
		return mv;
	}

	@RequestMapping(value = { "/orders/useinfo/save" })
	@ResponseBody
	public ReturnModel complateSave() {
		logger.info("进入订单确认信息保存");
		ReturnModel rm = new ReturnModel();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", IConstant.STRING_2);
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/edit", pd,
				PageData.class);
		rm.setFlag(true);
		rm.setData(pd);
		return rm;
	}

	@RequestMapping(value = { "/orders/refund" })
	public ModelAndView refund() {
		logger.info("进入订单退款信息");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd2 = new PageData();
		List<PageData> refundTypeData = rest.postForList(
				IConstant.FFW_SERVICE_KEY, "orders/listAllRefund", pd2,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("refundTypeData", refundTypeData);
		mv.addObject("pd", pd);

		mv.setViewName("orders/refund");
		return mv;
	}

	@RequestMapping(value = { "/orders/refund/save" })
	@ResponseBody
	public Map<String, String> refundSave() {
		logger.info("进入订单退款信息保存");
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pdo = new PageData();
		pdo = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", pd,
				PageData.class);

		WXPay wxpay = new WXPay(config, SignType.MD5);

		Map<String, String> reqData = new HashMap<String, String>();

		reqData.put("transaction_id", pdo.getString("WEIXINSN"));

		reqData.put("out_refund_no", pdo.getString("ORDERSN"));

		String fee = String
				.valueOf(Float.parseFloat(pdo.getString("MONEY")) * 100);

		reqData.put("total_fee", fee.substring(0, fee.indexOf(".")) + "");

		reqData.put("refund_fee", fee.substring(0, fee.indexOf(".")) + "");

		reqData.put("refund_desc", pd.getString("REFUNDDESC"));

		Map<String, String> refund = new HashMap<String, String>();
		try {

			refund = wxpay.refund(reqData);

			System.err.println(refund);

		} catch (Exception e) {
			e.printStackTrace();
		}

		pdo.put("STATE", IConstant.STRING_5);
		rest.post(IConstant.FFW_SERVICE_KEY, "orders/edit", pdo, PageData.class);

		pd.put("CDT", DateUtil.getTime());
		pd = rest.post(IConstant.FFW_SERVICE_KEY, "orders/saveRefund", pd,
				PageData.class);

		return refund;
	}

	@RequestMapping(value = { "/orders/info" })
	public ModelAndView info() {
		logger.info("进入订单详情");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData order = new PageData();
		order.put("ORDER_ID", pd.getString("ORDER_ID"));
		order = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", order,
				PageData.class);

		mv.addObject("order", order);

		mv.setViewName("orders/info");
		return mv;
	}

	@RequestMapping(value = { "/orders/barcode" })
	public void barcode() throws Exception {
		logger.info("进入条码生成");
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData order = new PageData();
		order.put("ORDER_ID", pd.getString("ORDER_ID"));
		order = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", order,
				PageData.class);

		String content = DigestUtils.md5Hex(order.getString("USEKEY")
				+ IConstant.KEY_SLAT);

		Code39Bean bean = new Code39Bean();
		bean.setHeight(50.0);
		bean.setMsgPosition(HumanReadablePlacement.HRP_NONE);

		final int dpi = 100;
		final double moduleWith = UnitConv.in2mm(1.0f / dpi);
		bean.setModuleWidth(moduleWith);
		bean.setWideFactor(3);
		bean.doQuietZone(false);

		BitmapCanvasProvider canvas = new BitmapCanvasProvider(getResponse()
				.getOutputStream(), "image/png", dpi,
				BufferedImage.TYPE_BYTE_BINARY, false, 0);

		bean.generateBarcode(canvas, content);

		canvas.finish();

	}

	@RequestMapping(value = { "/orders/verification" })
	public ModelAndView use() {
		logger.info("进入订单核销确认");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData order = new PageData();
		order.put("ORDER_ID", pd.getString("ORDER_ID"));
		order = rest.post(IConstant.FFW_SERVICE_KEY, "orders/find", order,
				PageData.class);

		if (!pd.getString("USEKEY").equals(
				DigestUtils.md5Hex(order.getString("USEKEY")
						+ IConstant.KEY_SLAT))) {
			order = null;
		}
		mv.addObject("order", order);
		mv.setViewName("orders/verification");
		return mv;
	}
}
