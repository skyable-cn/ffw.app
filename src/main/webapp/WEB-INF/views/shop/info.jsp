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
    <%@ include file="../common/utiljs.jsp"%>
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
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:10px;">
				<div class="col-60">${pd.SHOPADDRESS}</div>
		        <div class="col-40" style="text-align:right;"><img onclick="phone()" width="20" style="margin-right:15px;" src="<%=request.getContextPath()%>/static/icon/phone.png"/> | <img onclick="position()" style="margin-left:15px;" width="20" src="<%=request.getContextPath()%>/static/icon/send.png"/></div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-60" style="padding:5px;">
					<span style="color:#fff;background-color:#F40A0B;padding:5px;border-radius:5px;padding-left:10px;padding-right:10px;">优惠券1</span>
				</div>
		        <div class="col-40"><button class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</button></div>
			</div>
			<div style="width:100%;height:10px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100" style="font-weight:bold;">所有菜单</div>
			</div>
			<c:forEach var="var" items="${goodsData}">
			<div class="row" style="padding:5px;">
				<div class="col-100">
		          <div class="card demo-card-header-pic" style="position:relative;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <a class="external" href="<%=request.getContextPath()%>/goods/info?GOODS_ID=${var.GOODS_ID}"><img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="" onerror="javascript:this.src='<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}';"></a>
				      <div id="goods_time_id_${var.GOODS_ID}_left" class="suspend left">抢购中</div>
				      <div id="goods_time_id_${var.GOODS_ID}_right" class="suspend right">活动倒计时<div id="goods_time_id_${var.GOODS_ID}"><span>0</span>天<span>0</span> <span>0</span> <span>0</span></div></div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner">
				        <p><span style="color:#fff;background-color:#F40A0B;padding:3px;border-radius:5px;">爆</span>${var.GOODSDESC}</p>
				      </div>
				    </div>
				    <div class="card-footer">
				      <span>体验价: <strong style="color:#F40A0B;font-size:16px;">${var.SELLMONEY}</strong></span>
				      <span class="delete">¥ ${var.ORIGINALMONEY}</span>
				      <span class="return">返 7.9</span>
				      <span>已抢: ${var.BUYNUMBER}</span>
				    </div>
				  </div>
				  </div>
				  </div>
				  <script type="text/javascript">TimeDown("goods_time_id_${var.GOODS_ID}","${var.ENDTIME}")</script>
				  </c:forEach>
			<h5>&nbsp;</h5>
        	</div>
        	<%@ include file="../common/shop.jsp"%>
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
  	function position(){
  		wx.miniProgram.navigateTo({
            url: '/pages/position/position?latitude=${pd.LATITUDE}&longitude=${pd.LONGITUDE}&address=${pd.SHOPADDRESS}'
       })
  	}
  </script>
</html>