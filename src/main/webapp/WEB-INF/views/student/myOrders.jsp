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
    <title>我的订单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

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
                <th style="text-align: center;">商品来源</th>
                <th style="text-align: center;">商品条形码</th>
                <th style="text-align: center;">商品分类</th>
                <th style="text-align: center;">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.Orders}" var="Orders">
            <tr class="text-center">
                <td title=${Orders.id}>${Orders.id}</td>
                <td title=${Orders.gName}>${Orders.gName}</td>
                <td title=${Orders.gPrice}>${Orders.gPrice}</td>
                <td title=${Orders.gLy}>${Orders.gLy}</td>
                <td title=${Orders.gVid}>${Orders.gVid}</td>
                <td title=${Orders.gLabel}>${Orders.gLabel}</td>
                <td>
                    <a href="#" onclick="return deleteOrder(${Orders.id})" style="text-decoration: none;" data-toggle="modal" data-target="#deleteModal">
                        <button type="button" class="btn btn-danger" data-toggle="button"> 删除
                        </button>
                    </a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%--删除的模态框--%>
<div class="modal fade" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模糊框头部 -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">提示</h4>
            </div>
            <!-- 模糊框主体 -->
            <div class="modal-body">
                <strong>确定要删除此订单信息吗？</strong>
            </div>
            <!-- 模糊框底部 -->
            <div class="modal-footer">
                <button type="button" class="deleteSure btn btn-info" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //删除的方法
    function deleteOrder(id){
        if(!id){
            alert("error");
        }else{
            $(".deleteSure").click(function(){
                $.ajax({
                    url: '${pageContext.request.contextPath}/orders/delete?id='+id,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }
</script>
