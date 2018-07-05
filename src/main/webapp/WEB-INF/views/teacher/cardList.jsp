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
    <title>所有列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>

    <script>

        $(document).ready( function () {
            $('#card').DataTable({
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
        <table class="table" id="card">
            <thead>
            <tr>
                <th style="text-align: center;">编号</th>
                <th style="text-align: center;">条形码</th>
                <th style="text-align: center;">余额</th>
                <th style="text-align: center;">申请ID</th>
                <th style="text-align: center;">权限</th>
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
                    <td><c:if test="${card.authId=='0'}">学生</c:if>
                        <c:if test="${card.authId=='1'}">教师</c:if>
                    </td>
                    <td><c:if test="${card.state=='1'}"><font color="green">可用</font></c:if>
                        <c:if test="${card.state=='0'}"><font color="red">不可用</font></c:if></td>
                    <td>
                    <a href="#" onclick="return approveApply(${card.id})" style="text-decoration: none;" data-toggle="modal" data-target="#examineModal">
                        <button type="button" class="btn btn-info" data-toggle="button"> 批准
                        </button>
                    </a>
                    <a href="#" onclick="return rejectApply(${card.id})" style="text-decoration: none;" data-toggle="modal" data-target="#examineModal">
                        <button type="button" class="btn btn-danger" data-toggle="button"> 拒绝
                        </button>
                    </a>
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

<div class="modal fade" id="examineModal">
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
                <strong>继续上述操作？</strong>
            </div>
            <!-- 模糊框底部 -->
            <div class="modal-footer">
                <button type="button" class="changeSure btn btn-info" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
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
    <%--批准的方法--%>
    function approveApply(id){
        if(!id){
            alert("error");
        }else{
            $(".changeSure").click(function(){
                $.ajax({
                    url: '${pageContext.request.contextPath}/card/approve?id='+id,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }
    //拒绝的方法
    function rejectApply(id){
        if(!id){
            alert("error");
        }else{
            $(".changeSure").click(function(){
                $.ajax({
                    url: '${pageContext.request.contextPath}/card/reject?id='+id,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }
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
