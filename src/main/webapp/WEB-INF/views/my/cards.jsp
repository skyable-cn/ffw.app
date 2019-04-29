<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的卡券</title>
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
			<c:forEach var="var" items="${cardsData}">
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<div class="card" style="background:#efeff4;" onclick="changeMoney('${var.CARD_ID}','${var.MONEY}')">
				    <div class="card-content">
				      <div class="card-content-inner" style="border-top-left-radius:5px;border-top-right-radius:5px;height:80px;background:#FE0100;color:#FFFFFF;font-weight:normal;">
				      <div class="row">
				      	<div class="col-30" style="padding-left:15px;line-height:2.5rem;font-size:1.5rem;">${var.MONEY}元</div>
				      	<div class="col-60">
				      	<div style="font-size:0.85rem;">代金券</div>
				      	<div>全场通用</div>
				      	</div>
				      </div>
				      </div>
				    </div>
				    <div class="card-footer" style="border-bottom-left-radius:5px;border-bottom-right-radius:5px;text-align:right;background:#FFCC01;font-weight:normal;"><span></span><span>有效期:${var.STARTTIME} / ${var.ENDTIME}</span></div>
				  </div>
			  </div>
			  </div>
			</c:forEach>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>