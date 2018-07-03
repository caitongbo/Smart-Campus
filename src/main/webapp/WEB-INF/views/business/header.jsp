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
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
                <a href="#" class="navbar-brand">智慧校园</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-gbtag" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-gbtag">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/user/userB">我的账号</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的商品<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/goods/goodsInfo">所有商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/goods/goodsHasUp">已上架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/goods/goodsHasDown">已下架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/goods/goodsHasOver">暂时缺货商品</a></li>
                    </ul>
                </li>
                    <li><a href="${pageContext.request.contextPath}/shop/shopInfo">关于店铺</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/user/login"   onclick="return foo();">退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<nav>
