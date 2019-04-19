package com.ffw.app.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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
import com.ffw.app.util.JSSDKUtil;
import com.ffw.app.util.RestTemplateUtil;

@Controller
public class DiscountController extends BaseController {

	@Autowired
	RestTemplateUtil rest;

	@RequestMapping(value = { "/discount" })
	public ModelAndView index() {
		logger.info("进入周四五折");
		// PageData location = location();

		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pdm = new PageData();
		List<PageData> typeData = rest.postForList(IConstant.FFW_SERVICE_KEY,
				"shop/listAllType", pdm,
				new ParameterizedTypeReference<List<PageData>>() {
				});
		mv.addObject("typeData", typeData);

		// PageData pd1 = new PageData();
		// if (null != location) {
		// pd1.put("LATITUDE", location.getString("LATITUDE"));
		// pd1.put("LONGITUDE", location.getString("LONGITUDE"));
		// }
		// pd1.put("SHOPSTATE_ID", IConstant.STRING_2);
		// pd1.put("SHOPTYPE_ID", pd.getString("SHOPTYPE_ID"));
		// pd1.put("SQLCONDITION",
		// sql(pd.getString("DISTANCE"), pd.getString("SXORDER"),
		// pd.getString("SXSELECT")));
		// pd1.put("page_currentPage", pd.getString("page_currentPage"));
		// List<PageData> shopData = rest.postForList(IConstant.FFW_SERVICE_KEY,
		// "shop/listAll", pd1,
		// new ParameterizedTypeReference<List<PageData>>() {
		// });
		// mv.addObject("shopData", shopData);

		// Page page = rest.post(IConstant.FFW_SERVICE_KEY, "shop/listPage",
		// pd1,
		// Page.class);

		pd.put("ZSFLAG", IConstant.STRING_0);
		if (DateUtil.getWeek() == 4) {
			pd.put("ZSFLAG", IConstant.STRING_1);
		}

		Map<String, String> config = JSSDKUtil
				.config("https://fanfan.skyable.cn/app/discount");
		pd.put("config", config);

		// mv.addObject("page", page);
		mv.addObject("pd", pd);
		mv.setViewName("discount/index");
		return mv;
	}

	@RequestMapping(value = { "/discount/search" })
	@ResponseBody
	public PageData indexSearch() {
		logger.info("进入周四五折查询");
		PageData location = location();
		PageData pd = new PageData();
		pd = this.getPageData();

		PageData pd1 = new PageData();
		if (null != location) {
			pd1.put("LATITUDE", location.getString("LATITUDE"));
			pd1.put("LONGITUDE", location.getString("LONGITUDE"));
		}
		pd1.put("SHOPSTATE_ID", IConstant.STRING_2);
		pd1.put("SHOPTYPE_ID", pd.getString("SHOPTYPE_ID"));
		pd1.put("SQLCONDITION",
				sql(pd.getString("DISTANCE"), pd.getString("SXORDER"),
						pd.getString("SXSELECT")));
		pd1.put("page_currentPage", pd.getString("page_currentPage"));
		// List<PageData> shopData = rest.postForList(IConstant.FFW_SERVICE_KEY,
		// "shop/listAll", pd1,
		// new ParameterizedTypeReference<List<PageData>>() {
		// });

		Page page = rest.post(IConstant.FFW_SERVICE_KEY, "shop/listPage", pd1,
				Page.class);

		pd.put("page", page);
		return pd;
	}

	private String sql(String distance, String order, String selecte) {
		StringBuilder sb = new StringBuilder();

		if (StringUtils.isNotEmpty(distance)) {
			if (IConstant.STRING_1.equals(distance)) {
				sb.append(" order by s.DISTANCE ASC ");
			} else {
				sb.append(" order by s.DISTANCE DESC ");
			}
		}

		if (StringUtils.isNotEmpty(order)) {

			if (sb.length() > 0) {
				if (IConstant.STRING_1.equals(order)) {
					sb.append(" , s.AVGMONEY ASC ");
				} else if (IConstant.STRING_2.equals(order)) {
					sb.append(" , s.AVGMONEY DESC ");
				}
			} else {
				if (IConstant.STRING_1.equals(order)) {
					sb.append(" order by s.AVGMONEY ASC ");
				} else if (IConstant.STRING_2.equals(order)) {
					sb.append(" order by s.AVGMONEY DESC ");
				}
			}
		}
		System.err.println(sb.toString());
		return sb.toString();
	}
}
