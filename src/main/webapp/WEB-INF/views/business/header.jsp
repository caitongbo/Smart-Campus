<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/28
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script> function foo() {
    if (confirm("确认退出吗？")) {
        return true;
    }
    return false;
}
</script>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
                <a href="#" class="navbar-brand">智慧校园</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-gbtag" aria-expanded="false">
                <span class="sr-only">点我啊</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-gbtag">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/user/userB" data-toggle="modal" data-target="#myModal">我的账号</a></li>
                <li><a href="${pageContext.request.contextPath}/shop/shopInfo">关于店铺</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">商品列表<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/goods/goodsAllListB">所有商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/goods/goodsHasUp">已上架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/goods/goodsHasDown">已下架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/goods/goodsHasOver">暂时缺货商品</a></li>
                    </ul>
                </li>

                <li><a href="#" onclick="javascript:window.location.reload()">刷新</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/user/login"   onclick="return foo();">退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<form method="post" action="#" id="form_user">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
                <h4 class="modal-title">我的账号</h4>
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
                    密码：<input type="text" name="password" class="form-control" value="${user.password}">
                </div>
                <div class="form-group form-inline">
                    状态：<input type="text" name="state" class="form-control" value="${user.state}">
                </div>
                <div class="form-group form-inline">
                    账号类型：<input type="text" name="type" class="form-control" value="${user.type}">
                </div>
                <div class="form-group form-inline">
                    权限：<input type="text" name="authId" class="form-control" value="${user.authId}">
                </div>
                <div class="form-group form-inline">
                    类型：<input type="text" name="shopType" class="form-control" value="${user.shopType}">
                </div>
                <!-- end-->

            </div>
            <div class="modal-footer">
                <button type="button" class="addSure btn btn-info">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
</form>
<form method="post" action="#" id="form_shopInfo">
    <div class="modal fade" id="myShopInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">关于店铺</h4>
                </div>
                <div class="modal-body">
                    <!--数据项-->
                    <div class="form-group form-inline">
                        店铺名称：<input type="text"  class="form-control" value="${ShopInfo.shopName}">
                    </div>
                    <div class="form-group form-inline">
                        店铺地址：<input type="text"  class="form-control" value="${ShopInfo.showAddr}">
                    </div>
                    <!-- end-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="addSure btn btn-info">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    //提交表单的方法
    $(".addSure").click(function(){
        $("#form_user").submit();
    });
    //提交表单的方法
    $(".addSure").click(function(){
        $("#form_shopInfo").submit();
    });
</script>
