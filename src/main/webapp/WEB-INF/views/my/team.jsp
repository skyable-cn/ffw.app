<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的团队</title>
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
					 	<img height="150" width="100%" src="<%=request.getContextPath()%>/static/image/team.jpg" alt="">
					</div>
			</div>
			<div class="row" style="border-bottom:1px #DDDDDD solid;padding:5px;">
				<div class="col-50">
				 	1
				</div>
				<div class="col-50">
				 	<div class="row"  style="border-bottom:1px #DDDDDD solid;padding:5px;">
						<div class="col-100">
						11
						</div>
					</div>
					<div class="row"  style="border-bottom:1px #DDDDDD solid;padding:5px;">
						<div class="col-100">
						11
						</div>
					</div>
					<div class="row" style="border-bottom:1px #DDDDDD solid;padding:5px;">
						<div class="col-100">
						11
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