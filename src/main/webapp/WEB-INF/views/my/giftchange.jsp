<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>礼券兑换</title>
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
			<div class="list-block" style="margin-top:5px;margin-bottom:10px;">
		    <ul  style="margin-left:2%;margin-right: 2%;border-radius:25px;">
		      <!-- Text inputs -->
		      <li style="">
		        <div class="item-content">
		          <div class="item-inner">
		            <div class="item-input">
		              <input id="ACTIVECODE" name="ACTIVECODE" type="text" placeholder="激活码" autocomplete="off">
		            </div>
		          </div>
		        </div>
		      </li>
		    </ul>
		  </div>
		  <div class="content-block" style="margin-top:5px;">
		    <div class="row">
		      <div class="col-100"><button onclick="saveInfo()" type="button" class="button button-big button-fill button-success" style="background:#FFCC01;color:#000000;width:100%;">立即兑换</button></div>
		    </div>
		  </div>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
	  function saveInfo(){
		  if($("#ACTIVECODE").val()==""){
			   $.toast("请输入激活码");
			   return;
		   }
	  }
  </script>

</html>