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
    <title>暂时缺货商品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
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
            $('#goods').DataTable({
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
                    <th style="text-align: center;">商品描述</th>
                    <th style="text-align: center;">商品详情</th>
                    <th style="text-align: center;">商品状态</th>
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
                            <td title=${goods.gLabel}>${goods.gLabel}</td>
                            <td title=${goods.gDetails}>${goods.gDetails}</td>
                        <td title=缺货><font color="red">缺货</font></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </body>
</html>
