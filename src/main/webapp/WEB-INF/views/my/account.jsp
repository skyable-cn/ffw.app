<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的金库</title>
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
				<div class="row">
				<div class="col-100" style="position:relative;">
				 <div><img class='card-cover div_height1' height="180" width="100%" src="<%=request.getContextPath()%>/static/icon/me.png" alt=""></div>
				 <div style="height:80px;position:absolute;top:20px;z-index:999;left:5%;right:5%;">
				 <p style="text-align: center;font-size:0.85rem;">¥ ${USER_SESSION.WAITACCOUNT}<span style="margin-right:15px;float:right;"><button class="button button-fill button-warning" style="background:#FFFFFF;color:#444444;margin:10px;margin-top:5px;margin-left:0px;padding-left:1.0rem;padding-right:1.0rem;" onclick="goApprove()">提现</button></span></p>
				 </div>
				 <div class="div_height2" style="background:#ffffff;height:80px;position:absolute;top:100px;z-index:999;left:5%;right:5%;-webkit-box-shadow: 3px 3px 12px #666;-moz-box-shadow: 3px 3px 12px #666;box-shadow: 3px 3px 12px #666; -moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;">
					 <div class="row">
					 	<div class="col-25" style="text-align: center;padding-top:10px;">
					 		¥ ${USER_SESSION.WAITACCOUNT}<br/>可提现
					 	</div>
					 	<div class="col-25" style="text-align: center;padding-top:10px;">
					 		¥ ${USER_SESSION.ALREADYACCOUNT}<br/>已提现
					 	</div>
					 	<div class="col-25" style="text-align: center;padding-top:10px;">
					 		¥ ${pd1.MEACCOUNT}<br/>直卖收益
					 	</div>
					 	<div class="col-25" style="text-align: center;padding-top:10px;">
					 		¥ ${pd1.TEAMACCOUNT}<br/>团队收益
					 	</div>
					 </div>
				 </div>
				</div>
			</div>
	<div class="row" style="padding:5px;">
				<div class="col-100" style="padding-left: 10px;color:#F40A0B;font-size:0.85rem;">订单列表</div>
			</div>		
	<c:forEach var="var" items="${incomeData}" varStatus="status">
    <div class="list-block" style="margin:10px;margin-bottom:5px;">
    <ul>
      <li class="item-content">
        <div class="item-inner">
          <div class="item-title" style="font-size:0.65rem;">订单:${var.ORDERSN}</div>
          <div class="item-after" style="font-size:0.65rem;">时间:${var.CDT}</div>
        </div>
      </li>
    </ul>
    </div>
    </c:forEach>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
		function goApprove(){
			if(parseFloat("${USER_SESSION.WAITACCOUNT}") < 50){
				$.alert("对不起,低于50不可提现",function(){})
				return;
			}
			
			 $.prompt('请输入提现金额<br/>规则:数值小于等于可提现金额', '',
		        function (value) {
				 
				 if(value==""){
					 $.alert("请输入提现金额",function(){goApprove()})
						return; 
				 }
				 
				 if(isNaN(value)){
					 $.alert("对不起,输入金额非法",function(){goApprove()})
						return;
				 }
				 
				 if(parseFloat(value) < 0.5){
					 $.alert("对不起,每次最少提现0.5元",function(){goApprove()})
						return;
				 }
				 
		          if(parseFloat("${USER_SESSION.WAITACCOUNT}") < parseFloat(value)){
		        	  $.alert("对不起,输入金额过大",function(){goApprove()})
		          }else{
		        	  $.ajax({
		  				type: "POST",
		  				url: '<%=request.getContextPath()%>/withdraw/save',
		  		    	data:{
		  		    		MONEY:value
		  		    	},
		  		    	async: false,
		  				dataType:'json',
		  				cache: false,
		  				beforeSend:function(){
		  					
		  				},
		  				success: function(data){
		  					if(data.flag){
		  						$.alert("提现申请成功,请等待审核",function(){
  									location.href='<%=request.getContextPath()%>/my'
  								})
		  					}
		  				},
		  				error:function(){
		  					
		  				}
		  			});
		          }
		        },
		        function (value) {
		          
		        }
		      );
		}
  </script>
</html>