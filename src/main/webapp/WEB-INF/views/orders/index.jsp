<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>确认订单</title>
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
				<div class="row" style="padding:10px;">
					<div class="col-40">
					<img width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="" onerror="javascript:this.src='<%=request.getContextPath()%>/file/image?FILENAME=${pd.FILEPATH}';">
					</div>
					<div class="col-60" style="font-weight:bold;">
					${pd.GOODSNAME}<br/>
					${pd.GOODSDESC}
					</div>
				</div>
				<div style="width:100%;height:5px;background:#dddddd;">&nbsp;</div>
				<div class="row" style="padding:10px;padding-top:15px;padding-bottom:15px;">
					<div class="col-50" style="font-weight:bold;">购买数量</div>
					<div class="col-50"><div style="margin-right:20px;float:right;"><button style="width:40px;margin-right:1px;" onclick="computer('-1')">-</button><button style="width:50px;background:#FFFFFF;" id="numberButton">1</button><button style="width:40px;margin-left:1px;" onclick="computer('1')">+</button></div></div>
				</div>
				<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
				<div class="row" style="padding:10px;padding-top:15px;padding-bottom:15px;">
					<div class="col-50" style="font-weight:bold;">小计</div>
					<div class="col-50"><div style="margin-right:20px;float:right;"><span id="XJ">${pd.SELLMONEY}</span>元</div></div>
				</div>
				<c:if test="${fn:length(cardsData) > 0}">
				<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
				<div class="row" style="padding:10px;padding-top:15px;padding-bottom:15px;">
					<div class="col-40" style="font-weight:bold;">卡券抵扣</div>
					<div class="col-60"><div style="margin-right:20px;float:right;">
						<font id="JMTS" style="color:red;">(抵消0.00元)</font><a href="#page2" style="color:#3d4145;font-size:0.85rem;font-weight:normal;text-decoration:underline;">${fn:length(cardsData)}个卡券</a>
						<!-- <select onchange="changeMoney()" id="KQID" style="border:none;background:#eee;">
							<option value="">${fn:length(cardsData)}个卡券可用</option>
							<c:forEach var="var" items="${cardsData}">
								<option value="${var.MONEY}">${var.DESCRIPTION}</option>
							</c:forEach>
							<option value="0">不使用卡券</option>
						</select>
						 -->
					</div></div>
				</div>
				</c:if>
				<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
				<div class="row" style="padding:10px;padding-top:15px;padding-bottom:15px;">
					<div class="col-50" style="font-weight:bold;">实付金额</div>
					<div class="col-50"><div style="margin-right:20px;float:right;"><span id="SF">${pd.SELLMONEY}</span>元</div></div>
				</div>
				<div style="width:100%;height:1px;background:#dddddd;">&nbsp;</div>
        	</div>
        	<nav class="bar bar-tab">
  <div class="row">
  	<a class="tab-item external" href="javascript:;" style="color:#000000;">实付金额: ¥ <span id="SFC">${pd.SELLMONEY}</span>元</a>
    <a class="tab-item external" onclick="orderSave()" style="background:#FFCC01;color:#000000;" href="javascript:;">立即购买</a>
  </div>
</nav>
    	</div>
    	<div class="page" id="page2">
			<div class="content">
			<c:forEach var="var" items="${cardsData}">
			<div class="row" style="padding:5px;">
				<div class="col-100">
					<a href="#page1"><div class="card" onclick="changeMoney('${var.CARD_ID}','${var.MONEY}')">
				    <div class="card-content">
				      <div class="card-content-inner" style="height:100px;background:#FE0100;color:#FFFFFF;font-size:36px;">${var.DESCRIPTION}</div>
				    </div>
				    <div class="card-footer" style="text-align:right;background:#FFCC01;"><span></span><span>有效期:${var.STARTTIME} / ${var.ENDTIME}</span></div>
				  </div></a>
			  	</div>
			  </div>
			</c:forEach>
			<div class="row" style="padding:5px;">
				<div class="col-100"><a class="button button-big button-fill" onclick="changeMoney('0','0')" href="#page1" style="background:#FFCC01;color:#000000;">不使用现金券</a></div>
			</div>
			</div>
			

		</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  	function computer(opt){
  		var num = parseInt(opt);
  		var count = parseInt($("#numberButton").text());
  		if(count <= 1 && num < 0){
  			return;
  		}
  		
  		var lastNum = count+num;
  		$("#numberButton").text(lastNum);
  		
  		$("#XJ").html(lastNum * parseFloat('${pd.SELLMONEY}'));
  		$("#SF").html(lastNum * parseFloat('${pd.SELLMONEY}') - parseFloat(MONEY));
  		$("#SFC").html(lastNum * parseFloat('${pd.SELLMONEY}') - parseFloat(MONEY));
  		
  		if(parseFloat($("#SF").text()) < 0){
  			$("#SF").html("0.00");
  			$("#SFC").html("0.00");
  		}
  	}
  	
  	var CARD_ID = '0';
  	
  	var MONEY = '0';
  	
  	function changeMoney(id,money){
  		
  		$("#JMTS").html("(抵消"+money+")");
  		
  		CARD_ID = id;
  		MONEY = money;
  		
  		var count = parseInt($("#numberButton").text());
  		$("#XJ").html(count * parseFloat('${pd.SELLMONEY}'));
  		$("#SF").html(count * parseFloat('${pd.SELLMONEY}') - parseFloat(MONEY));
  		$("#SFC").html(count * parseFloat('${pd.SELLMONEY}') - parseFloat(MONEY));
  		
  		if(parseFloat($("#SF").text()) < 0){
  			$("#SF").html("0.00");
  			$("#SFC").html("0.00");
  		}
  	}
  	
  	function orderSave(){
  		$.ajax({
			type: "POST",
			url: '<%=request.getContextPath()%>/orders/save',
	    	data:{
	    		"ORIGINAL":$("#XJ").text(),
	    		"MONEY":$("#SF").text(),
	    		"DERATE":MONEY,
	    		"CARD_ID":CARD_ID,
	    		"GOODS_ID":'${pd.GOODS_ID}',
	    		"NUMBER":$("#numberButton").text()
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
            url: '/pages/pay/pay?type=goods&id='+data.ORDER_ID+'&sn='+data.ORDERSN+'&original='+data.ORIGINAL+'&derate='+data.DERATE+'&money='+data.MONEY
       })
 	}
  </script>
</html>