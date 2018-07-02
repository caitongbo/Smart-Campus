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
    <title>商品列表页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script>

        $(document).ready( function () {
            $('#goods').DataTable({
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
<br/>
<div class="container">
    <div class="table-responsive">
        <table class="table" id="goods">
            <thead>
            <tr>
                <th style="text-align: center;">商品编号</th>
                <th style="text-align: center;">商品名称</th>
                <th style="text-align: center;">商品价格</th>
                <th style="text-align: center;">客户来源</th>
                <th style="text-align: center;">商品条形码</th>
                <%--&lt;%&ndash;<th style="text-align: center;">商品图片</th>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<th style="text-align: center;">商品缩略图</th>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<th style="text-align: center;">商品描述</th>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<th style="text-align: center;">商品详情</th>&ndash;%&gt;--%>
                <th style="text-align: center;">商品状态</th>
                <th style="。text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.goodses}" var="goods">
                <tr class="text-center">
                    <td title=${goods.id}>${goods.id}</td>
                    <td title=${goods.gName}>${goods.gName}</td>
                    <td title=${goods.gPrice}>${goods.gPrice}</td>
                    <td title=${goods.gLy}>${goods.gLy}</td>
                    <td title=${goods.gVid}>${goods.gVid}</td>
                        <%--<td title=${goods.gImg}>${goods.gImg}</td>--%>
                        <%--<td title=${goods.gSImg}>${goods.gSImg}</td>--%>
                        <%--<td title=${goods.gLabel}>${goods.gLabel}</td>--%>
                        <%--<td title=${goods.gDetails}>${goods.gDetails}</td>--%>
                    <td><c:if test="${goods.gState=='1'}">已上架</c:if>
                        <c:if test="${goods.gState=='0'}">已下架</c:if>
                    <c:if test="${goods.gState=='-1'}">缺货</c:if></td>

                    <td>
                        <a href="#" onclick="return edit(${goods.id})" style="text-decoration: none;">
                            <button type="button" class="btn btn-info"
                                    data-toggle="button"> 查看更多
                            </button>                        </a>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
