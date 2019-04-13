<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商家信息</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content">
			<div class="row" style="padding:5px;">
				<div class="col-40">
				<c:choose>
	              	<c:when test="${pd.FILEPATH eq null}">
	              	<img style="margin-left:20px; width:100px; height:100px; border-radius:50%;" src="<%=request.getContextPath()%>/static/image/shop.jpg"/>
	              	</c:when>
	              	<c:otherwise>
	              	<img style="margin-left:20px; width:100px; height:100px; border-radius:50%;" src="<%=request.getContextPath()%>/file/image?FILENAME=${pd.FILEPATH}"/>
	              	</c:otherwise>
	              </c:choose>
				</div>
		        <div class="col-60" style="line-height:100px;">${pd.SHOPNAME}</div>
			</div>
			<div style="width:100%;height:1px;background:#aaaaaa;">&nbsp;</div>
			<div class="row" style="padding:10px;">
				<div class="col-60">${pd.SHOPADDRESS}</div>
		        <div class="col-40" style="text-align:right;"><img onclick="phone()" width="20" style="margin-right:15px;" src="<%=request.getContextPath()%>/static/icon/phone.png"/> | <img  style="margin-left:15px;" width="20" src="<%=request.getContextPath()%>/static/icon/send.png"/></div>
			</div>
			<div style="width:100%;height:1px;background:#aaaaaa;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-60" style="padding:5px;">
					<span style="color:#fff;background-color:#F40A0B;padding:5px;border-radius:5px;padding-left:10px;padding-right:10px;">优惠券1</span>
				</div>
		        <div class="col-40"><button class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</button></div>
			</div>
			<div style="width:100%;height:8px;background:#dddddd;">&nbsp;</div>
			<h4 style="text-align: center;">购买须知</h4>
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<div style="min-height:180px;padding:10px;border:1px #dddddd solid;word-wrap: break-word;word-break: break-all;overflow: hidden;">产品展示包括产品介绍、体验价、原价、返利价（普通用户和会员用户的返利价不同，做的时候要区分显示）、用户购买总量，如该产品属于产品抢购活动，还需在页面标明抢购二字以及产品抢购活动倒计时</div>
				</div>
			</div>
        	</div>
        	<%@ include file="../common/service.jsp"%>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  	function phone(){
  		wx.miniProgram.navigateTo({
            url: '/pages/phone/phone?phone=${pd.CONTRACTPHONE}'
       })
  	}
  </script>
</html>