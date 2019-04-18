<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<nav class="bar bar-tab">
  <div class="row">
  	<a class="tab-item external" href="<%=request.getContextPath()%>/home" style="border-right:1px #aaaaaa solid;">
     <span class="icon"><img src="<%=request.getContextPath()%>/static/icon/index.png"/></span>
     <span class="tab-label">首页</span>
    </a>
    <a class="tab-item external" href="<%=request.getContextPath()%>/service" style="border-right:1px #aaaaaa solid;">
     <span class="icon"><img src="<%=request.getContextPath()%>/static/icon/service.png"/></span>
     <span class="tab-label">客服</span>
    </a>
    <a class="tab-item external" style="background:#FFCC01;color:#000000;" href="<%=request.getContextPath()%>/goBuy?GOODS_ID=${pd.GOODS_ID}&FROMWXOPEN_ID=${FROMWXOPEN_ID}">立即购买</a>
  </div>
</nav>