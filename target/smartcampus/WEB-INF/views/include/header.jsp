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
                <a href="<%=basePath%>/goods" class="navbar-brand">智慧校园</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-gbtag" aria-expanded="false">
                <span class="sr-only">点我啊</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-gbtag">
            <ul class="nav navbar-nav">
                <li><a href="<%=basePath%>/goods/goodsInfo">我的的商品</a></li>
                <li><a href="<%=basePath%>/goods/test">我的的商品test</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">商品状况<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%--<li><a data-toggle="modal" data-target="#addModal">已上架商品</a></li>--%>
                            <li><a href="<%=basePath%>/goods/goodsHasUp">已上架商品</a></li>
                        <li><a href="<%=basePath%>/goods/goodsHasDown">已下架商品</a></li>
                        <li><a href="<%=basePath%>/goods/goodsHasOver">暂时缺货商品</a></li>
                    </ul>
                </li>
                <li><a href="<%=basePath%>/shopInfo">商家信息</a></li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=basePath%>"  onclick="return foo();"><span class="glyphicon glyphicon-log-out"></span>退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 添加的模态框 -->
<form method="post" action="<%=basePath%>/goods/save" id="form_add">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">上架商品</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group form-inline">
                        <label>商品名称：</label>
                        <input type="text" name="g_name" class="form-control" />
                    </div>
                    <div class="form-group form-inline">
                        <label>商品价格：</label>
                        <input type="text" name="g_price" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商品来源：</label>
                        <input type="text" name="g_ly" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>条形码：</label>
                        <input type="text" name="g_vid" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商品图片：</label>
                        <input type="text" name="g_img" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商品缩略图：</label>
                        <input type="text" name="g_simg" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商品描述：</label>
                        <input type="text" name="g_label" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商品详情：</label>
                        <input type="text" name="g_details" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商品状态：</label>
                        <input type="text" name="g_state" class="form-control"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>商家ID：</label>
                        <input type="text" name="s_i_uuid" class="form-control"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="addSure btn btn-info" data-dismiss="modal">上架</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
//提交表单的方法
$(".addSure").click(function(){
$("#form_add").submit();
});
</script>
