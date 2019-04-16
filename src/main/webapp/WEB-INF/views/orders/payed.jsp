<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的 - 已支付</title>
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
			<c:forEach var="var" items="${ordersData}">
			<div class="card">
			    <div class="card-header">订单:${var.ORDERSN}<c:if test="${var.WEIXINSN ne null }"><span style="float:right;"><a href="<%=request.getContextPath()%>/orders/refund?ORDER_ID=${var.ORDER_ID}" class="external button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">申请退款</a></span></c:if></div>
			    <div class="card-content">
			      <div class="list-block media-list">
			        <ul>
			          <li class="item-content">
			            <div class="item-media">
			              <img src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" width="100">
			            </div>
			            <div class="item-inner">
			              <div class="item-title-row">
			                <div class="item-title">${var.GOODSDESC}</div>
			              </div>
			              <div class="item-subtitle">总价:${var.MONEY}<span style="float:right;">数量:${var.NUMBER}</span></div>
			            </div>
			          </li>
			        </ul>
			      </div>
			    </div>
			    <div class="card-footer">
			      <span>下单时间:${var.CDT}</span><span><a href="<%=request.getContextPath()%>/orders/useinfo?ORDER_ID=${var.ORDER_ID}" class="external button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">确认信息</a></span>
			    </div>
			  </div>
			</c:forEach>
			</div>	
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>