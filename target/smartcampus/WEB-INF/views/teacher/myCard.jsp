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

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="header.jsp"%>
<div class="container">
    <div class="starter-template">
        <button   class="btn  btn-default btn-lg"  data-toggle="modal" data-target="#myCardModal"
        >点击查看
        </button>
    </div>

    <div class="modal fade" id="myCardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title" >我的一卡通</h4>
                </div>
                <div class="modal-body">
                    <!--数据项-->
                    <div class="form-group form-inline">
                        编号：<input type="text" class="form-control" value="${Card.id}">
                    </div>
                    <div class="form-group form-inline">
                        条形码：<input type="text" class="form-control" value="${Card.cardVid}">
                    </div>
                    <div class="form-group form-inline">
                        余额：<input type="text" class="form-control" value="${Card.cardBalance}">
                    </div>
                    <div class="form-group form-inline">
                        申请ID：<input type="text" class="form-control" value="${Card.sqId}">
                    </div>
                    <div class="form-group form-inline">
                        权限：<input type="text" class="form-control" value="${Card.authId}">
                    </div>
                    <div class="form-group form-inline">
                        状态：<input type="text" class="form-control" value="${Card.state}">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class=" btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

