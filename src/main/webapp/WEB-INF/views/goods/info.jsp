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
    <div class="page-group" id="bigbigBox" style="overflow: scroll">
        <div class="page page-current">
			<div class="content">
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="card demo-card-header-pic proBox" style="position:relative;">
				    <div valign="bottom" class="card-header color-white no-border no-padding">
				      <img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="" onerror="javascript:this.src='<%=request.getContextPath()%>/file/image?FILENAME=${pd.FILEPATH}';">
				      <div id="goods_time_id_${pd.GOODS_ID}_tj_left" class="suspend left">抢购中</div>
				      <div id="goods_time_id_${pd.GOODS_ID}_tj_right" class="suspend right">活动倒计时<div id="goods_time_id_${pd.GOODS_ID}_tj" class="timeBox"><span>0</span>天<span>0</span> <span>0</span> <span>0</span></div></div>
				      <div class="suspend center" onclick="shareGoods()"><img style="margin-top:0px;margin-left:15px;margin-right:15px;" width="30" src="<%=request.getContextPath()%>/static/icon/share.png"/></div>
				    </div>
				    <div class="card-content">
				      <div class="card-content-inner proText">
						  <p class="proBoxText"><span class="proBangIcon">爆</span ><span class="proInfo">${pd.GOODSDESC}</span></p>
				      </div>
				    </div>
				    <div class="card-footer proBoxText">
						<div class="proBoxTextLeft">
						  <span class="priceTitle flexClumnBox"><font style="color:#F40A0B;">${pd.SELLMONEY}</font></span>
						  <span>元</span>
						  <span class="delete costPrice flexClumnBox">¥ ${pd.ORIGINALMONEY}</span>
						  <span class="flexClumnBox yjBox">佣金</span>
						  <span class="yjText">
							  <c:choose>
								<c:when test="${USER_SESSION.MEMBERTYPE_ID eq 1}">${pd.MEMBERBACKMONEY}</c:when>
								<c:when test="${USER_SESSION.MEMBERTYPE_ID eq 2}">${pd.VIPBACKMONEY}</c:when>
								<c:otherwise>${pd.BACKMONEY0}</c:otherwise>
							  </c:choose>
							  元
						  </span>
						</div>
						<div class="proBoxTextRight">
						  <span class="yqText">已抢: ${pd.BUYNUMBER}</span>
						</div>
				    </div>
				  </div>
				  <script type="text/javascript">TimeDown("goods_time_id_${pd.GOODS_ID}_tj","${pd.ENDTIME}")</script>
				</div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100" style="font-size:0.75rem;font-weight: bold">已抢购用户</div>
			</div>
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
        	<div class="row" style="padding:5px 0px 5px 25px;">
				<div class="col-100 touxiangImage">
					<c:if test="${fn:length(peopleDataList) eq 0}">
						<span><img src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					</c:if>
					<c:forEach var="var" items="${peopleDataList}">
						<img align="middle" src="${var.PHOTO}"/>
					</c:forEach>
				</div>
			</div>
			<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="buttons-tab">

					<%--<button id="roll1">商家信息</button>
					<button id="roll2">购买须知</button>
					<button id="roll3">商品详情</button>--%>
			    <a href="" class=" tab-link active button" id="roll1">商家信息</a>
			    <a href="" class=" button" id="roll2">购买须知</a>
			    <a href="" class="button" id="roll3">商品详情</a>
			</div>
					<div id="myDiv"></div>
			<%--	<div id="roll_top" style="height: 300px">
					商家信息
				</div>
					<div id="roll_top1" style="height: 300px">
						购买须知
					</div>
					<div id="roll_top2" style="height: 300px">
						商品详情
					</div>--%>


		    <div>
		      <div id="roll_top">
		          <div class="row" style="padding:5px;margin-top:5px;margin-bottom:5px;">
					<div class="col-60"><c:choose>
	              	<c:when test="${shop.FILEPATH eq null}">
	              	<img align="middle" style="margin-left:20px; width:60px; height:60px; border-radius:50%;" src="<%=request.getContextPath()%>/static/image/shop.jpg"/>
	              	</c:when>
	              	<c:otherwise>
	              	<img align="middle" style="margin-left:20px; width:60px; height:60px; border-radius:50%;" src="<%=request.getContextPath()%>/file/image?FILENAME=${shop.FILEPATH}"/>
	              	</c:otherwise>
	              </c:choose>${shop.SHOPNAME}</div>
					<div class="col-40" style="line-height:60px;text-align:right;"><a class="external" href="<%=request.getContextPath()%>/shop/info?SHOP_ID=${shop.SHOP_ID}" style="text-decoration:underline;">进店逛逛</a></div>
				</div>
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:10px;">
				<div class="col-60">${shop.SHOPADDRESS}</div>
		        <div class="col-40" style="text-align:right;"><img onclick="phone()" width="20" style="margin-right:15px;" src="<%=request.getContextPath()%>/static/icon/phone.png"/> | <img  onclick="position()" style="margin-left:15px;" width="20" src="<%=request.getContextPath()%>/static/icon/send.png"/></div>
			</div>
			<!--
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
			<div class="row" style="padding:5px;">
				<div class="col-60" style="padding:5px;">
					<span style="color:#fff;background-color:#F40A0B;padding:5px;border-radius:5px;padding-left:10px;padding-right:10px;">周四五折</span>
				</div>
		        <div class="col-40"><button class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</button></div>
			</div>
			 -->
			<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
		      </div>
		      <div id="roll_top1">
				<div class="row" style="padding:5px;">
					<div class="col-100">
						<div style="min-height:180px;padding:10px;border:1px #dddddd solid;word-wrap: break-word;word-break: break-all;overflow: hidden;">${pd.BUYNOTICE}</div>
					</div>
				</div>
		      </div>
		      <div id="roll_top2">
		        <c:forEach var="var" items="${fileDataList}" varStatus="index">
		        <div style="text-align:center;padding:5px;">${index.index+1}产品图片</div>
				<div class="row" style="padding:5px;">
				<div class="col-100">
					<img style="border-top-left-radius:5px;border-top-right-radius:5px;border-bottom-left-radius:5px;border-bottom-right-radius:5px;" height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="">
				</div>
		      </div>
		      </c:forEach>
		    </div>
				</div>
			</div>






			<h5>&nbsp;</h5>
        </div>
        </div>
        <nav class="bar bar-tab">
  <div class="row">
  	<a class="tab-item external" href="<%=request.getContextPath()%>/home" style="border-right:1px #aaaaaa solid">
     <span class="icon"><img src="<%=request.getContextPath()%>/static/icon/index.png"/></span>
     <span class="tab-label">首页</span>
    </a>
    <a class="tab-item external" href="javascript:;" onclick="goCustomer()" style="border-right:1px #aaaaaa solid;">
     <span class="icon"><img src="<%=request.getContextPath()%>/static/icon/service.png"/></span>
     <span class="tab-label">客服</span>
    </a>
    <a class="tab-item external" style="background:#FFCC01;color:#000000;" href="<%=request.getContextPath()%>/goBuy?GOODS_ID=${pd.GOODS_ID}&FROMWXOPEN_ID=${FROMWXOPEN_ID}">立即购买</a>
  </div>
