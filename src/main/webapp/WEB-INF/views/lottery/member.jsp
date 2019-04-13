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
				<div class="col-50">
					<img align="middle" style="margin:10px; width:50px;border-radius:50%;margin-left:50px;" src="${var.PHOTO}"/>
				</div>
				<div class="col-50">
					<div class="row">
						<div class="col-100" style="font-weight:bold;">${var.NICKNAME}</div>
					</div>
					<div class="row">
						<div class="col-100" style="font-weight:bold;">${var.LUCKNUMBER}</div>
					</div>
					<div class="row">
						<div class="col-100" style="font-weight:bold;">${var.CDT}</div>
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