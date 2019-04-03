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
			  <h1 class="title">周四五折</h1>
			</header>
			<div class="content">
				<div class="row discount" style="padding:5px;">
			      <div class="col-25">
			      	<select>
				      	<option>分类</option>
		                <option>火锅</option>
		                <option>炒菜</option>
		                <option>甜点</option>
		              </select>
	              </div>
			      <div class="col-25">
					<select>
				      	<option>附近</option>
		                <option>由近到远</option>
		                <option>由远到近</option>
		              </select>
       			  </div>
			      <div class="col-25">
			      	<select>
				      	<option>排序</option>
		                <option>价格排序</option>
		                <option>购买量</option>
		                <option>点赞量</option>
		              </select>
			      </div>
			      <div class="col-25">
			      	<select>
				      	<option>筛选</option>
		                <option>支持满减活动</option>
		                <option>支持优惠券</option>
		              </select>
			      </div>
			    </div>
			    <div class="row" style="padding:5px;padding-top:0px;">
			      <div class="col-100">
			    <div class="card">
			    <div class="card-content">
			      <div class="list-block media-list">
			        <ul>
			          <li class="item-content">
			            <div class="item-media">
			              <a href="<%=request.getContextPath()%>/shop/info"><img src="<%=request.getContextPath()%>/static/image/shop.jpg" width="150"></a>
			            </div>
			            <div class="item-inner">
			              <div class="item-title-row">
			                <div class="item-title" style="font-weight:bold;">高新路海底捞火锅</div>
			              </div>
			              <div class="item-subtitle" style="font-weight:bold;">
			              	¥ 35 / 人<span><1000m</span>
			              </div>
			              <div class="item-subtitle" style="font-weight:bold;">
			              	重庆火锅
			              </div>
			              <div class="item-subtitle" style="color:#F40A0B;">
			              	<span class="quan">券</span>83代100元
			              </div>
			            </div>
			          </li>
			        </ul>
			      </div>
			    </div>
			    <div class="card-footer">
			      <span style="font-weight:bold;">西安市 高新路 33号</span>
			      <span><button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</button></span>
			    </div>
			  </div>
			  </div>
			  </div>  
        	</div>
    	</div>
    </div>
  </body>
</html>