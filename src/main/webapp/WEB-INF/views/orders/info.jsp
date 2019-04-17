<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单详情</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content">
			  <div class="list-block" style="margin-top:0px;">
    <ul>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">订单编号</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${order.ORDERSN}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">下单时间</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${order.CDT}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">商品</div>
            <div class="item-input" style="padding:10px;">
              <img src="<%=request.getContextPath()%>/file/image?FILENAME=${order.FILEPATH}" width="200">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">商品描述</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${order.GOODSDESC}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">商品单价</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${pd.SHOPNAME}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">商品数量</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${pd.SHOPNAME}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">姓名</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${order.USEPERSON}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">电话</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${order.PERSONPHONE}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">状态</div>
            <div class="item-input"><span style="border:1px #444444 solid;border-radius: 5px;padding: 5px;font-size: 14px;">
              <c:choose>
			    	<c:when test="${order.STATE eq 0}">待付款</c:when>
			    	<c:when test="${order.STATE eq 1}">已支付</c:when>
			    	<c:when test="${order.STATE eq 2}">待使用</c:when>
			    	<c:when test="${order.STATE eq 3}">已使用</c:when>
			    	<c:when test="${order.STATE eq 5}">已退款</c:when>
			    	<c:otherwise>未知</c:otherwise>
			    </c:choose></span>
            </div>
          </div>
        </div>
      </li>
      <c:if test="${order.STATE eq 2}">
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">核销码</div>
            <div class="item-input" style="padding:10px;">
              <img alt="" src="<%=request.getContextPath()%>/orders/barcode?ORDER_ID=${order.ORDER_ID}">
            </div>
          </div>
        </div>
      </li>
      </c:if>
      </ul>
      </div>
				
        	</div>

    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>