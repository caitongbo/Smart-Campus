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
                <li><a href="${pageContext.request.contextPath}/user/userS">我的账号</a></li>
                <li><a href="${pageContext.request.contextPath}/card/myCardS">我的一卡通</a></li>
                <li><a href="${pageContext.request.contextPath}/orders/studentOrder">我的订单</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/user/login"  onclick="return foo();">退出系统</a></li>
            </ul>
            </li>
            </ul>
        </div>
    </div>
</nav>
