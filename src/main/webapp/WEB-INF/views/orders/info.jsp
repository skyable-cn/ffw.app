<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单详情</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current" style="background:#FFFFFF;">
			<div class="content">
				<div class="row" style="padding:5px;">
					<div class="col-100" style="text-align: right;font-size:0.7rem;font-weight:bold;">
					<c:choose>
				    	<c:when test="${order.STATE eq 0}">待付款</c:when>
				    	<c:when test="${order.STATE eq 1}">已支付</c:when>
				    	<c:when test="${order.STATE eq 2}">待使用</c:when>
				    	<c:when test="${order.STATE eq 3}">已使用</c:when>
				    	<c:when test="${order.STATE eq 5}">已退款</c:when>
				    	<c:otherwise>未知</c:otherwise>
				    </c:choose>
			    </div>
				</div>
				<div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
			  	<div class="row" style="padding:5px;">
					<div class="col-25">&nbsp;</div>
					<div class="col-50"><img onclick="preview()" alt="" src="<%=request.getContextPath()%>/orders/barcode?ORDER_ID=${order.ORDER_ID}" width="100%"></div>
					<div class="col-25">&nbsp;</div>
				</div>
				<div class="row" style="padding:5px;">
					<div class="col-100">
						<div style="text-align:center;font-size:0.7rem;font-weight:bold;">有效期 2012-12-12 12:12:12~2019-12-12 12:12:12</div>
					</div>
				</div>
				<div style="margin:10px;border:1px #DDDDDD solid;height:100px;">
					<div class="row">
						<div class="col-50" style="padding:7px;padding-top:15px;font-size:0.7rem;font-weight:bold;">核销码</div>
						<div class="col-50" style="padding:7px;padding-top:15px;text-align:right;"><button onclick="goRefund('${order.ORDER_ID}');" class="button button-fill button-warning" style="background:#FFCC01;color:#000000;float:right;font-size:0.7rem;font-weight:bold;">申请退款</button></div>
					</div>
					<div class="row">
						<div class="col-50" style="padding:7px;padding-top:7px;font-size:0.7rem;font-weight:bold;">核销码:${order.USEKEY}</div>
						<div class="col-50" style="padding:7px;padding-top:7px;text-align:right;font-size:0.7rem;font-weight:bold;"><c:choose>
				    	<c:when test="${order.STATE eq 0}">待付款</c:when>
				    	<c:when test="${order.STATE eq 1}">已支付</c:when>
				    	<c:when test="${order.STATE eq 2}">待使用</c:when>
				    	<c:when test="${order.STATE eq 3}">已使用</c:when>
				    	<c:when test="${order.STATE eq 5}">已退款</c:when>
				    	<c:otherwise>未知</c:otherwise>
				    </c:choose></div>
					</div>
				</div>
				<div class="content-block" style="margin-left:15%;margin-right:15%;margin-top:15px;margin-bottom:15px;">
				    <a href="#" class="button button-round button-big button-fill" style="background:#FFCC01;color:#000000;">转赠好友</a>
				</div>
				<div class="row" style="padding:5px;padding-top:0px;">
					<div class="col-100">
						<div style="text-align:center;font-size:0.65rem;font-weight:bold;color:#666666;">好友接收成功后,订单无法退款,你将不能再核销</div>
					</div>
				</div>
				<div class="row" style="padding:5px;padding-top:30px;">
					<div class="col-100">
						<div style="text-align:center;font-size:0.85rem;font-weight:bold;">使用方法</div>
					</div>
				</div>
				<div class="row" style="padding:5px;margin-bottom:20px;">
					<div class="col-100">
						<div style="text-align:center;font-size:0.7rem;font-weight:bold;">向商家出示二维码或核销码,扫码后核销成功,不支持截图</div>
					</div>
				</div>
				<div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
				<div class="card">
			    <div class="card-content">
			      <div class="list-block media-list">
			        <ul>
			          <li class="item-content">
			            <div class="item-media">
			              <img src="<%=request.getContextPath()%>/file/image?FILENAME=${order.FILEPATH}" width="100" height="100">
			            </div>
			            <div class="item-inner">
			              <div class="item-title-row">
			                <div class="item-title">${order.GOODSDESC}</div>
			              </div>
			              <div class="item-subtitle">总价:${order.MONEY}<span style="float:right;">数量:${order.NUMBER}</span></div>
			            </div>
			          </li>
			        </ul>
			      </div>
			    </div>
			  </div>
			  <div style="width:100%;height:7px;background:#dddddd;">&nbsp;</div>
			  <div class="row" style="padding:5px;margin-top:10px;">
					<div class="col-100">
						<div style="text-align:left;font-size:0.8rem;font-weight:bold;padding-left:5px;border-left:8px #FFCC01 solid;">核销记录</div>
					</div>
				</div>
				<div class="row" style="padding:5px;">
					<div class="col-100">
						<div style="text-align:left;font-size:0.7rem;font-weight:bold;color:#666666;padding:5px;">${order.SHOPNAME}</div>
					</div>
				</div>
				<div class="content-block" style="margin-left:2%;margin-right:2%;margin-top:15px;margin-bottom:15px;">
				    <a href="#" class="button button-big button-fill" style="background:#FFCC01;color:#000000;">暂无核销记录</a>
				</div>
				<div class="row" style="padding:5px;margin-top:10px;">
					<div class="col-100">
						<div style="text-align:left;font-size:0.8rem;font-weight:bold;padding-left:5px;border-left:8px #FFCC01 solid;">注意事项</div>
					</div>
				</div>
				<div style="padding:5px;margin:10px;border:1px #DDDDDD solid;min-height:250px;word-wrap: break-word;word-break: break-all;overflow: hidden;">${order.BUYNOTICE}
				</div>
			</div>
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
    <script type="text/javascript">
    
    	wx.config({  
    	    debug: false,
    	    appId: "${config.appId}", 
    	    timestamp: "${config.timestamp}",
    	    nonceStr: "${config.noncestr}",
    	    signature: "${config.signature}",  
    	    jsApiList: [  
    	        'previewImage'
    	    ]  
    	}); 
    	
    	wx.ready(
    		function(){
    			
    		}
    	);
    	
    	wx.error(
    		function(res){
    			console.log(res);
    		}
    	);
    	
    	function preview(){
    		wx.previewImage({
	   			current: 'https://fanfan.skyable.cn<%=request.getContextPath()%>/orders/barcode?ORDER_ID=${order.ORDER_ID}', // 当前显示图片的http链接
	   			urls: ['https://fanfan.skyable.cn<%=request.getContextPath()%>/orders/barcode?ORDER_ID=${order.ORDER_ID}'] // 需要预览的图片http链接列表
   			});
    	}

    	function goRefund(id){
      		location.href="<%=request.getContextPath()%>/orders/refund?ORDER_ID="+id
      	}
    	
    </script>
</html>