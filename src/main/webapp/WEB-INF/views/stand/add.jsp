<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>申请活动</title>
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
				<div class="list-block" style="margin-top:0px;">
    <ul>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-gender"></i></div>
          <div class="item-inner">
            <div class="item-title label">所属产品</div>
            <div class="item-input">
              <select name="GOODS_ID" id="GOODS_ID">
              	<option value="" >请选择</option>
              	<c:forEach var="var" items="${goodsData}">
                	<option value="${var.GOODS_ID}" >${var.GOODSNAME}</option>
                </c:forEach>
              </select>
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-gender"></i></div>
          <div class="item-inner">
            <div class="item-title label">所属分类</div>
            <div class="item-input">
              <select name="STANDTYPE_ID" id="STANDTYPE_ID">
              <option value="" >请选择</option>
              	<c:forEach var="var" items="${typeData}">
                	<option value="${var.STANDTYPE_ID}" >${var.STANDTYPENAME}</option>
                </c:forEach>
              </select>
            </div>
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
            <div class="item-title label">活动内容</div>
            <div class="item-input">
              <textarea id="STANDDESC" name="STANDDESC" placeholder="活动内容 介绍. . ."></textarea>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="content-block">
    <div class="row">
      	<div class="col-100"><a href="javascript:;" onclick="save()" class="button button-big button-fill button-success" style="background:#FFCC01;color:#000000;">提交申请</a></div>
    </div>
  </div>
        	</div>
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  function save(){
	  if($("#GOODS_ID").val()==''){
		   $.toast("请选择产品");
		   return;
	   }
	  if($("#STANDTYPE_ID").val()==''){
		   $.toast("请选择分类");
		   return;
	   }
	  if($("#STANDDESC").val()==''){
		   $.toast("请简单描述活动");
		   return;
	   }
	  
	  $.ajax({
			type: "POST",
			url: '<%=request.getContextPath()%>/stand/save',
	    	data:{
	    		"GOODS_ID":$("#GOODS_ID").val(),
	    		"STANDTYPE_ID":$("#STANDTYPE_ID").val(),
	    		"STANDDESC":$("#STANDDESC").val()
	    	},
	    	async: false,
			dataType:'json',
			cache: false,
			beforeSend:function(){
				
			},
			success: function(data){
				if(data.flag){
					$.alert("申请活动成功",function(){
						location.href='<%=request.getContextPath()%>/seller/manage?SHOP_ID=${pd.SHOP_ID}'
					})
					
				}
			},
			error:function(){
				
			}
		});
	   
  } 
  </script>
</html>