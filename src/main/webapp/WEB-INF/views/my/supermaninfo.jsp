<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>达人申请</title>
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
			<div class="row" style="padding:5px;height:calc(100% - 75px);">
				<div class="col-100" style="height:100%;">
				<textarea id="SUPERMANDESC" name="SUPERMANDESC" placeholder="达人申请介绍 . . ." style="margin:5px;width:calc(100% - 10px);height:100%;">${supermaninfo.SUPERMANDESC}</textarea>
				</div>
			</div>
			 <div class="content-block" style="margin-top:5px;margin-bottom: 5px;">
		    <div class="row">
		      <div class="col-100" style="text-align:c"><button onclick="saveInfo()" type="button" class="button button-big button-fill button-success" style="background:#FFCC01;color:#000000;width:100%;">提交</button></div>
		    </div>
		  </div>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
  
  	var SUPERMANINFO_ID = "${supermaninfo.SUPERMANINFO_ID}";
  
	  function saveInfo(){
		  if($("#SUPERMANDESC").val()==""){
			   $.toast("请简单描述达人申请信息");
			   return;
		   }
		  
		  $.ajax({
				type: "POST",
				url: '<%=request.getContextPath()%>/supermaninfo/save',
		    	data:{
		    		"SUPERMANINFO_ID":SUPERMANINFO_ID,
		    		"SUPERMANDESC":$("#SUPERMANDESC").val()
		    	},
		    	async: false,
				dataType:'json',
				cache: false,
				beforeSend:function(){
					
				},
				success: function(data){
					if(data.flag){
						$.alert("申请达人成功",function(){
							SUPERMANINFO_ID = data.data.SUPERMANINFO_ID
						})
						
					}
				},
				error:function(){
					
				}
			});
		   
	  }
  </script>
</html>