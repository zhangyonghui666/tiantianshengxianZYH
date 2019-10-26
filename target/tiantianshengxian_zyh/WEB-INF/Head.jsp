<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/23
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
</head>

<div class="welcome fl">
    <span id="isUser">
        <shiro:user>
            <shiro:principal></shiro:principal>
        </shiro:user>
    </span>
    欢迎来到天天生鲜!
</div>
<div class="fr">
    <div class="login_info fl">
        欢迎您：<em>张 山</em>
    </div>
    <div id="loginAndRegist" class="login_btn fl">
        <a href="${pageContext.request.contextPath}/user/login">登录</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/regist">注册</a>
    </div>
    <script type="text/javascript">
        $(function () {
            var isUser=$("#isUser").text();
            if (isUser != null && isUser!="") {
                $("#loginAndRegist").hide();
            }
        });

    </script>
    <div class="user_link fl">
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/userCenter">用户中心</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/myCart">我的购物车</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/myOrder">我的订单</a>
    </div>

</div>
