<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>好店推荐</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/headcss.jsp"%>
    <%@ include file="../common/utiljs.jsp"%>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current">
			<div class="content infinite-scroll" data-distance="30">
				<div class="row" style="padding:10px 10px 5px 10px;">
					<div class="col-50">
						<div class="selectdiv shadowBox" style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;" distance="2000" latitude="34.277050" longitude="108.962660">
							<div class="smTitle" style="padding-bottom:10px">西安火车站<span style="float:right;"><img width="15" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
							<div class="smallText">2.0km<span style="float:right;"><img width="30" style="margin-top: -10px" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></div>
						</div>
					</div>
					<div class="col-50">
						<div class="selectdiv shadowBox" style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;" distance="2000" latitude="34.250660" longitude="108.947029">
							<div class="smTitle" style="padding-bottom:10px">西安城墙南门<span style="float:right;"><img width="15" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
							<div class="smallText">2.0km<span style="float:right;"><img width="30" style="margin-top: -10px" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></div>
						</div>
					</div>
				</div>
				<div class="row" style="padding:5px 10px 5px 10px;">
					<div class="col-33">
						<div class="selectdiv shadowBox" style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;" distance="2500" latitude="34.259430" longitude="108.947040">
							<div class="smTitle" style="padding-bottom:10px">钟楼<span style="float:right;"><img width="15" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
							<div class="smallText">2.5km<span style="float:right;"><img width="30" style="margin-top: -10px" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></div>
						</div>
					</div>
					<div class="col-33">
						<div class="selectdiv shadowBox" style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;" distance="2500" latitude="34.222819" longitude="108.946696">
							<div class="smTitle" style="padding-bottom:10px">小寨<span style="float:right;"><img width="15" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
							<div class="smallText">2.5km<span style="float:right;"><img width="30" style="margin-top: -10px" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></div>
						</div>
					</div>
					<div class="col-33">
						<div class="selectdiv shadowBox" style="height:70px;background-color:#FFCC01;padding:10px;border-radius:5px;" distance="2500" latitude="34.162457" longitude="108.903866">
							<div class="smTitle" style="padding-bottom:10px">大学城<span style="float:right;"><img width="15" class="selectpng" style="border-radius:50%;display:none;" src="<%=request.getContextPath()%>/static/image/select.png"/></span></div>
							<div class="smallText">2.5km<span style="float:right;"><img width="30" style="margin-top: -10px" src="<%=request.getContextPath()%>/static/icon/hot.png"/></span></div>
						</div>
					</div>
				</div>
			<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="buttons-tab">
			    <a href="#tab1" class="tab-link active button">推荐</a>
			    <a href="#tab2" class="tab-link button">最热</a>
			</div>
		    <div class="tabs">
		      <div id="tab1" class="tab active">
		          <div id="goods1">
				  </div>
		      </div>
		      <div id="tab2" class="tab">
		        <div id="goods2">
				  </div>
		      </div>
		    </div>
				</div>
			</div>
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
      <script type="text/javascript">
      
      	var searchKeys = null;
      	
		var latitude = null;
    	
    	var longitude = null; 
    	
    	var distance = null; 
      	
      	$("#search").blur(function(){
      		searchKeys = $(this).val();
      		search(true);
      	});
      	
      	$(".selectdiv").click(function(){
      		if (loading) return;
      		$(document).find("img.selectpng").css("display","none");
      		$(this).find("img.selectpng").css("display","");
      		latitude = $(this).attr("latitude");
      		longitude = $(this).attr("longitude");
      		distance = $(this).attr("distance");
      		page_currentPage = 1;
      		search(true);
      	});

	   	search(true);
		     
    	var page_currentPage = 1;
    	
    	function search(flag){
    		$.ajax({
    			type: "POST",
    			url: '<%=request.getContextPath()%>/shop/search',
    	    	data:{
    	    		"keywords":searchKeys,
    	    		"LATITUDE":latitude,
    	    		"LONGITUDE":longitude,
    	    		"DISTANCE":distance,
  					"page_currentPage":page_currentPage
    	    	},
    	    	async: true,
    			dataType:'json',
    			cache: false,
    			beforeSend:function(){
    				$.showPreloader();
    				//$("#shops").html('');
    			},
    			success: function(data){
    				pageData = data.page;
    				var list = data.page.data;
    				if(list.length == 0){
    					$("#goods1").html('');
    					$("#goods2").html('');
    					setTimeout(function(){$.hidePreloader();},1000);
    					loading = false;
    					return;
    				}
    				var html = "";
    				$.each(list,function(index,value){ 
    					var backmoney = 0;
    					if("${USER_SESSION.MEMBERTYPE_ID}"=="1"){
    						backmoney = value.MEMBERBACKMONEY;
    					}else if("${USER_SESSION.MEMBERTYPE_ID}"=="2"){
    						backmoney = value.VIPBACKMONEY;
    					}else{
    						backmoney = value.BACKMONEY0;
    					}
    					html += `
    					<div class="card demo-card-header-pic proBox" style="position:relative;">
    				    <div valign="bottom" class="card-header color-white no-border no-padding">
    				      <a class="external" href="<%=request.getContextPath()%>/goods/info?GOODS_ID=`+value.GOODS_ID+`"><img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=`+value.FILEPATH+`" alt="" onerror="javascript:this.src='<%=request.getContextPath()%>/file/image?FILENAME=`+value.FILEPATH+`';"></a>
    				      <div id="goods_time_id_`+value.GOODS_ID+`_tj_left" class="suspend left"  style="font-size:11.5px">抢购中</div>
    				      <div id="goods_time_id_`+value.GOODS_ID+`_tj_right" class="suspend right" style="font-size:10px">活动倒计时<div id="goods_time_id_`+value.GOODS_ID+`_tj" class="timeBox"><span>0</span>天<span>0</span> <span>0</span> <span>0</span></div></div>
    				    </div>
    				    <div class="card-content">
    				      <div class="card-content-inner proText">
    				        <p class="proBoxText"><span class="proBangIcon">爆</span><span class="proInfo smTitle">`+value.GOODSDESC+`</span></p>
    				      </div>
    				    </div>
    				    <div class="card-footer proBoxText">
							<div class="proBoxTextLeft">
							  <span class="priceTitle flexClumnBox"><font class="price">`+value.SELLMONEY+`</font></span>
							  <span class="smText" style="padding-top:5px">元</span>
							  <span class="delete costPrice flexClumnBox smallText">¥ `+value.ORIGINALMONEY+`</span>
							  <span class="flexClumnBox yjBox smText">佣金</span>
							  <span class="yjText smallText">`+backmoney+`元</span>
						    </div>
						    <div class="proBoxTextRight">
								<span class="smallText">已抢:`+value.BUYNUMBER+`</span>
    				      	</div>
    				    </div>
    				  </div>
    					`;
    					TimeDown("goods_time_id_"+value.GOODS_ID+"_tj",value.ENDTIME)
    				})
    				if(flag){
    					$("#goods1").html(html);
    				}else{
    					$("#goods1").append(html);
    				}
    				
    				var list = data.page1.data;
    				var html = "";
    				$.each(list,function(index,value){ 
    					var backmoney = 0;
    					if("${USER_SESSION.MEMBERTYPE_ID}"=="1"){
    						backmoney = value.MEMBERBACKMONEY;
    					}else if("${USER_SESSION.MEMBERTYPE_ID}"=="2"){
    						backmoney = value.VIPBACKMONEY;
    					}else{
    						backmoney = value.BACKMONEY0;
    					}
    					html += `
    					<div class="card demo-card-header-pic proBox" style="position:relative;">
    				    <div valign="bottom" class="card-header color-white no-border no-padding">
    				      <a class="external" href="<%=request.getContextPath()%>/goods/info?GOODS_ID=`+value.GOODS_ID+`"><img class='card-cover' height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=`+value.FILEPATH+`" alt="" onerror="javascript:this.src='<%=request.getContextPath()%>/file/image?FILENAME=`+value.FILEPATH+`';"></a>
    				      <div id="goods_time_id_`+value.GOODS_ID+`_zr_left" class="suspend left" style="font-size:11.5px">抢购中</div>
    				      <div id="goods_time_id_`+value.GOODS_ID+`_zr_right" class="suspend right" style="font-size:10px">活动倒计时<div id="goods_time_id_`+value.GOODS_ID+`_zr" class="timeBox"><span>0</span>天<span>0</span> <span>0</span> <span>0</span></div></div>
    				    </div>
    				    <div class="card-content">
    				      <div class="card-content-inner proText">
    				        <p class="proBoxText"><span class="proBangIcon">爆</span><span class="proInfo smTitle">`+value.GOODSDESC+`</span></p>
    				      </div>
    				    </div>
    				    <div class="card-footer proBoxText">
    				      <div class="proBoxTextLeft">
							  <span class="priceTitle flexClumnBox"><font class="price">`+value.SELLMONEY+`</font></span>
							  <span class="smText" style="padding-top:5px">元</span>
							  <span class="delete costPrice flexClumnBox smallText">¥ `+value.ORIGINALMONEY+`</span>
							  <span class="flexClumnBox yjBox smText">佣金</span>
							  <span class="yjText smallText">`+backmoney+`元</span>
						    </div>
						    <div class="proBoxTextRight">
								<span class="smallText">已抢:`+value.BUYNUMBER+`</span>
    				      	</div>
    				    </div>
    				  </div>
    					`;
    					TimeDown("goods_time_id_"+value.GOODS_ID+"_zr",value.ENDTIME)
    				})
    				if(flag){
    					$("#goods2").html(html);
    				}else{
    					$("#goods2").append(html);
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