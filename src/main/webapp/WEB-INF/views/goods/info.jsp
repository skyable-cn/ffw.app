<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品详情</title>
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
				<div class="col-100">
				<div class="card demo-card-header-pic" style="position:relative;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="" onerror="javascript:this.src='<%=request.getContextPath()%>/file/image?FILENAME=${pd.FILEPATH}';">
				      <div id="goods_time_id_${pd.GOODS_ID}_tj_left" class="suspend left">抢购中</div>
				      <div id="goods_time_id_${pd.GOODS_ID}_tj_right" class="suspend right">活动倒计时<div id="goods_time_id_${pd.GOODS_ID}_tj"><span>0</span>天<span>0</span> <span>0</span> <span>0</span></div></div>
				      <div class="suspend center" onclick="shareGoods()"><img style="margin-top:0px;margin-left:15px;margin-right:15px;" width="30" src="<%=request.getContextPath()%>/static/icon/share.png"/></div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner">
				        <p><span style="color:#fff;background-color:#F40A0B;padding:3px;border-radius:5px;">爆</span>${pd.GOODSDESC}</p>
				      </div>
				    </div>
				    <div class="card-footer">
				      <span>体验价: <strong style="color:#F40A0B;font-size:16px;">${pd.SELLMONEY}</strong></span>
				      <span class="delete">¥ ${pd.ORIGINALMONEY}</span>
				      <span class="return">返 
				      <c:choose>
				      	<c:when test="${USER_SESSION.MEMBERTYPE_ID eq 1}">${pd.MEMBERBACKMONEY}</c:when>
				      	<c:when test="${USER_SESSION.MEMBERTYPE_ID eq 2}">${pd.VIPBACKMONEY}</c:when>
				      	<c:otherwise>${pd.BACKMONEY0}</c:otherwise>
				      </c:choose>
				      </span>
				      <span>已抢: ${pd.BUYNUMBER}</span>
				    </div>
				  </div>
				  <script type="text/javascript">TimeDown("goods_time_id_${pd.GOODS_ID}_tj","${pd.ENDTIME}")</script>
				</div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100" style="font-weight:bold;">已抢购用户</div>
			</div>
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
        	<div class="row" style="padding:5px;">
				<div class="col-100">
					<c:if test="${fn:length(peopleDataList) eq 0}">
						&nbsp;
					</c:if>
					<c:forEach var="var" items="${peopleDataList}">
						<img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var.PHOTO}"/>
					</c:forEach>
				</div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="buttons-tab">
			    <a href="#tab1" class="tab-link active button">商家信息</a>
			    <a href="#tab2" class="tab-link button">购买须知</a>
			    <a href="#tab3" class="tab-link button">商品详情</a>
			</div>
		    <div class="tabs">
		      <div id="tab1" class="tab active">
		          <div class="row" style="padding:5px;margin-top:5px;margin-bottom:5px;">
					<div class="col-60"><c:choose>
	              	<c:when test="${shop.FILEPATH eq null}">
	              	<img align="middle" style="margin-left:20px; width:80px; height:80px; border-radius:50%;" src="<%=request.getContextPath()%>/static/image/shop.jpg"/>
	              	</c:when>
	              	<c:otherwise>
	              	<img align="middle" style="margin-left:20px; width:80px; height:80px; border-radius:50%;" src="<%=request.getContextPath()%>/file/image?FILENAME=${shop.FILEPATH}"/>
	              	</c:otherwise>
	              </c:choose>${shop.SHOPNAME}</div>
					<div class="col-40" style="line-height:80px;text-align:right;"><a class="external" href="<%=request.getContextPath()%>/shop/info?SHOP_ID=${shop.SHOP_ID}" style="font-size:14px;text-decoration:underline;color:#444444;">进店逛逛</a></div>
				</div>
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:10px;">
				<div class="col-60">${shop.SHOPADDRESS}</div>
		        <div class="col-40" style="text-align:right;"><img onclick="phone()" width="20" style="margin-right:15px;" src="<%=request.getContextPath()%>/static/icon/phone.png"/> | <img  onclick="position()" style="margin-left:15px;" width="20" src="<%=request.getContextPath()%>/static/icon/send.png"/></div>
			</div>
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-60" style="padding:5px;">
					<span style="color:#fff;background-color:#F40A0B;padding:5px;border-radius:5px;padding-left:10px;padding-right:10px;">优惠券1</span>
				</div>
		        <div class="col-40"><button class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</button></div>
			</div>
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
			<h5>&nbsp;</h5>
		      </div>
		      <div id="tab2" class="tab">
		        <div class="row" style="padding:5px;">
				<div class="col-100">
					<div style="min-height:180px;padding:10px;border:1px #dddddd solid;word-wrap: break-word;word-break: break-all;overflow: hidden;">${pd.BUYNOTICE}</div>
				</div>
			</div>
		      </div>
		      <div id="tab3" class="tab">
		        <c:forEach var="var" items="${fileDataList}" varStatus="index">
		        <h5 style="text-align: center;font-size:14px;color:#888888;">${index.index+1}产品图片</h5>
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="">
				</div>
		      </div>
		      </c:forEach>
		    </div>
				</div>
			</div>
			<h5>&nbsp;</h5>
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
            url: '/pages/phone/phone?phone=${shop.CONTRACTPHONE}'
       })
  	}
  	function position(){
  		wx.miniProgram.navigateTo({
            url: '/pages/position/position?latitude=${shop.LATITUDE}&longitude=${shop.LONGITUDE}&address=${shop.SHOPADDRESS}'
       })
  	}
  	function shareGoods(){
  		 wx.miniProgram.navigateTo({
             url: '/pages/share/share?fromopenid=${USER_SESSION.WXOPEN_ID}&image=${pd.FILEPATH}&path=/pages/index/index&title=美食推广宣传'
        })
  	}
  </script>
</html>