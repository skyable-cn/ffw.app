<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>饭饭网小程序</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <%@ include file="../common/head.jsp"%>
  </head>
  <body>
    <div class="page-group">
        <div class="page page-current"  id="route1">
			<header class="bar bar-nav">
			  <a href="<%=request.getContextPath()%>/home" class="icon icon-left pull-left"></a>
			  <h1 class="title">商家入驻</h1>
			</header>
			<div class="content">
				<div class="list-block">
    <ul>
      <!-- Text inputs -->
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">驻店名称</div>
            <div class="item-input">
              <input id="SHOPNAME" type="text" placeholder="您的店名称" value="${pd.SHOPNAME}">
            </div>
          </div>
        </div>
      </li>
     <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">联系人</div>
            <div class="item-input">
              <input id="CONTRACTPEOPLE" type="text" placeholder="联系人" value="${pd.CONTRACTPEOPLE}">
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
              <input id="CONTRACTPHONE" type="text" placeholder="联系电话" value="${pd.CONTRACTPHONE}">
            </div>
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-title label">驻店位置</div>
            <div class="item-input position">
			<a class="external" onclick="position()" href="javascript:;"><img alt="" src="<%=request.getContextPath()%>/static/icon/position.png"/>${pd.addr}</a>
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
              <textarea id="SHOPDESC" placeholder="商家详细介绍 . . .">${pd.SHOPDESC}</textarea>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="content-block">
    <div class="row">
      	<div class="col-50"><a href="#" class="button button-big button-fill button-success">提交</a></div>
    	<div class="col-50"><a href="#" class="button button-big button-fill button-danger">取消</a></div>
    </div>
  </div>
        	</div>
    	</div>
    </div>
  </body>

  <script>
   function position(){
	   var data = "SHOPNAME="+$("#SHOPNAME").val()+"&CONTRACTPEOPLE="+$("#CONTRACTPEOPLE").val()+"&CONTRACTPHONE="+$("#CONTRACTPHONE").val()+"&SHOPDESC="+$("#SHOPDESC").val();
	   location.href='https://apis.map.qq.com/tools/locpicker?search=1&type=0&backurl=http://192.168.0.4:8081/app/sellerInit?'+encodeURIComponent(data)+'&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp';
   }
</script>
</html>