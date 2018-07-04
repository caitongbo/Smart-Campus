<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/28
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
                <a href="${pageContext.request.contextPath}/user/userB" class="navbar-brand">智慧校园</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-gbtag" aria-expanded="false">
                <span class="sr-only">点我啊</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-gbtag">
            <ul class="nav navbar-nav">
                <li><a href="#" data-toggle="modal" data-target="#myModal">我的账号</a></li>
                <li><a href="${pageContext.request.contextPath}/shop/shopInfo">我的店铺</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">商品列表<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/goods/goodsAllListB">所有商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/goods/goodsHasUp">已上架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/goods/goodsHasDown">已下架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/goods/goodsHasOver">已缺货商品</a></li>
                    </ul>
                </li>
                <li><a href="#" onclick="javascript:window.location.reload()">刷新</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" data-toggle="modal" data-target="#logoutModal">退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%--我的账号模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;
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
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<%--店铺信息模态框--%>
    <div class="modal fade" id="myShopInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;
                        <span aria-hidden="true"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">我的店铺</h4>
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
                    <button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

<!-- 退出的模态框 -->
<div class="modal fade" id="logoutModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模糊框头部 -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">嗯？？你要干嘛？！！！</h4>
            </div>
            <!-- 模糊框主体 -->
            <div class="modal-body">
                <strong>确定要吗？噢不对是要推出吗？！！</strong>
            </div>
            <!-- 模糊框底部 -->
            <div class="modal-footer">
                <a href="${pageContext.request.contextPath}/user/logout"><button type="button" class="delSure btn btn-info">稍后再来</button></a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">行吧我再陪你玩会</button>
            </div>
        </div>
    </div>
</div>