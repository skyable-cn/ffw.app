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
			<div class="content">
			<div class="row">
				<div class="col-100"><img class="top" src="<%=request.getContextPath()%>/static/image/top.jpg"/></div>
			</div>
			<div class="row module2">
				<div class="col-25"><a class="" href="<%=request.getContextPath()%>/discount"><img src="<%=request.getContextPath()%>/static/icon/home/wz.png"/><p>周四五折</p></a></div>
		        <div class="col-25"><a class="" href="<%=request.getContextPath()%>/lottery"><img src="<%=request.getContextPath()%>/static/icon/home/cj.png"/><p>免费抽奖</p></a></div>
		        <div class="col-25"><a class="" href="<%=request.getContextPath()%>/shop"><img src="<%=request.getContextPath()%>/static/icon/home/tj.png"/><p>好店推荐</p></a></div>
		        <div class="col-25"><a class="" href="<%=request.getContextPath()%>/seller"><img src="<%=request.getContextPath()%>/static/icon/home/rz.png"/><p>商家入驻</p></a></div>
			</div>
			<div class="row">
				<div class="col-50">优惠活动</div>
				<div class="col-50 more_activity"><a href="">查看更多</a></div>
			</div>
			<div class="row">
				<div class="col-100">
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					        <div class="swiper-slide"><img width="100%" src="<%=request.getContextPath()%>/static/plugin/swiper/image/swiper1.jpg"/></div>
					        <div class="swiper-slide"><img width="100%" src="<%=request.getContextPath()%>/static/plugin/swiper/image/swiper2.jpg"/></div>
					        <div class="swiper-slide"><img width="100%" src="<%=request.getContextPath()%>/static/plugin/swiper/image/swiper3.jpg"/></div>
					    </div>
					    <div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-100">热卖区</div>
			</div>

			<div class="buttons-tab">
			    <a href="#tab1" class="tab-link active button">推荐</a>
			    <a href="#tab2" class="tab-link button">最热</a>
			</div>
		    <div class="tabs">
		      <div id="tab1" class="tab active">
		          <div class="card demo-card-header-pic" style="position:relative;margin-bottom:10px;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <img class='card-cover' src="<%=request.getContextPath()%>/static/image/demo/demo1.jpg" alt="">
				      <div class="suspend left">抢购中</div>
				      <div class="suspend right">活动倒计时<br/>17天22:12:34</div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner">
				        <p>特别好吃，吃了忘不了，一辈子都喜吃</p>
				      </div>
				    </div>
				    <div class="card-footer">
				      <span>体验价: 68.00</span>
				      <span class="delete">¥ 98.00</span>
				      <span class="return">返 7.9</span>
				      <span>已抢: 1234</span>
				    </div>
				  </div>
				  <div class="card demo-card-header-pic" style="position:relative;margin-bottom:10px;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <img class='card-cover' src="<%=request.getContextPath()%>/static/image/demo/demo3.jpg" alt="">
				      <div class="suspend left">抢购中</div>
				      <div class="suspend right">活动倒计时<br/>17天22:12:34</div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner">
				        <p>特别好吃，吃了忘不了，一辈子都喜吃</p>
				      </div>
				    </div>
				    <div class="card-footer">
				      <span>体验价: 68.00</span>
				      <span class="delete">¥ 98.00</span>
				      <span class="return">返 7.9</span>
				      <span>已抢: 1234</span>
				    </div>
				  </div>
		      </div>
		      <div id="tab2" class="tab">
		        <div class="card demo-card-header-pic" style="position:relative;margin-bottom:10px;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <img class='card-cover' src="<%=request.getContextPath()%>/static/image/demo/demo2.jpg" alt="">
				      <div class="suspend left">抢购中</div>
				      <div class="suspend right">活动倒计时<br/>17天22:12:34</div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner">
				        <p>特别好吃，吃了忘不了，一辈子都喜吃</p>
				      </div>
				    </div>
				    <div class="card-footer">
				      <span>体验价: 68.00</span>
				      <span class="delete">¥ 98.00</span>
				      <span class="return">返 7.9</span>
				      <span>已抢: 1234</span>
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