<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/26
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page isELIgnored="false" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>所有商品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/starter.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready( function () {
            $('#goods').DataTable({
                    "aLengthMenu":false,
                    "searching":true,//禁用搜索（搜索框）
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
                <th style="text-align: center;">商品来源</th>
                <th style="text-align: center;">商品条形码</th>
                <%--&lt;%&ndash;<th style="text-align: center;">商品图片</th>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<th style="text-align: center;">商品缩略图</th>&ndash;%&gt;--%>
                <th style="text-align: center;">商品描述</th>
                <%--&lt;%&ndash;<th style="text-align: center;">商品详情</th>&ndash;%&gt;--%>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.goods}" var="goods">
                <tr class="text-center">
                    <td title=${goods.id}>${goods.id}</td>
                    <td title=${goods.gName}>${goods.gName}</td>
                    <td title=${goods.gPrice}>${goods.gPrice}</td>
                    <td title=${goods.gLy}>${goods.gLy}</td>
                    <td title=${goods.gVid}>${goods.gVid}</td>
                        <%--<td title=${goods.gImg}>${goods.gImg}</td>--%>
                        <%--<td title=${goods.gSImg}>${goods.gSImg}</td>--%>
                    <td title=${goods.gLabel}>${goods.gLabel}</td>
                    <td>
                        <a href="#" onclick="return trash(${goods.id})" style="text-decoration: none;" data-toggle="modal" data-target="#trashModal">
                        <button type="button" class="btn btn-info" data-toggle="button"> 立即获得
                        </button>
                        </a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- 下单的模态框 -->
<div class="modal fade" id="trashModal">
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
                <strong>确定要购买这个商品吗？</strong>
            </div>
            <!-- 模糊框底部 -->
            <div class="modal-footer">
                <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
<%--下单的方法--%>
    function trash(id){
        if(!id){
            alert("error");
        }else{
            $(".delSure").click(function(){
                $.ajax({
                    url: '${pageContext.request.contextPath}/orders/produce?id='+id,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }
    //填充模态框数据
    function buy(id){
        if(!id){
            alert("error");
        }else{
            // 先去查询数据
            $.ajax({
                url: '${pageContext.request.contextPath}/goods/findById.do',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({
                    id: id
                }),
                success: function(data){
                    $("#id").val(data.id);
                    $("#gName").val(data.gName);
                    $("#gPrice").val(data.gPrice);
                    $("#gLy").val(data.gLy);
                    $("#gVid").val(data.gVid);
                    $("#gImg").val(data.gImg);
                    $("#gSImg").val(data.gSImg);
                    $("#gLabel").val(data.gLabel);
                    $("#gDetails").val(data.gDetails);
                    $("#gState").val(data.gState);
                    $("#sIUuid").val(data.sIUuid);
                    $("#buyModal").modal('show');
                },
                error: function(){
                    alert("错误");
                }
            });

        }
    }
    //提交表单的方法
    $(".buySure").click(function(){
        $("#form_buy").submit();
    });
</script>
</html>