</nav>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">

	  $(document).ready(function() {
		  document.querySelector("#roll1").onclick = function(){
			  document.querySelector("#roll_top").scrollIntoView(true);
			  // document.querySelector("#roll_top1").scrollIntoView(false);
			  // document.querySelector("#roll_top2").scrollIntoView(false);
			  $("#roll3").removeClass("active");
			  $("#roll2").removeClass("active");
			  $("#roll1").addClass("tab-link active button");
			  console.log($("roll1"));
			 
		  }
		  document.querySelector("#roll2").onclick = function(){
			  // document.querySelector("#roll_top").scrollIntoView(false);
		/*	  $("#roll1").addClass("tab-link button");
			  $("#roll3").addClass("tab-link  button");*/
			  $("#roll3").removeClass("active");
			  $("#roll1").removeClass("active");
			  $("#roll2").addClass("tab-link active button");
			  document.querySelector("#roll_top1").scrollIntoView(true);
			  // document.querySelector("#roll_top2").scrollIntoView(false);
		  }
		  document.querySelector("#roll3").onclick = function(){
			  // document.querySelector("#roll_top").scrollIntoView(false);
			  // document.querySelector("#roll_top1").scrollIntoView(false);
			  $("#roll1").removeClass("active");
			  $("#roll2").removeClass("active");
			  $("#roll3").addClass("tab-link active button");
			  document.querySelector("#roll_top2").scrollIntoView(true);
		  }
	  });


  	function goCustomer(){
  		wx.miniProgram.navigateTo({
            url: '/pages/customer/customer'
       })
  	}
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
             url: '/pages/share/share?type=goods&fromopenid=${USER_SESSION.WXOPEN_ID}&image=${pd.FILEPATH1}&datakey=${pd.GOODS_ID}&title=美食推广宣传'
        })
  	}
  </script>
</html>