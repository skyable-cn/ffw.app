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
			  <h1 class="title">商品详情</h1>
			</header>
			<div class="content">
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="card demo-card-header-pic" style="position:relative;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo1.jpg" alt="">
				      <div class="suspend left">抢购中</div>
				      <div class="suspend right">活动倒计时<br/><span>17</span>天<span>22</span> <span>12</span> <span>34</span></div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner">
				        <p><span style="color:#fff;background-color:#F40A0B;padding:3px;border-radius:5px;">爆</span>特别好吃，吃了忘不了，一辈子都喜吃</p>
				      </div>
				    </div>
				    <div class="card-footer">
				      <span>体验价: <strong style="color:#F40A0B;font-size:16px;">68.00</strong></span>
				      <span class="delete">¥ 98.00</span>
				      <span class="return">返 7.9</span>
				      <span>已抢: 1234</span>
				    </div>
				  </div>
				</div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100" style="font-weight:bold;">已抢购用户</div>
			</div>
			<div style="width:100%;height:2px;background:#dddddd;">&nbsp;</div>
        	<div class="row" style="padding:5px;">
				<div class="col-100"><img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="<%=request.getContextPath()%>/static/image/head.jpg"/><img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="<%=request.getContextPath()%>/static/image/head.jpg"/><img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="<%=request.getContextPath()%>/static/image/head.jpg"/></div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="buttons-tab">
			    <a href="#tab1" class="tab-link active button">商家信息</a>
			    <a href="#tab2" class="tab-link button">购买须知</a>
			    <a href="#tab3" class="tab-link button">商品详情</a>
			</div>
		    <div class="tabs">
		      <div id="tab1" class="tab active">
		          <div class="row" style="padding:5px;">
					<div class="col-60"><img align="middle" style="margin:10px;width:50px;border-radius:80%;" src="<%=request.getContextPath()%>/static/image/shop.jpg"/>重庆鸡公煲火锅</div>
					<div class="col-40" style="line-height:80px;"><a href="<%=request.getContextPath()%>/shop/info">进店逛逛 ></a></div>
				</div>
							<div style="width:100%;height:1px;background:#aaaaaa;">&nbsp;</div>
			<div class="row" style="padding:10px;">
				<div class="col-50">西安市长安区王寺街道</div>
		        <div class="col-50" style="text-align:right;"><img width="20" style="margin-right:15px;" src="<%=request.getContextPath()%>/static/icon/phone.png"/> | <img  style="margin-left:15px;" width="20" src="<%=request.getContextPath()%>/static/icon/send.png"/></div>
			</div>
			<div style="width:100%;height:1px;background:#aaaaaa;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-50" style="padding:5px;">
					<span style="color:#fff;background-color:#F40A0B;padding:5px;border-radius:5px;padding-left:10px;padding-right:10px;">优惠券1</span>
					<span style="color:#fff;background-color:#F40A0B;padding:5px;border-radius:5px;padding-left:10px;padding-right:10px;">优惠券2</span>
				</div>
		        <div class="col-50"><button class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</button></div>
			</div>
			<div style="width:100%;height:8px;background:#dddddd;">&nbsp;</div>
			<h4 style="text-align: center;">购买须知</h4>
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<div style="min-height:180px;padding:10px;border:1px #dddddd solid;word-wrap: break-word;word-break: break-all;overflow: hidden;">产品展示包括产品介绍、体验价、原价、返利价（普通用户和会员用户的返利价不同，做的时候要区分显示）、用户购买总量，如该产品属于产品抢购活动，还需在页面标明抢购二字以及产品抢购活动倒计时</div>
				</div>
			</div>
		      </div>
		      <div id="tab2" class="tab">
		        <h4 style="text-align: center;">购买须知</h4>
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<div style="min-height:180px;padding:10px;border:1px #dddddd solid;word-wrap: break-word;word-break: break-all;overflow: hidden;">产品展示包括产品介绍、体验价、原价、返利价（普通用户和会员用户的返利价不同，做的时候要区分显示）、用户购买总量，如该产品属于产品抢购活动，还需在页面标明抢购二字以及产品抢购活动倒计时</div>
				</div>
			</div>
		      </div>
		      <div id="tab3" class="tab">
		        <h4 style="text-align: center;">商品详情</h4>
		        <div style="width:100%;height:2px;background:#aaaaaa;">&nbsp;</div>
		        <h5 style="text-align: center;">产品图片</h5>
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo1.jpg" alt="">
				</div>
		      </div>
		      <h5 style="text-align: center;">产品图片</h5>
		      <div class="row" style="padding:5px;">
				<div class="col-100">
					<img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo2.jpg" alt="">
				</div>
		      </div>
		      <h5 style="text-align: center;">产品图片</h5>
		      <div class="row" style="padding:5px;">
				<div class="col-100">
					<img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo3.jpg" alt="">
				</div>
		      </div>
		    </div>
				</div>
			</div>
			<h5>&nbsp;</h5>
        </div>
        </div>
        <%@ include file="../common/service.jsp"%>
        </div>
    </div>
  </body>
</html>