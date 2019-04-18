<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>邀请名片</title>
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
			<div class="content" >
			<div class="row" style="height:calc(100% - 80px);">
				<div class="col-100" style="padding:5px;"><img width="100%" height="100%" src="<%=request.getContextPath()%>/static/image/back.jpg"/></div>	
			</div>
			<div class="row">
		      <div class="col-100" style="padding:5px;"><button onclick="goShare()" type="button" class="button button-big button-fill button-success" style="background:#FFCC01;color:#000000;width:100%;">邀请好友</button></div>
		    </div>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  	function goShare(){
  		 wx.miniProgram.navigateTo({
             url: '/pages/share/share?type=friends&fromopenid=${USER_SESSION.WXOPEN_ID}&image=back.jpg&datakey=&title=邀请名片'
        })
  	}
  </script>
</html>