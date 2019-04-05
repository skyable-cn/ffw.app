<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>搜索</title>
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
			<div class="row" style="padding:5px;">
				<div class="col-100" style="position:relative;">
				 <div><img class='card-cover' height="150" width="100%" src="<%=request.getContextPath()%>/static/image/demo/demo4.jpg" alt=""></div>
				 <div style="position:absolute;bottom:15px;z-index:999;left:2%;right:2%;">
				 <div class="search-input">
			      <label class="icon icon-search" for="search"></label>
			      <input type="search" id='search' placeholder='输入关键字...' style="border-radius:20px;"/>
			    </div>
				 </div>
				</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-100" style="font-weight:bold;">人气商圈</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-50">
					<div style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;">
						<h5 style="font-size:16px;margin:0px;">高新区沿线</h5>
						<h5 style="font-size:14px;margin:0px;">1.4km<span style="float:right;"><img width="30" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></h5>
					</div>
				</div>
				<div class="col-50">
					<div style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;">
						<h4 style="font-size:16px;margin:0px;">高新区沿线</h4>
						<h4 style="font-size:14px;margin:0px;">1.4km<span style="float:right;"><img width="30" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></h4>
					</div>
				</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-33">
					<div style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;">
						<h4 style="font-size:16px;margin:0px;">小寨</h4>
						<h4 style="font-size:14px;margin:0px;">2.5km<span style="float:right;"><img width="30" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></h4>
					</div>
				</div>
				<div class="col-33">
					<div style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;">
						<h4 style="font-size:16px;margin:0px;">小寨</h4>
						<h4 style="font-size:14px;margin:0px;">2.5km<span style="float:right;"><img width="30" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></h4>
					</div>
				</div>
				<div class="col-33">
					<div style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;">
						<h4 style="font-size:16px;margin:0px;">小寨</h4>
						<h4 style="font-size:14px;margin:0px;">2.5km<span style="float:right;"><img width="30" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></h4>
					</div>
				</div>
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
</html>