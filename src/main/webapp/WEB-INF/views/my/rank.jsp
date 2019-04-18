<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>排行榜</title>
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
				<div class="row">
					<div class="col-100">
					 	<img height="150" width="100%" src="<%=request.getContextPath()%>/static/image/rank.jpg" alt="">
					</div>
				</div>
				<div class="row">
					<div class="col-100" style="padding:5px;">
					<div class="buttons-tab">
    <a href="#tab1" class="tab-link active button">佣金排行</a>
    <a href="#tab2" class="tab-link button">人数排行</a>
  </div>
  <div class="content-block" style="margin: 0px;padding: 0px;">
    <div class="tabs">
      <div id="tab1" class="tab active">
      <c:forEach var="var" items="${chargesData}" varStatus="status">
      <c:if test="${USER_SESSION.MEMBER_ID eq var.MEMBER_ID}">
    <div class="list-block" style="margin-top:5px;margin-bottom:5px;">
    <ul>
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title">${status.index+1}&nbsp;<img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var.PHOTO}"/>${var.NICKNAME}</div>
          <div class="item-after">${var.ACCOUNTBALANCE}元</div>
        </div>
      </li>
    </ul>
    </div>
    </c:if>
    </c:forEach>
	<div class="list-block" style="margin-top:0px;">
    <ul>
	<c:forEach var="var" items="${chargesData}" varStatus="status">
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title"><c:if test="${status.index <= 2 }"><img align="middle" width="40" src="<%=request.getContextPath()%>/static/icon/top${status.index}.png"/></c:if><img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var.PHOTO}"/>${var.NICKNAME}</div>
          <div class="item-after">${var.ACCOUNTBALANCE}元</div>
        </div>
      </li>
      </c:forEach>
    </ul>
  </div>
      </div>
      <div id="tab2" class="tab">
      
      <c:forEach var="var" items="${numberData}" varStatus="status">
      <c:if test="${USER_SESSION.MEMBER_ID eq var.MEMBER_ID}">
    <div class="list-block" style="margin-top:5px;margin-bottom:5px;">
    <ul>
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title">${status.index+1}&nbsp;<img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var.PHOTO}"/>${var.NICKNAME}</div>
          <div class="item-after">${var.COUNT}人</div>
        </div>
      </li>
    </ul>
    </div>
    </c:if>
    </c:forEach>
	<div class="list-block" style="margin-top:0px;">
    <ul>
	<c:forEach var="var" items="${numberData}" varStatus="status">
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title"><c:if test="${status.index <= 2 }"><img align="middle" width="40" src="<%=request.getContextPath()%>/static/icon/top${status.index}.png"/></c:if><img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var.PHOTO}"/>${var.NICKNAME}</div>
          <div class="item-after">${var.COUNT}人</div>
        </div>
      </li>
      </c:forEach>
    </ul>
  </div>
      
      </div>
     </div>
					
					</div>
				</div>
			</div>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>