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
    <style type="text/css">
    	.customerModal .modal-inner{
    		background:#FFFFFF;
    	}
    	.customerModal .modal-button{
    		color:#444444;
    		background: #FFCC01;
    	}
    </style>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current" id="page1">
			<div class="content">
			<div class="row">
				<div class="col-100" style="position:relative;">
				 <div><img class='card-cover div_height1' height="260" width="100%" src="<%=request.getContextPath()%>/static/icon/me.png" alt=""></div>
				 <div><marquee direction="left" style="position:absolute;top:20px;color:#F40A0B;font-size:0.7rem;">1、成功邀请两名好友开通会员送你一个月会员。2、成功邀请好友开通年卡送你30元佣金。</marquee></div>
				 <div class="div_height2" style="background:#ffffff;height:200px;position:absolute;top:60px;z-index:999;left:5%;right:5%;-webkit-box-shadow: 3px 3px 12px #666;-moz-box-shadow: 3px 3px 12px #666;box-shadow: 3px 3px 12px #666; -moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;">
					 <div class="row">
					 	<div class="col-60">
					 		<div class="row">
							 	<div class="col-40"><img align="middle" style="margin:10px; width:60px;border-radius:50%;" src="${USER_SESSION.PHOTO}"/></div>
							 	<div class="col-60"><div style="margin-top:8px;margin-bottom:0px;font-size:1.2rem;">${USER_SESSION.NICKNAME}</div><c:if test="${vipinfo ne null}"><h5 style="margin-top:0px;margin-bottom:0px;">VIP:${fn:substring(vipinfo.LASTTIME,0,10)}</h5></c:if></div>
							 </div>
					 	</div>
					 	<div class="col-40" style="padding-right:10px;">
					 	<c:if test="${vipinfo eq null}"><a href="#page2" class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;margin-top:30px;">立即加入</a></c:if>
					 	<c:if test="${vipinfo ne null}"><img class="pull-right" style="width:40px;margin-top:10px;" src="<%=request.getContextPath()%>/static/icon/vip<c:if test="${vipinfo.STATE eq 1}">_sel</c:if>.png"/></c:if>
					 	</div>
					 </div>
					 <c:if test="${vipinfo ne null}">
					 	<div class="row" style="padding:5px;">
					 		<div class="col-40"><button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;margin:10px;">邀请好友</button></div>
					 		<div class="col-60">
					 		<c:if test="${fn:length(friendData) eq 0}">
					 		<span onclick="goShare()"><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					 		<span onclick="goShare()" style="margin-left:30px;"><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					 		</c:if>
					 		<c:if test="${fn:length(friendData) eq 1}">
					 		<c:forEach var="var" items="${friendData}">
					 		<span><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="${var.PHOTO}"/></span>
					 		</c:forEach>
					 		<span onclick="goShare()" style="margin-left:30px;"><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					 		</c:if>
					 		<c:if test="${fn:length(friendData) eq 2}">
					 		<c:forEach var="var" items="${friendData}" varStatus="status">
					 		<span <c:if test="${status.index ne 0 }">style="margin-left:30px;"</c:if>><img style="width:50px;border-radius:50%;border:1px #AAAAAA solid;" src="${var.PHOTO}"/></span>
					 		</c:forEach>
					 		</c:if>
					 		</div>
					 	</div>
					 	<div class="row" style="padding:5px;">
					 		<div class="col-40"><button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;margin:10px;margin-top:5px;">邀请赚钱</button></div>
					 		<div class="col-60"><button onclick="goShare()" class="button button-fill button-warning" style="background:#FFCC01;color:#000000;margin:10px;margin-top:5px;margin-left:0px;">分享</button></div>
					 	</div>
					 </c:if>
				 </div>
				</div>
			</div>
			<div style="text-align:center;font-size:0.85rem;margin:20px;font-weight:bold;">会员专享特权</div>
			<div class="row" style="padding:5px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;line-height:50px;">省<br/>钱</div></div>
				<div class="col-25" onclick="goVipBuy('会员专享','hyzx.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/hyzx.png"/><br/>会员专享价<br/>全场有优惠</div>
				<div class="col-25" onclick="goVipBuy('会员折上折','hyzsz.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/hyzsz.png"/><br/>会员折上折<br/>红包+折扣</div>
				<div class="col-25">&nbsp;</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;line-height:50px;">福<br/>利</div></div>
				<div class="col-25" onclick="goVipBuy('会员红包','hyhb.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/hyhb.png"/><br/>会员红包<br/>周周送红包</div>
				<div class="col-25" onclick="goVipBuy('分享红包','fxhb.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/fxhb.png"/><br/>分享红包<br/>推荐领红包</div>
				<div class="col-25" onclick="goVipBuy('生日礼包','srlb.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/srlb.png"/><br/>生日礼包<br/>生日送大礼</div>
			</div>
			<div class="row" style="padding:5px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;line-height:50px;">优<br/>先</div></div>
				<div class="col-25" onclick="goVipBuy('会员优先购','hyyxg.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/hyyxg.png"/><br/>会员优先购<br/>爆款优先买</div>
				<div class="col-25" onclick="goVipBuy('新品提前购','hyyxg.png')"><img width="60%" src="<%=request.getContextPath()%>/static/icon/member/hytqg.png"/><br/>新品提前购<br/>提前1天</div>
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
					<div class="card" style="background:#efeff4;" onclick="selectProduct(this)" MONEY="${var.PRODUCTMONEY}" PRODUCT_ID="${var.PRODUCT_ID}">
				    <div class="card-content">
				      <div class="card-content-inner" style="border-top-left-radius:15px;border-top-right-radius:15px;height:80px;background:#FE0100;color:#FFFFFF;font-size:1.0rem;font-weight:normal;">${var.PRODUCTDESC}<span style="float:right;"><img width="30" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
				    </div>
				    <div class="card-footer" style="border-bottom-left-radius:15px;border-bottom-right-radius:15px;text-align:right;background:#FFCC01;font-weight:normal;">
				    <span>¥ ${var.PRODUCTMONEY} 元</span><span>送会员: ${var.PRODUCTTIME} 天</span>
				    </div>
				  </div>
			  	</div>
			  </div>
			</c:forEach>
			<div class="row" style="padding:5px;">
				<div class="col-100"><button class="button button-big button-fill" onclick="buyProduct()" style="width:100%;background:#FFCC01;color:#000000;">立即购买</button></div>
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
  	
  	if(!"${vipinfo}"){
  		$(".div_height1").attr("height",parseInt($(".div_height1").attr("height"))-100)
  		$(".div_height2").css("height",(parseInt($(".div_height2").css("height"))-100)+'px')
  	}
  	
  	function goShare(){
 		 wx.miniProgram.navigateTo({
            url: '/pages/share/share?type=vipinfo&fromopenid=${USER_SESSION.WXOPEN_ID}&image=vip.jpg&datakey=&title=邀请加入会员'
       })
 	}
  	
  	function goVipBuy(title,image){
  		var typeMsg = "开通";
  		if("${vipinfo}" != null){
  			typeMsg = "购买";
  		}
  		momal = $.modal({
  	      title:'',
  	      text: '',
  	      afterText:'<div style="text-algin:center;">'+title+'<span style="float:right;"><img onclick="closeModal();" width="25" src="<%=request.getContextPath()%>/static/image/close.png"/></span></div><hr style="margin-top:20px;width:70%;color:#000000;"/><br/><img src="<%=request.getContextPath()%>/static/icon/member/'+image+'"/><br/><a href="#page2" onclick="closeModal();" class="button button-round button-fill" style="background:#FFCC01;color:#000000;font-weight: normal;margin-top:20px;">立即'+typeMsg+'会员</a>',
  	      extraClass:'customerModal'
  	    })
  	}
  	
  	function closeModal(){
  		$.closeModal(momal);
  	}
  </script>
</html>