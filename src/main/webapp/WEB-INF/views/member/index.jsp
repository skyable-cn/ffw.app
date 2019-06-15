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
			<div class="row" style="overflow: unset">
				<div class="col-100" style="position:relative;">
				 <div style="margin-bottom: 2rem"><img class='card-cover div_height1' height="230" width="100%" src="<%=request.getContextPath()%>/static/icon/me.png" alt=""></div>
				 <div class="div_height2" style="background:#ffffff;height:200px;position:absolute;top:60px;z-index:999;left:3%;right:3%;-webkit-box-shadow: 3px 3px 12px #666;-moz-box-shadow: 3px 3px 12px #666;box-shadow: 3px 3px 12px #666; -moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;">
					 <div class="row">
					 	<div class="col-60">
					 		<div class="row">
							 	<div class="col-40"><img align="middle" style="margin:10px; width:60px;border-radius:50%;" src="${USER_SESSION.PHOTO}"/></div>
							 	<div class="col-60"><div style="margin-top:20px;margin-bottom:0px;font-size:0.75rem;font-weight:bold">${USER_SESSION.NICKNAME}</div><c:if test="${vipinfo ne null}"><div style="margin-top:0px;margin-bottom:0px;">VIP:${fn:substring(vipinfo.LASTTIME,0,10)}</div></c:if></div>
							 </div>
					 	</div>
					 	<div class="col-40" style="padding-right:10px;">
					 	<c:if test="${vipinfo eq null}"><a href="#page2" class="button button-fill button-warning pull-right" style="background:#FFCC01;color:#000000;margin-top:30px;">立即加入</a></c:if>
					 	<c:if test="${vipinfo ne null}"><img class="pull-right" style="width:40px;margin-top:10px;" src="<%=request.getContextPath()%>/static/icon/vip<c:if test="${vipinfo.STATE eq 1}">_sel</c:if>.png"/></c:if>
					 	</div>
					 </div>
					 <c:if test="${vipinfo ne null}">
					 	<div class="row">
					 		<div class="col-50">
					 		<div class="row">
						 		<div class="col-50">
						 		<button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;margin-left:5px;margin-top: 5px;">邀请好友</button>
						 		</div>
						 		<div class="col-50" style="padding-top:5px;">
					 		<c:if test="${fn:length(friendData) eq 0}">
					 		<span onclick="goShare()" style="width: 50%"><img style="width:35px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					 		<span onclick="goShare()" style="width: 50%"><img style="width:35px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					 		</c:if>
					 		<c:if test="${fn:length(friendData) eq 1}">
					 		<c:forEach var="var" items="${friendData}">
					 		<span style="width: 50%"> <img style="width:35px;border-radius:50%;border:1px #AAAAAA solid;" src="${var.PHOTO}"/></span>
					 		</c:forEach>
					 		<span onclick="goShare() style="width: 50%""><img style="width:35px;border-radius:50%;border:1px #AAAAAA solid;" src="<%=request.getContextPath()%>/static/icon/add.jpg"/></span>
					 		</c:if>
					 		<c:if test="${fn:length(friendData) eq 2}">
					 		<c:forEach var="var" items="${friendData}" varStatus="status">
					 		<span style="width: 50%" <c:if test="${status.index ne 0 }"></c:if>><img style="width:35px;border-radius:50%;border:1px #AAAAAA solid;" src="${var.PHOTO}"/></span>
					 		</c:forEach>
					 		</c:if>
					 		</div>
							</div>
					 		</div>
					 		<div class="col-50" style=" color:#888888;padding:8px;word-wrap: break-word;word-break: break-all;overflow: hidden;font-size:12px;">成功邀请两名好友开通会员送你一个月会员</div>
					 	</div>
					 	<div class="row"style="margin-top:10px;">
					 		<div class="col-50">
						 		<div class="row">
							 		<div class="col-50">
							 		<button class="button button-fill button-warning" style="background:#FFCC01;color:#000000;margin-left:5px;">邀请赚钱</button>
							 		</div>
							 		<div class="col-50">
							 		<button onclick="goShare()" class="button button-fill button-warning" style="background:#FFCC01;color:#000000;margin-left:5px;padding: 0 25px">分享</button>
							 		</div>
						 		</div>
					 		</div>
					 		<div class="col-50" style="color:#888888;font-size:0.7rem;color:#888888;padding:8px;word-wrap: break-word;word-break: break-all;overflow: hidden;font-size:0.6rem;padding-top:3px;">成功邀请好友开通年卡送你30元佣金</div>
					 	</div>
					 </c:if>
				 </div>
				</div>
			</div>
			<div style="text-align:center;font-size:0.85rem;margin:20px;font-weight:bold;padding-top: 20px">
				<span>会员专享特权</span>
			</div>
			<div class="row" style="padding:10px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;font-size:0.75rem;padding-top:30px;font-weight: bold">省<br/>钱</div></div>
				<div class="col-25" onclick="goVipBuy('会员专享','hyzx.png')" style="text-align:center;font-size:14px"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/hyzx.png"/><br/>会员专享价<br/><font style="font-size:12px;color:#888888;font-weight: 100">全场有优惠</font></div>
				<div class="col-25" onclick="goVipBuy('会员折上折','hyzsz.png')" style="text-align:center;font-size:14px"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/hyzsz.png"/><br/>会员折上折<br/><font style="font-size:12px;color:#888888;font-weight: 100">红包+折扣</font></div>
				<div class="col-25">&nbsp;</div>
			</div>
			<div class="row" style="padding:10px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;font-size:0.75rem;padding-top:30px;font-weight: bold">福<br/>利</div></div>
				<div class="col-25" onclick="goVipBuy('会员红包','hyhb.png')" style="text-align:center;font-size:14px"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/hyhb.png"/><br/>会员红包<br/><font style="font-size:12px;color:#888888;font-weight: 100">周周送红包</font></div>
				<div class="col-25" onclick="goVipBuy('分享红包','fxhb.png')" style="text-align:center;font-size:14px"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/fxhb.png"/><br/>分享红包<br/><font style="font-size:12px;color:#888888;font-weight: 100">推荐领红包</font></div>
				<div class="col-25" onclick="goVipBuy('生日礼包','srlb.png')" style="text-align:center;font-size:14px"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/srlb.png"/><br/>生日礼包<br/><font style="font-size:12px;color:#888888;font-weight: 100">生日送大礼</font></div>
			</div>
			<div class="row" style="padding:10px;">
				<div class="col-25"><div style="color:#F40A0B;border-right:2px #888888 dotted;text-align:center;width:80%;min-height:100px;font-size:0.75rem;padding-top:30px;font-weight: bold">优<br/>先</div></div>
				<div class="col-25" onclick="goVipBuy('会员优先购','hyyxg.png')" style="text-align:center"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/hyyxg.png"/><br/>会员优先购<br/><font style="font-size:12px;color:#888888;font-weight: 100">爆款优先买</font></div>
				<div class="col-25" onclick="goVipBuy('新品提前购','hyyxg.png')" style="text-align:center"><img width="50%" src="<%=request.getContextPath()%>/static/icon/member/hytqg.png"/><br/>新品提前购<br/><font style="font-size:12px;color:#888888;font-weight: 100">提前1天</font></div>
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
				      <div class="card-content-inner" style="border-top-left-radius:10px;border-top-right-radius:10px;height:70px;background:#FFCC01;font-weight:normal;">
                          <div class="row">
                            <div class="col-60">
                            <div style="font-size:1.0rem;font-weight:bold;">${var.PRODUCTDESC}</div>
                            <div style="font-size:0.85rem;">¥ ${var.PRODUCTMONEY} 元</div>
                            </div>
                            <div class="col-40" style="text-align:right;"><img width="20" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/payok.png"/></div>
                          </div>
				      </div>
				    </div>
				    <div class="card-footer" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;text-align:right;background:#FFCC01;font-weight:normal;color:#3d414;">
				    <span>有效期: ${var.PRODUCTTIME} 天</span>
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