<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>周四五折</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
    <script type="text/javascript">
    	wx.config({  
    	    debug: false,
    	    appId: "${pd.config.appId}", 
    	    timestamp: "${pd.config.timestamp}",
    	    nonceStr: "${pd.config.noncestr}",
    	    signature: "${pd.config.signature}",  
    	    jsApiList: [  
    	        'openLocation',
        		'getLocation' 
    	    ]  
    	}); 
    	
    	wx.ready(
    		function(){
    			getLocation();
    		}
    	);
    	
    	wx.error(
    		function(res){
    			console.log(res);
    		}
    	);
    	
    	function getLocation(){
    		wx.getLocation({
		      success: function (res) {
		        $("#LATITUDE").val(res.latitude);
		    	$("#LONGITUDE").val(res.longitude);
		    	$("#form").submit();
		      },
		      cancel: function (res) {
		        alert('用户拒绝授权获取地理位置');
		      }
		    });
    	}
    </script>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content">
				<form id="form" method="post" action="<%=request.getContextPath()%>/discount">
				<input id="LATITUDE" name="LATITUDE" type="hidden" value="${LOCATION_SESSION.LATITUDE}"/>
				<input id="LONGITUDE" name="LONGITUDE" type="hidden" value="${LOCATION_SESSION.LONGITUDE}"/>
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
			    </form>
			    <c:forEach var="var" items="${shopData}">
			    <div class="row" style="padding:5px;padding-top:0px;">
			      <div class="col-100">
			    <div class="card">
			    <div class="card-content">
			      <div class="list-block media-list">
			        <ul>
			          <li class="item-content">
			            <div class="item-media">
			              <a class="external" href="<%=request.getContextPath()%>/shop/info?SHOP_ID=${var.SHOP_ID}">
			              <c:choose>
			              	<c:when test="${var.FILEPATH eq null}">
			              	<img src="<%=request.getContextPath()%>/static/image/shop.jpg" width="150">
			              	</c:when>
			              	<c:otherwise>
			              	<img src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" style="width:150px;max-height:100px;">
			              	</c:otherwise>
			              </c:choose>
			              </a>
			            </div>
			            <div class="item-inner">
			              <div class="item-title-row">
			                <div class="item-title" style="font-weight:bold;">${var.SHOPNAME}</div>
			              </div>
			              <div class="item-subtitle" style="font-weight:bold;">
			              	¥ ${var.AVGMONEY} / 人<span>${var.DISTANCE}m</span>
			              </div>
			              <div class="item-subtitle" style="font-weight:bold;">
			              	${var.SHOPTYPENAME}
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
			      <span style="font-weight:bold;">${var.SHOPADDRESS}</span>
			      <span>
			      <c:choose>
			      	<c:when test="${pd.ZSFLAG eq 4 }">
			      		<a href="<%=request.getContextPath()%>/shop/info?SHOP_ID=${var.SHOP_ID}" class="external button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</a>
			      	</c:when>
			      	<c:otherwise>
			      		<a href="javascript:;" onclick="$.alert('对不起，周四才可以半价抢购哦')" class="external button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</a>
			      	</c:otherwise>
			      </c:choose>
			      </span>
			    </div>
			  </div>
			  </div>
			  </div>
			  </c:forEach> 
        	</div>
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>