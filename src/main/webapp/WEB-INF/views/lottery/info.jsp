<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>抽奖详情</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
     <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content">
			<div class="row" style="padding:5px;">
      	<div class="col-100">
			<div class="buttons-tab">
    <a href="#tab1" class="tab-link active button">参与抽奖</a>
    <a href="#tab2" class="tab-link button">抽奖规则</a>
    <a href="#tab3" class="tab-link button">抽奖介绍</a>
  </div>
  <div class="content-block">
    <div class="tabs">
      <div id="tab1" class="tab active">
        <div class="content-block">
        <c:choose>
        	<c:when test="${pd.USESTATE eq 0}">
        		<div style="margin:0 auto;background:#FFCC01;width:150px;height:150px;border:1px solid #dddddd;border-radius:75px;text-align: center;line-height:150px;color:#000000;font-weight:bold;" onclick="$.alert('对不起，抽奖未开始')">未开始</div>
        	</c:when>
        	<c:when test="${pd.USESTATE eq 1}">
        		<c:choose>
        			<c:when test="${pdme ne null}">
        				<div style="margin:0 auto;background:#FFCC01;width:150px;height:150px;border:1px solid #dddddd;border-radius:75px;text-align: center;line-height:150px;color:#000000;font-weight:bold;" onclick="$.alert('对不起，抽奖已参与')">已参与</div>
        			</c:when>
        			<c:otherwise>
        				<div style="margin:0 auto;background:#FFCC01;width:150px;height:150px;border:1px solid #dddddd;border-radius:75px;text-align: center;line-height:150px;color:#000000;font-weight:bold;" onclick="lotterySave()">参与抽奖</div>
        			</c:otherwise>
        		</c:choose>
        	</c:when>
        	<c:when test="${pd.USESTATE eq 2}">
        		<div style="margin:0 auto;background:#FFCC01;width:150px;height:150px;border:1px solid #dddddd;border-radius:75px;text-align: center;line-height:150px;color:#000000;font-weight:bold;" onclick="$.alert('对不起，抽奖待开奖')">待开奖</div>
        		<c:choose>
        			<c:when test="${pdme ne null}">
        				<div style="margin:0 auto;width:300px;text-align: center;padding-top:15px;color:#000000;">我的幸运码</div>
        				<div style="margin:0 auto;width:300px;text-align: center;padding-top:15px;color:#000000;">${pdme.LUCKNUMBER}</div>
        			</c:when>
        		</c:choose>
        	</c:when>
        	<c:otherwise>
        		<div style="margin:0 auto;background:#FFCC01;width:150px;height:150px;border:1px solid #dddddd;border-radius:75px;text-align: center;line-height:150px;color:#000000;font-weight:bold;" onclick="$.alert('对不起，抽奖已开奖')">已开奖</div>
        		<div style="margin:0 auto;width:300px;text-align: center;padding-top:5px;"><a class="external" href="<%=request.getContextPath()%>/lottery/member/selected?LOTTERY_ID=${pd.LOTTERY_ID}">查看中奖名单 ></a></div>
        	</c:otherwise>
        </c:choose>
          
          <div style="margin:0 auto;width:300px;text-align: center;padding-top:15px;">${pd.SHOWTIME}开奖</div>
          <div style="margin:0 auto;width:300px;text-align: center;padding-top:5px;"><a class="external" href="<%=request.getContextPath()%>/lottery/member?LOTTERY_ID=${pd.LOTTERY_ID}">已有${fn:length(lotteryrecordData)}人参与抽奖,查看全部 ></a></div>
        
        </div>
        <div class="row" style="padding:5px;">
			<div class="col-100">
			<c:forEach var="var" items="${lotteryrecordData}">
				<img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var.PHOTO}"/>
			</c:forEach>
			</div>
		</div>
        <div class="row" style="padding:5px;">
      	<div class="col-100"><a href="javascript:;" onclick="goShare()" class="button button-big button-fill button-success" style="background:#FFCC01;color:#000000;">分享给朋友</a></div>
      	</div>
      </div>
      <div id="tab2" class="tab">
        <div class="content-block">
          <p>${pd.LOTTERYRULE}</p>
        </div>
      </div>
      <div id="tab3" class="tab">
        <div class="content-block">
          <p>${pd.LOTTERYDESC}</p>
        </div>
      </div>
    </div>
  </div>
        </div>	</div>
    	</div></div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  	function goShare(){
  		 wx.miniProgram.navigateTo({
             url: '/pages/share/share?image=${pd.FILEPATH}&path=/pages/index/index&title=免费抽奖了'
        })
  	}
  	
  	function lotterySave(){
  		$.ajax({
			type: "POST",
			url: '<%=request.getContextPath()%>/lottery/save',
	    	data:{
	    		"LOTTERY_ID":'${pd.LOTTERY_ID}'
	    	},
	    	async: false,
			dataType:'json',
			cache: false,
			beforeSend:function(){
				
			},
			success: function(data){
				if(data.flag){
					$.alert(data.message+"<br/><br/>幸运码:"+data.data,function(){
						location.href='<%=request.getContextPath()%>/lottery/info?LOTTERY_ID=${pd.LOTTERY_ID}'
					})
					
				}
			},
			error:function(){
				
			}
		});
  	}
  </script>
</html>