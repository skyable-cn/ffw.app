<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的 - 全部订单</title>
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
			<c:forEach var="var" items="${ordersData}">
			<div class="card">
			    <div class="card-header">下单时间:${var.CDT}<span style="float:right;border:1px #444444 solid;border-radius: 5px;padding: 5px;font-size: 14px;">
			    <c:choose>
			    	<c:when test="${var.STATE eq 0}">待付款</c:when>
			    	<c:when test="${var.STATE eq 1}">已支付</c:when>
			    	<c:when test="${var.STATE eq 2}">待使用</c:when>
			    	<c:when test="${var.STATE eq 3}">已使用</c:when>
			    	<c:when test="${var.STATE eq 5}">已退款</c:when>
			    	<c:otherwise>未知</c:otherwise>
			    </c:choose>
			    </span></div>
			    <div class="card-content">
			      <div class="list-block media-list">
			        <ul>
			          <li class="item-content">
			            <div class="item-media">
			              <a class="external" href="<%=request.getContextPath()%>/orders/info?ORDER_ID=${var.ORDER_ID}"><img src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" width="100"></a>
			            </div>
			            <div class="item-inner">
			              <div class="item-title-row">
			                <div class="item-title">${var.GOODSDESC}</div>
			              </div>
			              <div class="item-subtitle">总价:${var.MONEY}<span style="float:right;">数量:${var.NUMBER}</span></div>
			            </div>
			          </li>
			        </ul>
			      </div>
			    </div>
			    <div class="card-footer">
			      <span></span>
			      <span>
			      <c:choose>
			      	<c:when test="${var.STATE eq 0 }">
			      	<button onclick="goPay('${var.ORDER_ID}','${var.ORDERSN}','${var.ORIGINAL}','${var.DERATE}','${var.MONEY}');;" class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">立即支付</button>
			      	</c:when>
			      	<c:when test="${var.STATE eq 1 }">
			      	<button onclick="goUseInfo('${var.ORDER_ID}');" class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">确认信息</button>
			      	</c:when>
			      	<c:otherwise>
			      	<button onclick="goInfo('${var.ORDER_ID}');" class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">查看详情</button>
			      	</c:otherwise>
			      </c:choose>
			      </span>
			    </div>
			  </div>
			</c:forEach>
			</div>	
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
    <script type="text/javascript">
  	function goInfo(id){
		 location.href="<%=request.getContextPath()%>/orders/info?ORDER_ID="+id
	}
  	function goPay(id,sn,original,derate,money){
  		 wx.miniProgram.navigateTo({
           url: '/pages/pay/pay?type=goods&id='+id+'&sn='+sn+'&original='+original+'&derate='+derate+'&money='+money
      	})
  	}
  	function goUseInfo(id){
		 location.href="<%=request.getContextPath()%>/orders/useinfo?ORDER_ID="+id
	}
  </script>
</html>