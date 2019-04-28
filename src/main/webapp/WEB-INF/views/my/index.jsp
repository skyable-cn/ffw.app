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
    <%@ include file="../common/headcss.jsp"%>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content">
			<div class="row" style="background-color:#FFCC01;height:150px;">
				<div class="col-40" style="padding:20px;">
					<img align="middle" style="margin:10px; width:80px;border-radius:50%;" src="${USER_SESSION.PHOTO}"/>
				</div>
				<div class="col-60" style="padding-top:30px;">
					<div style="font-size:1.2rem;padding-bottom:5px;">${USER_SESSION.NICKNAME}</div>
					<div style="padding-bottom:2px;">个人资料</div>
					<div style="padding-bottom:2px;">
					${USER_SESSION.MEMBERTYPENAME}
					<c:if test="${vipinfo ne null}"><br/>会员卡号:${vipinfo.VIPSN}</c:if>
					</div>
				</div>
			</div>
			<div class="row" style="margin:10px;">
			<div class="col-50" style="border-right:2px #cccccc solid;text-align: center;padding:5px;"><a class="external" href="<%=request.getContextPath()%>/my/cards">${cardsNum}<br/>我的卡券</a></div>
			<div class="col-50" style="text-align: center;padding:5px;"><a class="external" href="<%=request.getContextPath()%>/my/account">${USER_SESSION.WAITACCOUNT}<br/>我的金库</a></div>
			</div>
			<div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:15px;padding-left:5px;padding-right:5px;">
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/orders/waitpay"><img width="60%" src="<%=request.getContextPath()%>/static/icon/my/dfk.png"/><br/>待付款</a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/orders/payed"><img width="60%" src="<%=request.getContextPath()%>/static/icon/my/yzf.png"/><br/>已支付</a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/orders/waituse"><img width="60%" src="<%=request.getContextPath()%>/static/icon/my/dsy.png"/><br/>待使用</a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/orders/complate"><img width="60%" src="<%=request.getContextPath()%>/static/icon/my/ywc.png"/><br/>已完成</a></div>
			<div class="col-20" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/orders/all"><img width="60%" src="<%=request.getContextPath()%>/static/icon/my/wddd.png"/><br/>我的订单</a></div>
			</div>
			<div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="margin-top:10px;">
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/giftchange"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/ljdh.png"/><p>礼券兑换</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/seller"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/sjrz.png"/><p>商家入驻</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/seller/list"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/sjht.png"/><p>商家后台</p></a></div>
			<c:if test="${supermaninfo eq null}">
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/supermaninfo"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/drsq.png"/><p>达人申请</p></a></div>
			</c:if>
			<c:if test="${supermaninfo ne null}">
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/invitationcard"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/yqmp.png"/><p>邀请名片</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/myteam"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/wdtd.png"/><p>我的团队</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/spreadorder"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/tgdd.png"/><p>推广订单</p></a></div>
			<div class="col-33" style="text-align: center;"><a class="external" href="<%=request.getContextPath()%>/rank"><img width="40%" src="<%=request.getContextPath()%>/static/icon/my/phb.png"/><p>排行榜</p></a></div>
			</c:if>
			</div>
			<h5>&nbsp;</h5>
			</div>
			<%@ include file="../common/nav.jsp"%>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>