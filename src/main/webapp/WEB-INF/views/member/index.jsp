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
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current" id="page1">
			<div class="content">
			<div class="row">
				<div class="col-100" style="position:relative;">
				 <div><img class='card-cover div_height1' height="260" width="100%" src="<%=request.getContextPath()%>/static/icon/me.png" alt=""></div>
				 <div class="div_height2" style="background:#ffffff;height:200px;position:absolute;top:60px;z-index:999;left:5%;right:5%;-webkit-box-shadow: 3px 3px 12px #666;-moz-box-shadow: 3px 3px 12px #666;box-shadow: 3px 3px 12px #666; -moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;">
					 <div class="row">
					 	<div class="col-60">
					 		<div class="row">
							 	<div class="col-40"><img align="middle" style="margin:10px; width:60px;border-radius:50%;" src="${USER_SESSION.PHOTO}"/></div>
							 	<div class="col-60" style="line-height:80px;">${USER_SESSION.NICKNAME}<span style="float:right;margin-right:20px;font-size:14px;color:#AAAAAA;font-weight:bold;">会员有效期:${vipinfo.LASTTIME}</span></div>
							 </div>
					 	</div>
					 	<div class="col-40" style="padding-right:10px;">
					 	<c:if test="${vipinfo eq null}"><a href="#page2" class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;font-weight:bold;margin-top:30px;">立即加入</a></c:if>
					 	<c:if test="${vipinfo ne null}"><img class="pull-right" style="width:40px;margin-top:10px;" src="<%=request.getContextPath()%>/static/icon/vip<c:if test="${vipinfo.STATE eq 1}">_sel</c:if>.png"/></c:if>
					 	</div>
					 </div>
					 <c:if test="${vipinfo ne null}">
					 	<div class="row" style="padding:5px;">
					 		<div class="col-40"><button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;margin:10px;">邀请好友</button></div>
					 		<div class="col-60"><span><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span><span style="margin-left:30px;"><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span></div>
					 	</div>
					 	<div class="row" style="padding:5px;">
					 		<div class="col-40"><button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;margin:10px;margin-top:5px;">邀请赚钱</button></div>
					 		<div class="col-60"><button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;margin:10px;margin-top:5px;margin-left:0px;">分享</button></div>
					 	</div>
					 </c:if>
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
        <div class="page" id="page2">
			<div class="content">
			<c:forEach var="var" items="${productData}">
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<div class="card" onclick="selectProduct(this)" style="font-weight:bold;" MONEY="${var.PRODUCTMONEY}" PRODUCT_ID="${var.PRODUCT_ID}">
				    <div class="card-content">
				      <div class="card-content-inner" style="height:100px;background:#FE0100;color:#FFFFFF;">${var.PRODUCTDESC}<span style="float:right;"><img width="30" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
				    </div>
				    <div class="card-footer" style="text-align:right;background:#FFCC01;"><span>¥ ${var.PRODUCTMONEY} 元</span><span>送会员: ${var.PRODUCTTIME} 天</span></div>
				  </div>
			  	</div>
			  </div>
			</c:forEach>
			<div class="row" style="padding:5px;">
				<div class="col-100"><button class="button button-big button-fill" onclick="buyProduct()" style="width:100%;background:#FFCC01;color:#000000;font-weight:bold;">立即购买</button></div>
			</div>
			</div>
		</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  
  var PRODUCT_ID = null;
  
  var MONEY = null;
  
  function selectProduct(obj){
	  $(document).find("img.selectpng").css("display","none");
	  $(obj).find("img.selectpng").css("display","");
	  PRODUCT_ID = $(obj).attr("product_id");
	  MONEY = $(obj).attr("money");
  }
  
  function buyProduct(){
	  
	  if(PRODUCT_ID == null || MONEY == null){
		  $.alert("请先选择购买的产品",function(){});
		  return;
	  }
	  
	  $.confirm('会员卡是特殊产品,不支持退款,确认购买?', '温馨提示',
        function () {
		  rechargeSave();
        },
        function () {

        }
      );
  }
  
	function rechargeSave(){
  		$.ajax({
			type: "POST",
			url: '<%=request.getContextPath()%>/recharge/save',
	    	data:{
	    		"ORIGINAL":MONEY,
	    		"MONEY":MONEY,
	    		"DERATE":'0',
	    		"PRODUCT_ID":PRODUCT_ID
	    	},
	    	async: false,
			dataType:'json',
			cache: false,
			beforeSend:function(){
				
			},
			success: function(data){
				if(data.flag ){
					goPay(data.data);
				}
			},
			error:function(){
				
			}
		});
  	}
  	
  	function goPay(data){
 		 wx.miniProgram.navigateTo({
            url: '/pages/pay/pay?type=product&id='+data.RECHARGE_ID+'&sn='+data.RECHARGESN+'&original='+data.ORIGINAL+'&derate='+data.DERATE+'&money='+data.MONEY
       })
 	}
  	
  	if("${USER_SESSION.MEMBERTYPE_ID}"=="1" || "${USER_SESSION.MEMBERTYPE_ID}"=="3"){
  		$(".div_height1").attr("height",parseInt($(".div_height1").attr("height"))-100)
  		$(".div_height2").css("height",(parseInt($(".div_height2").css("height"))-100)+'px')
  	}
  </script>
</html>