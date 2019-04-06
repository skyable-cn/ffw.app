<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>饭饭精选&nbsp;&nbsp;靠谱还实惠</title>
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
			<div class="row" style="background-color:#FFCC01;height:150px;">
				<div class="col-50" style="padding:20px;">
					<div class="row">
						<div class="col-100" style="font-weight:bold;">张三丰</div>
					</div>
					<div class="row">
						<div class="col-50" style="font-weight:bold;">1<br/>订单</div>
						<div class="col-50" style="font-weight:bold;">1<br/>卡券</div>
					</div>
				</div>
				<div class="col-50" style="padding:20px;">
					<img align="middle" style="margin:10px; width:80px;border-radius:50%;margin-left:50px;" src="<%=request.getContextPath()%>/static/image/head.jpg"/>
				</div>
			</div>
			<div class="row module2" style="margin-top:10px;">
				<div class="col-25"><a class="external" href="<%=request.getContextPath()%>/discount"><img src="<%=request.getContextPath()%>/static/icon/home/wz.png"/><p style="font-size:0.75rem;">周四五折</p></a></div>
		        <div class="col-25"><a class="external" href="<%=request.getContextPath()%>/lottery"><img src="<%=request.getContextPath()%>/static/icon/home/cj.png"/><p style="font-size:0.75rem;">免费抽奖</p></a></div>
		        <div class="col-25"><a class="external" href="<%=request.getContextPath()%>/shop"><img src="<%=request.getContextPath()%>/static/icon/home/tj.png"/><p style="font-size:0.75rem;">好店推荐</p></a></div>
		        <div class="col-25"><a class="external" href="<%=request.getContextPath()%>/seller"><img src="<%=request.getContextPath()%>/static/icon/home/rz.png"/><p style="font-size:0.75rem;">商家入驻</p></a></div>
			</div>
			<div style="width:100%;height:10px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-50" style="font-weight:bold;">优惠活动</div>
				<div class="col-50 more_activity"><a class="external" href="<%=request.getContextPath()%>/stand" style="color:#FFCC01;">查看更多</a></div>
			</div>
			<div class="row" style="padding:5px;padding-top:0px;">
				<div class="col-100">
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					        <div class="swiper-slide"><img height="200" width="100%" src="<%=request.getContextPath()%>/static/plugin/swiper/image/swiper1.jpg"/></div>
					        <div class="swiper-slide"><img height="200" width="100%" src="<%=request.getContextPath()%>/static/plugin/swiper/image/swiper2.jpg"/></div>
					        <div class="swiper-slide"><img height="200" width="100%" src="<%=request.getContextPath()%>/static/plugin/swiper/image/swiper3.jpg"/></div>
					    </div>
					    <div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-100" style="font-weight:bold;">热卖区</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="buttons-tab">
			    <a href="#tab1" class="tab-link active button">推荐</a>
			    <a href="#tab2" class="tab-link button">最热</a>
			</div>
		    <div class="tabs">
		      <div id="tab1" class="tab active">
		          <div class="card demo-card-header-pic" style="position:relative;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <a class="external" href="<%=request.getContextPath()%>/goods/info"><img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo1.jpg" alt=""></a>
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
		      <div id="tab2" class="tab">
		        <div class="card demo-card-header-pic" style="position:relative;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <a class="external" href="<%=request.getContextPath()%>/goods/info"><img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo2.jpg" alt=""></a>
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
				</div>
			</div>
		    <h5>&nbsp;</h5>
			</div>
			<%@ include file="../common/nav.jsp"%>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  	var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
      autoplay:true
    });	
  </script>
</html>