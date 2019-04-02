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
			  <a href="<%=request.getContextPath()%>/discount" class="icon icon-left pull-left"></a>
			  <h1 class="title">商家信息</h1>
			</header>
			<div class="content">
				<p class="p_border">
					<span><img align="middle" style="margin:10px; width:80px;border-radius:50%;" src="<%=request.getContextPath()%>/static/image/shop.jpg"/></span>
					<span>重庆鸡公煲</span>
				</p>
				<p class="p_border" style="height:50px;">
				<span>陕西省西安市长安区王寺街道</span> <span style="float:right;"><img width="30" style="margin-right:15px;" src="<%=request.getContextPath()%>/static/icon/phone.png"/> | <img  style="margin-left:15px;" width="30" src="<%=request.getContextPath()%>/static/icon/send.png"/></span>
				</p>
				<p style="border-bottom:5px #fff solid;padding-bottom:20px;">
					<span style="margin-left:10px;background:#cccccc;padding:5px;">优惠券1</span>
					<span style="margin-left:10px;background:#cccccc;padding:5px;">优惠券2</span>
					<span style="margin-left:10px;background:#cccccc;padding:5px;">优惠券3</span>
					<span style="text-align:center;width:100px;margin-right:10px;background:#cccccc;padding:5px;float:right;">抢购</span>
				</p>
				<h4 style="text-align: center;">购买须知</h4>
				<div class="row">
					<div class="col-100" style="word-wrap: break-word;word-break: break-all;overflow: hidden;">1111111111111111111111111111fffffffffffffffffffffffffvvvvvvvvvvvvv1111111111111111111111111111fffffffffffffffffffffffffvvvvvvvvvvvvv1111111111111111111111111111fffffffffffffffffffffffffvvvvvvvvvvvvv1111111111111111111111111111fffffffffffffffffffffffffvvvvvvvvvvvvv</div>
				</div>
        	</div>
        	</div>
    </div>
  </body>
</html>