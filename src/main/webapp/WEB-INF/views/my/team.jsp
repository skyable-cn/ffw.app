<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的团队</title>
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
			<div class="row">
					<div class="col-100">
					 	<img height="150" width="100%" src="<%=request.getContextPath()%>/static/image/team.jpg" alt="">
					</div>
			</div>
			<c:forEach var="var1" items="${teamtData}" varStatus="status1">
			<c:if test="${var1.LEVEL eq 1 }">
			<div class="row" style="<c:if test="${status1.index eq 0}">border-top:1px #DDDDDD solid;</c:if>border-bottom:1px #DDDDDD solid;">
				<div class="col-50">
				 	<img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var1.PHOTO}"/>${var1.NICKNAME}
				</div>
				<div class="col-50" style="border-left:1px #DDDDDD solid;">
					<c:forEach var="var2" items="${teamtData}"  varStatus="status2">
					<c:if test="${var2.LEVEL eq 2 &&  var1.WXOPEN_ID eq var2.FROMWXOPEN_ID}">
				 	<div class="row">
						<div class="col-100">
						<img align="middle" style="margin:10px; width:50px;border-radius:50%;" src="${var2.PHOTO}"/>${var2.NICKNAME}
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
			</div>
			</c:if>
			</c:forEach>	
			</div>
        </div>
    </div>
  </body>
  <%@ include file="../common/headjs.jsp"%>
</html>