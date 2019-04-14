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
				 <div><img class='card-cover div_height1' height="250" width="100%" src="<%=request.getContextPath()%>/static/icon/me.png" alt=""></div>
				 <div style="height:80px;position:absolute;top:50px;z-index:999;left:5%;right:5%;">
				 <p style="text-align: center;font-size:24px;font-weight:bold;">¥ 70<span style="margin-right:15px;float:right;"><button class="button button-fill button-warning" style="background:#FFFFFF;color:#444444;font-weight:bold;margin:10px;margin-top:5px;margin-left:0px;">提现</button></span></p>
				 </div>
				 <div class="div_height2" style="background:#ffffff;height:80px;position:absolute;top:150px;z-index:999;left:5%;right:5%;-webkit-box-shadow: 3px 3px 12px #666;-moz-box-shadow: 3px 3px 12px #666;box-shadow: 3px 3px 12px #666; -moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;">
					 <div class="row">
					 	<div class="col-25" style="text-align: center;font-size:16px;padding:10px;font-weight:bold;">
					 		¥ 70<br/>可提现
					 	</div>
					 	<div class="col-25" style="text-align: center;font-size:16px;padding:10px;font-weight:bold;">
					 		¥ 0<br/>已提现
					 	</div>
					 	<div class="col-25" style="text-align: center;font-size:16px;padding:10px;font-weight:bold;">
					 		¥ 70<br/>直卖收益
					 	</div>
					 	<div class="col-25" style="text-align: center;font-size:16px;padding:10px;font-weight:bold;">
					 		¥ 50<br/>团队收益
					 	</div>
					 </div>
				 </div>
				</div>
			</div>
			<h5>&nbsp;</h5>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>