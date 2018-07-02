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
    <title>我的账号</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready( function () {
            $('#user').DataTable({
                    "aLengthMenu":false,
                    "searching":false,//禁用搜索（搜索框）
                    "paging":false,
                    "info":false
                }
            );
        } );
    </script>
    <style type="text/css">
        table{
            word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
        }
    </style>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="header.jsp"%>
<div class="container">
    <div class="table-responsive">
        <table class="table" id="user">
            <thead>
            <tr>
                <th style="text-align: center;">UUID</th>
                <th style="text-align: center;">账号</th>
                <th style="text-align: center;">密码</th>
                <th style="text-align: center;">状态</th>
                <th style="text-align: center;">多账号</th>
                <th style="text-align: center;">权限</th>
                <th style="text-align: center;">类型</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-center">
                <td >${user.uuid}</td>
                <td >${user.id}</td>
                <td >${user.password}</td>
                <td >
                    <c:if test="${user.state=='0'}">不可用</c:if>
                    <c:if test="${user.state=='1'}">可用</c:if>
                </td>
                <td>
                    <c:if test="${user.type=='0'}">邮箱</c:if>
                    <c:if test="${user.type=='1'}">手机</c:if>
                    <c:if test="${user.type=='2'}">账号</c:if>
                </td>
                <td >
                    <c:if test="${user.authId=='0'}">学生</c:if>
                    <c:if test="${user.authId=='1'}">老师</c:if>
                    <c:if test="${user.authId=='-1'}">商家</c:if>
                </td>
                <td >
                    <c:if test="${user.shopType=='0'}">学生</c:if>
                    <c:if test="${user.shopType=='1'}">老师</c:if>
                    <c:if test="${user.shopType=='-1'}">商家</c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>
