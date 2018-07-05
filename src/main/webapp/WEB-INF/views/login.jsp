<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">


    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>首页</title>
<html>
<body>
<div id="Content">
    <div id="Catalog">
        <div class="container">
            <form class="form-signin" action='${pageContext.request.contextPath}/user/login' method="POST">
                <h2 class="form-signin-heading">请登录</h2>
                <label for="id" class="sr-only">用户名</label>
                <input type="text" id="id" name='id' class="form-control" placeholder="用户名" required autofocus>
                <label for="password" class="sr-only">密码</label>
                <input type="password" id="password" name='password' class="form-control" placeholder="密码" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
            </form>
        </div> <!-- /container -->
    </div>
</div>
</body>
</html>
