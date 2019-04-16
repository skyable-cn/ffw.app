<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商户后台</title>
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
						<div class="row" style="padding:5px;">
				<div class="col-100">
				<div class="buttons-tab">
			    <a href="#tab1" class="tab-link active button">商家信息</a>
			    <a href="#tab2" class="tab-link button">核销</a>
			    <a href="#tab3" class="tab-link button">活动</a>
			</div>
		    <div class="tabs">
		      <div id="tab1" class="tab active">
				<div class="list-block" style="margin-top:0px;">
    <ul>
      <!-- Text inputs -->
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">商家名称</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${shop.SHOPNAME}" disabled="disabled">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-gender"></i></div>
          <div class="item-inner">
            <div class="item-title label">所属行业</div>
            <div class="item-input">
              <input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${shop.SHOPTYPENAME}" disabled="disabled">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">商家位置</div>
            <div class="item-input">
			<input id="SHOPNAME" name="SHOPNAME" type="text" placeholder="您的店名称" value="${shop.SHOPADDRESS}" disabled="disabled">
            </div>
          </div>
        </div>
      </li>
      </ul>
      </div>
   <div class="list-block">
    <ul>
     <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">联系人</div>
            <div class="item-input">
              <input id="CONTRACTPERSON" name="CONTRACTPERSON" type="text" placeholder="联系人" value="${shop.CONTRACTPERSON}" disabled="disabled">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">联系电话</div>
            <div class="item-input">
              <input id="CONTRACTPHONE" name="CONTRACTPHONE" type="text" placeholder="联系电话" value="${shop.CONTRACTPHONE}" disabled="disabled">
            </div>
          </div>
        </div>
      </li> 
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
            <div class="item-title label">商家详细介绍</div>
            <div class="item-input">
              <textarea id="SHOPDESC" name="SHOPDESC" placeholder="商家详细介绍 . . ." disabled="disabled">${shop.SHOPDESC}</textarea>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
		      </div>
		      <div id="tab2" class="tab">
		      <div class="row">
		      	<div class="col-100">
				    <div class="search-input"  style="width:calc(100% - 40px);float:left;margin-top:2px;hei">
				      <label class="icon icon-search" for="search"></label>
				      <input type="search" id='search' placeholder='输入关键字...'/>
				    </div>
				<div onclick="scanEWM()" style="width:40px;float:right;text-align:center;"><img align="middle" width="30" src="<%=request.getContextPath()%>/static/icon/scan.png"/></div>
				</div>
		      </div>
		      <div id="orders">
		      
		      </div>
				
		      </div>
		      <div id="tab3" class="tab">
				<c:forEach var="var" items="${standData}">
				<div class="row" style="padding:5px;">
	    					<div class="col-100">				
    					<div class="card demo-card-header-pic">
    				    <div valign="bottom" class="card-header color-white no-border no-padding">
    				      <img class="card-cover" height="200" width="100%" src="<%=request.getContextPath()%>/file/image?FILENAME=${var.FILEPATH}" alt="">
    				    </div>
    				    <div class="card-content">
    				      <div class="card-content-inner">
    				        <p>${var.STANDDESC}</p>
    				        <p class="color-gray">活动时间:${var.CREATETIME}</p>
    				      </div>
    				    </div>
    				  </div>
  					</div>
					</div>
				</c:forEach>
				<div class="row" style="padding:5px;">
   					<div class="col-100">
   					<a  href="<%=request.getContextPath()%>/stand/goAdd?SHOP_ID=${shop.SHOP_ID}"  class="external button button-big button-fill button-success" style="background:#FFCC01;color:#000000;">申请活动</a>
   					</div>
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
	  wx.config({  
	  	    debug: false,
	  	    appId: "${config.appId}", 
	  	    timestamp: "${config.timestamp}",
	  	    nonceStr: "${config.noncestr}",
	  	    signature: "${config.signature}",  
	  	    jsApiList: [  
	      		'scanQRCode' 
	  	    ]  
	  	}); 
  	
  	wx.ready(
  		function(){
  			
  		}
  	);
  	
  	wx.error(
  		function(res){
  			console.log(res);
  		}
  	);
  	
  	function scanEWM(){
  		wx.scanQRCode({
  			needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
  			scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
  			success: function (res) {
  			var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
  				alert(result)
  			}
  		});
  	}
  </script>
  <script type="text/javascript">
  
  	$("#search").blur(function(){
	  page_currentPage = 1;
		search(true);
	});
  		
  		search(true);
		     
    	var page_currentPage = 1;
    	
    	function search(flag){
    		$.ajax({
    			type: "POST",
    			url: '<%=request.getContextPath()%>/orders/search',
    	    	data:{
    	    		"keywords":$("#search").val(),
    	    		"SHOP_ID":"${shop.SHOP_ID}",
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
    				if(list.length == 0){
    					$("#orders").html('');
    					$.hidePreloader();
    					$.toast("该条件暂无数据");
    					loading = false;
    					return;
    				}
    				var html = "";
    				$.each(list,function(index,value){ 
    					var state = '';
    					if(value.STATE == '2'){
    						state = '待核销'
    					}else if(value.STATE == '3'){
    						state = '已核销'
    					}else{
    						
    					}
    					html += `
    					<div class="card">
    				    <div class="card-header">订单:`+value.ORDERSN+`<span style="float:right;border:1px #444444 solid;border-radius: 5px;padding: 5px;font-size: 14px;">`+state+`</span></div>
    				    <div class="card-content">
    				      <div class="list-block media-list">
    				        <ul>
    				          <li class="item-content">
    				            <div class="item-media">
    				              <img src="<%=request.getContextPath()%>/file/image?FILENAME=`+value.FILEPATH+`" width="100">
    				            </div>
    				            <div class="item-inner">
    				              <div class="item-title-row">
    				                <div class="item-title">${var.GOODSDESC}</div>
    				              </div>
    				              <div class="item-subtitle">总价:`+value.MONEY+`<span style="float:right;">数量:`+value.NUMBER+`</span></div>
    				            </div>
    				          </li>
    				        </ul>
    				      </div>
    				    </div>
    				    <div class="card-footer">
    				      <span>下单时间:`+value.CDT+`</span>
    				      <span>`+value.USEPERSON+` / `+value.PERSONPHONE+`</span>
    				    </div>`;
    				    
    				    if(value.STATE == '3'){
    						html+=`<div class="card-footer">
    	  				      <span>核销时间:`+value.UDT+`</span>
    	  				      <span></span>
    	  				    </div>`;
    					}
    				    
    				    html+=`
    				    	</div>
    					`;
    				})
    				if(flag){
    					$("#orders").html(html);
    				}else{
    					$("#orders").append(html);
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