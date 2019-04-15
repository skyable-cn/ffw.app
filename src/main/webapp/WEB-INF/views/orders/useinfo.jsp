<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单 - 确认信息</title>
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
			<form action="<%=request.getContextPath()%>/orders/useinfo/save" method="post" onsubmit="return checkErr()">
			<input type="hidden" name="ORDER_ID" value="${pd.ORDER_ID}"/>
			<h6 style="margin-top:5px;margin-bottom:5px;margin-left:30px;font-size:12px;color:#AAAAAA;">完善以下信息,确保订单正常使用</h6>
			<div class="list-block" style="margin-top:5px;">
		    <ul>
		      <!-- Text inputs -->
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-name"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">姓名</div>
		            <div class="item-input">
		              <input id="USEPERSON" name="USEPERSON" type="text" placeholder="您的姓名">
		            </div>
		          </div>
		        </div>
		      </li>
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-email"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">手机</div>
		            <div class="item-input">
		              <input id="PERSONPHONE" name="PERSONPHONE" type="text" placeholder="联系方式">
		            </div>
		          </div>
		        </div>
		      </li>
		    </ul>
		  </div>
		  <div class="content-block">
		    <div class="row">
		      <div class="col-100"><button type="submit" class="button button-big button-fill button-success" style="background:#FFCC01;color:#000000;width:100%;">提交</button></div>
		    </div>
		  </div>
		  </form>
			</div>	
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  function checkErr(){
	  if($("#USEPERSON").val()==''){
		   $.toast("姓名不许为空");
		   return false;
	   }
	  if($("#PERSONPHONE").val()==''){
		   $.toast("手机不许为空");
		   return false;
	   }
	  return true;
	   
  } 
  </script>
</html>