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
					<div class="card" onclick="changeMoney('${var.CARD_ID}','${var.MONEY}')">
				    <div class="card-content">
				      <div class="card-content-inner" style="height:100px;background:#FE0100;color:#FFFFFF;font-size:1.0rem;">${var.DESCRIPTION}</div>
				    </div>
				    <div class="card-footer" style="text-align:right;background:#FFCC01;font-size:0.65rem;"><span></span><span>有效期:${var.STARTTIME} / ${var.ENDTIME}</span></div>
				  </div>
			  	</div>
			  </div>
			</c:forEach>
			<h5>&nbsp;</h5>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>