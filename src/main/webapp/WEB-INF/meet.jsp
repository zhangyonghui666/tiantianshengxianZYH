<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/22
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
</head>
<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model01">猪牛羊肉</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="list.jsp" class="goods_more fr" id="fruit_more">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">

        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/${goodsBannerImg}"></div>
        <ul class="goods_list fl">
            <c:forEach var="goods" items="${goods}">

            <li>
                <h4><a href="#">${goods.title}</a></h4>
                <a href="detail.jsp"><img src="${pageContext.request.contextPath}/${goods.imgPath}"></a>
                <div class="prize">¥ ${goods.price}</div>
            </li>

            </c:forEach>

        </ul>
    </div>

</div>
