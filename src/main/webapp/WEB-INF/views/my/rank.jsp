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
  <div class="content-block">
    <div class="tabs">
      <div id="tab1" class="tab active">
      </div>
      <div id="tab2" class="tab">
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