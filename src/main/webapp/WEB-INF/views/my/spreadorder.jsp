<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>推广订单</title>
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
			<div class="row" style="background-color:#FFCC01;height:150px;">
				<div class="col-50" style="padding:20px;">
				累积推广订单<br/>
				${fn:length(orderData)}&nbsp;/&nbsp;单
				</div>
				<div class="col-50" style="padding:20px;text-align:right;">
				<img width="60" src="<%=request.getContextPath()%>/static/icon/my/wddd.png"/>
				</div>
			</div>
			<div class="list-block" style="margin-top:5px;">
    <ul>
    <li class="item-content">
        <div class="item-inner">
          <div class="item-title">订单</div>
          <div class="item-after">返利金额</div>
        </div>
      </li>
	<c:forEach var="var" items="${orderData}" varStatus="status">
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title">${var.ORDERSN}</div>
          <div class="item-after">${var.MONEY}元</div>
        </div>
      </li>
      </c:forEach>
    </ul>	
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>