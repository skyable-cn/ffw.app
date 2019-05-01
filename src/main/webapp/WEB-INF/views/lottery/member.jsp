<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>参与人员</title>
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
			<c:forEach var="var" items="${lotteryrecordData}">
			<div class="row" style="padding:5px;border-bottom:1px #cccccc solid;">
				<div class="col-60">
					<div class="row">
						<div class="col-30" style="padding:10px;">
						<img align="middle" style="width:50px;border-radius:50%;" src="${var.PHOTO}"/>
						</div>
						<div class="col-70" style="padding-top:15px;">
						<div style="margin-bottom:5px;">${var.NICKNAME}</div>
						<div>${var.CDT}</div>
						</div>
					</div>
					
				</div>
				<div class="col-40" style="text-align:right;padding-top:25px;">${var.LUCKNUMBER}</div>
			</div>
			</c:forEach>
	    	</div>
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>