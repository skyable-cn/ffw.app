<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的</title>
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
			<div class="row" style="background-color:#FFCC01;height:150px;">
				<div class="col-40" style="padding:20px;">
					<img align="middle" style="margin:10px; width:80px;border-radius:50%;" src="<%=request.getContextPath()%>/static/image/head.jpg"/>
				</div>
				<div class="col-60" style="padding-top:30px;">
					<h5 style="margin:0px;font-weight:bold;font-size:0.85rem;padding-bottom:5px;">张三丰</h5>
					<h5 style="margin:0px;font-weight:bold;font-size:0.65rem;padding-bottom:2px;">个人资料</h5>
					<h5 style="margin:0px;font-weight:bold;font-size:0.65rem;padding-bottom:2px;">普通用户</h5>
				</div>
			</div>
			<div class="row" style="margin:10px;">
			<div class="col-50" style="border-right:2px #cccccc solid;text-align: center;padding:5px;"><a class="external" href="">10<br/>我的卡券</a></div>
			<div class="col-50" style="text-align: center;padding:5px;"><a class="external" href="">10<br/>我的金库</a></div>
			</div>
			<div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;padding-top:10px;">
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="80%" src="<%=request.getContextPath()%>/static/icon/my/dfk.png"/><p style="font-size:0.65rem;">待付款</p></a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="80%" src="<%=request.getContextPath()%>/static/icon/my/yzf.png"/><p style="font-size:0.65rem;">已支付</p></a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="80%" src="<%=request.getContextPath()%>/static/icon/my/dsy.png"/><p style="font-size:0.65rem;">待使用</p></a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="80%" src="<%=request.getContextPath()%>/static/icon/my/ywc.png"/><p style="font-size:0.65rem;">已完成</p></a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="80%" src="<%=request.getContextPath()%>/static/icon/my/wddd.png"/><p style="font-size:0.65rem;">我的订单</p></a></div>
			</div>
			<div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="margin-top:10px;">
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/ljdh.png"/><p style="font-size:0.65rem;">礼券兑换</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/sjrz.png"/><p style="font-size:0.65rem;">商家入驻</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/sjht.png"/><p style="font-size:0.65rem;">商家后台</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/drsq.png"/><p style="font-size:0.65rem;">达人申请</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/yqmp.png"/><p style="font-size:0.65rem;">邀请名片</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/wdtd.png"/><p style="font-size:0.65rem;">我的团队</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/tgdd.png"/><p style="font-size:0.65rem;">推广订单</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/discount"><img width="50%" src="<%=request.getContextPath()%>/static/icon/my/phb.png"/><p style="font-size:0.65rem;">排行榜</p></a></div>
			</div>
			<h5>&nbsp;</h5>
			</div>
			<%@ include file="../common/nav.jsp"%>
        </div>
    </div>
  </body>
</html>