<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>会员</title>
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
				<div class="col-100" style="position:relative;">
				 <div><img class='card-cover' height="160" width="100%" src="<%=request.getContextPath()%>/static/icon/me.png" alt=""></div>
				 <div style="background:#ffffff;height:100px;position:absolute;top:60px;z-index:999;left:5%;right:5%;-webkit-box-shadow: 3px 3px 12px #666;-moz-box-shadow: 3px 3px 12px #666;box-shadow: 3px 3px 12px #666; -moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;">
					 <div class="row">
					 	<div class="col-60">
					 		<div class="row">
							 	<div class="col-40"><img align="middle" style="margin:10px; width:60px;border-radius:50%;" src="${USER_SESSION.PHOTO}"/></div>
							 	<div class="col-60" style="line-height:80px;">${USER_SESSION.NICKNAME}</div>
							 </div>
					 	</div>
					 	<div class="col-40" style="padding-top:40px;padding-right:10px;"><button class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;">立即加入</button></div>
					 </div>
				 </div>
				</div>
			</div>
			<h4 style="text-align: center;">会员专享特权</h4>
			<div class="row" style="padding:5px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;line-height:50px;font-weight:bold;">省<br/>钱</div></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/hyzx.png"/><br/><font style="font-size:14px;">会员专享价</font><br/><font style="font-size:12px;color:#aaaaaa;">全场有优惠</font></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/hyzsz.png"/><br/><font style="font-size:14px;">会员折上折</font><br/><font style="font-size:12px;color:#aaaaaa;">红包+折扣</font></div>
				<div class="col-25">&nbsp;</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;line-height:50px;font-weight:bold;">福<br/>利</div></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/hyhb.png"/><br/><font style="font-size:14px;">会员红包</font><br/><font style="font-size:12px;color:#aaaaaa;">周周送红包</font></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/fxhb.png"/><br/><font style="font-size:14px;">分享红包</font><br/><font style="font-size:12px;color:#aaaaaa;">推荐领红包</font></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/srlb.png"/><br/><font style="font-size:14px;">生日礼包</font><br/><font style="font-size:12px;color:#aaaaaa;">生日送大礼</font></div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;line-height:50px;font-weight:bold;">优<br/>先</div></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/hyyxg.png"/><br/><font style="font-size:14px;">会员优先购</font><br/><font style="font-size:12px;color:#aaaaaa;">爆款优先买</font></div>
				<div class="col-25"><img width="80%" src="<%=request.getContextPath()%>/static/icon/member/hyyxg.png"/><br/><font style="font-size:14px;">新品提前购</font><br/><font style="font-size:12px;color:#aaaaaa;">提前1天</font></div>
				<div class="col-25">&nbsp;</div>
			</div>
			<h5>&nbsp;</h5>
			</div>
			<%@ include file="../common/nav.jsp"%>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>