<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/7/5
  Time: 9:40
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
            $('#cards').DataTable({
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
        <table class="table" id="cards">
            <thead>
            <tr>
                <th style="text-align: center;">编号</th>
                <th style="text-align: center;">条形码</th>
                <th style="text-align: center;">余额</th>
                <th style="text-align: center;">申请ID</th>
                <%--<th style="text-align: center;">权限</th>--%>
                <th style="text-align: center;">状态</th>
                <th style="text-align: center;">操作</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.cards}" var="card">
                <tr class="text-center">
                    <td title=${card.id}>${card.id}</td>
                    <td title=${card.cardVid}>${card.cardVid}</td>
                    <td title=${card.cardBalance}>${card.cardBalance}</td>
                    <td title=${card.sqId}>${card.sqId}</td>
                    <%--<td title=${card.authId}><c:if test="${card.authId='0'}">学生</c:if>--%>
                        <%--<font color="red"> <c:if test="${card.authId=='1'}">教师</c:if></font></td>--%>
                    <td title=${card.state}>
                        <font color="red"> <c:if test="${card.state=='0'}">不可用</c:if></font>
                        <font color="green"><c:if test="${card.state=='1'}">可用</c:if></font></td>
                    <td>
                        <a href="#" onclick="return deleteApply(${card.id})" style="text-decoration: none;" data-toggle="modal" data-target="#deleteModal">
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
                <strong>确定要删除此申请吗？</strong>
            </div>
            <!-- 模糊框底部 -->
            <div class="modal-footer">
                <button type="button" class="changeSure btn btn-info" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //删除的方法
    function deleteApply(id){
        if(!id){
            alert("error");
        }else{
            $(".changeSure").click(function(){
                $.ajax({
                    url: '${pageContext.request.contextPath}/card/delete?id='+id,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }
</script>

