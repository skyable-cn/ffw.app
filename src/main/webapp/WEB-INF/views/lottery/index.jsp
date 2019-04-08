<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>免费抽奖</title>
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
				<c:forEach var="var" items="${lotteryData}">
			<div class="row" style="padding:5px;">
				<div class="col-100">
			<div class="card demo-card-header-pic">
			    <a class="external" href="<%=request.getContextPath()%>/lottery/info?LOTTERY_ID=${var.LOTTERY_ID}"><div valign="bottom" class="card-header color-white no-border no-padding">
			      <img class='card-cover' style="width:100%;" height="200" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="">
			    </div></a>
			    <div class="card-content">
			      <div class="card-content-inner">
			        <p>${var.SPONSORNAME}</p>
			        <p>${var.LOTTERYRULE}</p>
			      </div>
			    </div>
			    <div class="card-footer">
			      <span>抽奖${var.STARTTIME}</span>
			      <span>开奖${var.ENDTIME}</span>
			    </div>
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