<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>优惠活动</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content infinite-scroll" data-distance="30">
			<div id="stands">
			
			</div>
        	</div>
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
        <script type="text/javascript">

	   	search(true);
		     
    	var page_currentPage = 1;
    	
    	function search(flag){
    		$.ajax({
    			type: "POST",
    			url: '<%=request.getContextPath()%>/stand/search',
    	    	data:{
  					"page_currentPage":page_currentPage
    	    	},
    	    	async: false,
    			dataType:'json',
    			cache: false,
    			beforeSend:function(){
    				$.showPreloader();
    				//$("#shops").html('');
    			},
    			success: function(data){
    				pageData = data.page;
    				var list = data.page.data;
    				var html = "";
    				$.each(list,function(index,value){ 
    					html += `
    					<div class="row" style="padding:5px;">
	    					<div class="col-100">
	    						<a class="external" href="<%=request.getContextPath()%>/goods/info?GOODS_ID=`+value.GOODS_ID+`">
    					<div class="card demo-card-header-pic">
    				    <div valign="bottom" class="card-header color-white no-border no-padding">
    				      <img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=`+value.FILEPATH+`" alt="">
    				    </div>
    				    <div class="card-content">
    				      <div class="card-content-inner">
    				        <p>`+value.STANDDESC+`</p>
    				        <p class="color-gray">活动时间:`+value.CREATETIME+`</p>
    				      </div>
    				    </div>
    				  </div>
    				  </a>
  					</div>
					</div>
    					`;
    				})
    				if(flag){
    					$("#stands").html(html);
    				}else{
    					$("#stands").append(html);
    				}
    				
    				setTimeout(function(){$.hidePreloader();},1000);
    				
    	             loading = false;
    			},
    			error:function(){
    				
    			}
    		});
    	}
    	
    </script>
  <script type="text/javascript">
  
 	var loading = false;
     
     $.init();
     
  	$(document).on('infinite',function(){
  		
  		if(parseInt(pageData.currentPage) >= parseInt(pageData.totalPage)){
  			$.toast("数据已经到底了");
  			return;
  		}
  		
  		page_currentPage++;

         // 如果正在加载，则退出
         if (loading) return;

         // 设置flag
         loading = true;

         // 模拟1s的加载过程
         setTimeout(function() {
             // 重置加载flag

             search(false);
             
             //容器发生改变,如果是js滚动，需要刷新滚动
             $.refreshScroller();
         }, 500);
  	});
  </script>
</html>