<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>饭饭网小程序</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/head.jsp"%>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
        	<header class="bar bar-nav">
			  <a href="<%=request.getContextPath()%>/home" class="icon icon-left pull-left"></a>
			  <h1 class="title">免费抽奖</h1>
			</header>
			<div class="content">
			<div class="row" style="padding:5px;">
				<div class="col-100">
			<div class="card demo-card-header-pic">
			    <a href="<%=request.getContextPath()%>/lottery/info"><div valign="bottom" class="card-header color-white no-border no-padding">
			      <img class='card-cover' style="width:100%;" height="150" src="<%=request.getContextPath()%>/static/image/goods.jpg" alt="">
			    </div></a>
			    <div class="card-content">
			      <div class="card-content-inner">
			        <p>阿里赞助</p>
			        <p>
			        1、一等奖什么<br/>
			        2、二等奖什么
			        </p>
			      </div>
			    </div>
			    <div class="card-footer">
			      <span>抽奖 2018-12-12 12:00-20:00</span>
			      <span>开奖 2018-12-12 21:00</span>
			    </div>
			  </div>
			  </div>
			  </div>
        	</div>
    	</div>
    </div>
  </body>
</html>