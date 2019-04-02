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
        <div class="page page-current">
        	<header class="bar bar-nav">
			  <a href="<%=request.getContextPath()%>/lottery" class="icon icon-left pull-left"></a>
			  <h1 class="title">抽奖详情</h1>
			</header>
			<div class="content">
			<div class="buttons-tab">
    <a href="#tab1" class="tab-link active button">参与抽奖</a>
    <a href="#tab2" class="tab-link button">抽奖规则</a>
    <a href="#tab3" class="tab-link button">抽奖介绍</a>
  </div>
  <div class="content-block">
    <div class="tabs">
      <div id="tab1" class="tab active">
        <div class="content-block">
          <div style="margin:0 auto;background:#cccccc;width:150px;height:150px;border:1px solid #dddddd;border-radius:75px;text-align: center;line-height:150px;">参与抽奖</div>
          <div style="margin:0 auto;width:300px;text-align: center;padding-top:15px;">2019-12-20 21:00开奖</div>
          <div style="margin:0 auto;width:300px;text-align: center;padding-top:5px;">已有1234人参与抽奖,查看全部</div>
        <div class="row">
      	<div class="col-100"><a href="#" class="button button-big button-fill button-success">分享好友</a></div>
      	</div>
        </div>
      </div>
      <div id="tab2" class="tab">
        <div class="content-block">
          <p>This is tab 2 content</p>
        </div>
      </div>
      <div id="tab3" class="tab">
        <div class="content-block">
          <p>This is tab 3 content</p>
        </div>
      </div>
    </div>
  </div>
        	</div>
    	</div>
    </div>
  </body>
</html>