<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/26
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>主页</title>
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
        <button  class="btn  btn-default btn-lg"  data-toggle="modal" data-target="#myCardModal"
        >点击查看
        </button>
    </div>

    <div class="modal fade" id="myCardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;
                        <span aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title" >我的一卡通</h4>
                </div>
                <div class="modal-body">
                    <!--数据项-->
                    <%--<div class="form-group form-inline">--%>
                    <h5>编号：${Card.id}</h5>
                    <h5>姓名：${Card.sqId}</h5>

                    <%--<div class="form-group form-inline">--%>
                    <h5>条形码：${Card.cardVid}</h5>
                    <%--</div>--%>
                    <%--<div class="form-group form-inline">--%>
                    <h5>账户余额：${Card.cardBalance}</h5>

                    <a href="#" data-toggle="modal" data-target="#applyModal" data-dismiss="modal" style="float: right">还没有卡？点击申领</a>
                    <br>
                    <%--<br>--%>

                    <%--<div class="form-group form-inline">--%>
                    <%--申请ID：${Card.sqId}--%>
                    <%--</div>/--%>
                    <%--<div class="form-group form-inline">--%>
                    <%--权限：<input type="text" name="type" class="form-control" value="${Card.authId}">--%>
                    <%--</div>--%>
                    <%--<div class="form-group form-inline">--%>
                    <%--状态：<input type="text" name="authId" class="form-control" value="${Card.state}">--%>
                    <%--</div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class=" btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

<form action="${pageContext.request.contextPath}/card/applyS" method="post" id="form_apply">
    <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;
                        <span aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title" >申请一卡通</h4>
                </div>
                <div class="modal-body">
                    <!--数据项-->
                    <div class="form-group form-inline">
                        UUID：<input type="text" name="uuid" class="form-control" value="${user.uuid}">
                    </div>
                    <div class="form-group form-inline">
                        账号：<input type="text" name="id" class="form-control" value="${user.id}">
                    </div>
                    <div class="form-group form-inline">
                        金额：<input type="text" name="balance" class="form-control" >
                    </div>
                    <%--<div class="form-group form-inline">--%>
                    <%--密码：<input type="text" name="password" class="form-control" value="${user.password}">--%>
                    <%--</div>--%>
                    <%--<div class="form-group form-inline">--%>
                    <%--状态：<input type="text" name="state" class="form-control" value="${user.state}">--%>
                    <%--</div>--%>
                    <%--<div class="form-group form-inline">--%>
                    <%--账号类型：<input type="text" name="type" class="form-control" value="${user.type}">--%>
                    <%--</div>--%>
                    <%--<div class="form-group form-inline">--%>
                    <%--权限：<input type="text" name="authId" class="form-control" value="${user.authId}">--%>
                    <%--</div>--%>
                    <%--<div class="form-group form-inline">--%>
                    <%--类型：<input type="text" name="shopType" class="form-control" value="${user.shopType}">--%>
                    <%--</div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="applySure btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>

<script>
    //提交表单的方法
    $(".applySure").click(function(){
        $("#form_apply").submit();
    });
</script>