<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>周四五折</title>
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
			<div class="content infinite-scroll" data-distance="30">
				<div class="row discount" style="padding:5px;">
			      <div class="col-25">
			      	<select id="SHOPTYPE_ID" name="SHOPTYPE_ID" class="select_condition">
				      	<option value="">分类</option>
		                <c:forEach var="var" items="${typeData}">
		                	<option value="${var.SHOPTYPE_ID}"  <c:if test="${var.SHOPTYPE_ID eq pd.SHOPTYPE_ID}">selected="selected"</c:if>>${var.SHOPTYPENAME}</option>
		                </c:forEach>
		              </select>
	              </div>
			      <div class="col-25">
					<select id="DISTANCE" name="DISTANCE" class="select_condition">
				      	<option value="">附近</option>
		                <option value="1" <c:if test="${pd.DISTANCE eq 1}">selected="selected"</c:if>>由近到远</option>
		                <option value="2" <c:if test="${pd.DISTANCE eq 2}">selected="selected"</c:if>>由远到近</option>
		              </select>
       			  </div>
			      <div class="col-25">
			      	<select id="SXORDER" name="SXORDER" class="select_condition">
				      	<option value="">排序</option>
		                <option value="1" <c:if test="${pd.SXORDER eq 1}">selected="selected"</c:if>>人均消费由小到大</option>
		                <option value="2" <c:if test="${pd.SXORDER eq 2}">selected="selected"</c:if>>人均消费由大到小</option>
		              </select>
			      </div>
			      <div class="col-25">
			      	<select id="SXSELECT" name="SXSELECT" class="select_condition">
				      	<option value="">筛选</option>
		              </select>
			      </div>
			    </div>
			    <div id="shops">
			    
			  </div>
        	</div>
    	</div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
  <script type="text/javascript">
    
    	wx.config({  
    	    debug: false,
    	    appId: "${pd.config.appId}", 
    	    timestamp: "${pd.config.timestamp}",
    	    nonceStr: "${pd.config.noncestr}",
    	    signature: "${pd.config.signature}",  
    	    jsApiList: [  
    	        'openLocation',
        		'getLocation' 
    	    ]  
    	}); 
    	
    	wx.ready(
    		function(){
    			getLocation();
    		}
    	);
    	
    	wx.error(
    		function(res){
    			console.log(res);
    		}
    	);
    	
    	function getLocation(){
    		wx.getLocation({
		      success: function (res) {
		    	console.log(res)
		        latitude=res.latitude;
		    	longitude=res.longitude;
		    	$.hidePreloader();
		    	search(true);
		      },
		      cancel: function (res) {
		    	  $.hidePreloader();
		    	  search(true);
		      },
		      complete:function(){
		    	  console.log("complete")
		      }
		    });
    	}
    	
    	var latitude = null;
    	
    	var longitude = null;
    	
    	var ZSFLAG="${pd.ZSFLAG}";
    	
    	var page_currentPage = 1;
    	
    	var page = null;
    	
    	function search(flag){
    		$.ajax({
    			type: "POST",
    			url: '<%=request.getContextPath()%>/discount/search',
    	    	data:{
    	    		"latitude":latitude,
    	    		"longitude":longitude,
    	    		"SHOPTYPE_ID":$("#SHOPTYPE_ID").val(),
    	    		"DISTANCE":$("#DISTANCE").val(),
    	    		"SXORDER":$("#SXORDER").val(),
    	    		"SXSELECT":$("#SXSELECT").val(),
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
    				page = data.page;
    				var list = data.page.data;
    				var html = "";
    				$.each(list,function(index,value){ 
    					var src="<%=request.getContextPath()%>/static/image/shop.jpg";
    					if(value.FILEPATH){
    						src="<%=request.getContextPath()%>/file/image?FILENAME="+value.FILEPATH;
    					}
    					var href='<a href="javascript:;" onclick="$.alert(\'对不起，周四才可以半价抢购哦\')" class="external button button-fill button-warning" style="background:#DDDDDD;color:#000000;font-weight:bold;">抢购</a>';
    					if("${pd.ZSFLAG}" == '1'){
    						if("${USER_SESSION.MEMBERTYPE_ID}"=="2" || "${USER_SESSION.MEMBERTYPE_ID}"=="4"){
    							href='<a href="<%=request.getContextPath()%>/shop/info?SHOP_ID='+value.SHOP_ID+'" class="external button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</a>';
    						}else{
    							href='<a href="javascript:;"  onclick="$.alert(\'对不起，加入会员才可以享受哦\')" class="external button button-fill button-warning" style="background:#FFCC01;color:#000000;font-weight:bold;">抢购</a>';
    						}
    						
    					} 
    					html += `<div class="row" style="padding:5px;padding-top:0px;">
    				      <div class="col-100">
    					    <div class="card">
    					    <div class="card-content">
    					      <div class="list-block media-list">
    					        <ul>
    					          <li class="item-content">
    					            <div class="item-media">
    					              <img src="`+src+`" width="150" height="150">
    					            </div>
    					            <div class="item-inner">
    					              <div class="item-title-row">
    					                <div class="item-title">`+value.SHOPNAME+`</div>
    					              </div>
    					              <div class="item-subtitle">
    					              	¥ `+value.AVGMONEY+` / 人
    					              	<span>
    					              	`+value.DISTANCE+`
    					              	</span>
    					              </div>
    					              <div class="item-subtitle">
    					              	`+value.SHOPTYPENAME+`
    					              </div>
    					              <div class="item-subtitle">
    					              	`+value.SHOPADDRESS+`
    					              </div>
    					            </div>
    					          </li>
    					        </ul>
    					      </div>
    					    </div>
    					    <div class="card-footer">
    					      <span></span>
    					      <span>
    					      `+href+`
    					      </span>
    					    </div>
    					  </div>
    					  </div>
    					  </div>`;
    				})
    				if(flag){
    					$("#shops").html(html);
    				}else{
    					$("#shops").append(html);
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
  
  $.showPreloader('获取位置信息 . . .');	
  
  $("select.select_condition").change(function(){
	  
	  page_currentPage = 1;
	  
	  search(true);
  })
  
  	 var loading = false;
     
     $.init();
     
  	$(document).on('infinite',function(){
  		
  		if(parseInt(page.currentPage) >= parseInt(page.totalPage)){
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