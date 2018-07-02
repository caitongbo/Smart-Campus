<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/26
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<head>
    <title>主页</title>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<div class="text" style=" text-align:center;" margin:0 auto;>
    <font color="gray" size="20">Hi，${message}店主</font>
</div>
</body>
</html>
