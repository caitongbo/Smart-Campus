<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/26
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>关于店铺</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/starter.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="header.jsp"%>
            <div class="container">
                <div class="starter-template">
                    <p class="lead"> 店铺名称：${shopInfo.shopName}.
                        <br>
                        店铺地址：${shopInfo.showAddr}.
                        <br>
                        店铺状态：<c:if test="${shopInfo.state=='0'}">已关闭.</c:if>
                        <c:if test="${shopInfo.state=='1'}">营业中.</c:if>
                    </p>
                </div>
            </div>
    </body>
</html>
