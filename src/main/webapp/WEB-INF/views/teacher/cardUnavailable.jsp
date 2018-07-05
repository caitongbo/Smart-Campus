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

<html>
<head>
    <title>不可用列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

    <script>
        $.fn.dataTable.defaults.oLanguage = {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索：",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        };
        $(document).ready( function () {
            $('#card').DataTable({
                    "aLengthMenu":false,
                    "searching":"搜索",//禁用搜索（搜索框）
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
<br/>
<div class="container">
    <div class="table-responsive">
        <table class="table" id="card">
            <thead>
            <tr>
                <th style="text-align: center;">编号</th>
                <th style="text-align: center;">条形码</th>
                <th style="text-align: center;">余额</th>
                <th style="text-align: center;">申请ID</th>
                <th style="text-align: center;">权限</th>
                <th style="text-align: center;">状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.cards}" var="card">
                <tr class="text-center">
                    <td title=${card.id}>${card.id}</td>
                    <td title=${card.cardVid}>${card.cardVid}</td>
                    <td title=${card.cardBalance}>${card.cardBalance}</td>
                    <td title=${card.sqId}>${card.sqId}</td>
                    <td><c:if test="${card.authId=='0'}">学生</c:if>
                        <c:if test="${card.authId=='1'}">教师</c:if>
                    </td>
                    <td><c:if test="${card.state=='1'}"><font color="green">可用</font></c:if>
                        <c:if test="${card.state=='0'}"><font color="red">不可用</font></c:if></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
