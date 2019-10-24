<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-首页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
</head>
<body>
	<div class="header_con">
        <!--扣头-->
		<div id="head" class="header"></div>
        <script type="text/javascript">
            $("#head").load("${pageContext.request.contextPath}/goodsController/toHead")
        </script>
	</div>

	<div class="search_bar clearfix">
		<a href="${pageContext.request.contextPath}/user/index" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="${pageContext.request.contextPath}/user/myCart" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">1</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
				<li class="interval">|</li>
				<li><a href="${pageContext.request.contextPath}/user/index">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="${pageContext.request.contextPath}/user/index">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="center_con clearfix">
	<%-- 抠出来的商品类型：		--%>
		<div id="goodstype" ></div>
		<script type="text/javascript">
			$("#goodstype").load("${pageContext.request.contextPath}/goodsController/GoodsType");
		</script>

		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="${pageContext.request.contextPath}/images/slide.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
		<div class="adv fl">
			<a href="${pageContext.request.contextPath}/user/index"><img src="${pageContext.request.contextPath}/images/adv01.jpg"></a>
			<a href="${pageContext.request.contextPath}/user/index"><img src="${pageContext.request.contextPath}/images/adv02.jpg"></a>
		</div>
	</div>

	<%-- 抠出来的商品列表：		--%>
	<div id="Fruit" ></div>
	<div id="seafood" ></div>
	<div id="meet" ></div>
	<div id="egg" ></div>
	<div id="vegetables" ></div>
	<div id="ice" ></div>
	<script type="text/javascript">
		$("#Fruit").load("${pageContext.request.contextPath}/goodsController/Goods?typeId=1");
		$("#seafood").load("${pageContext.request.contextPath}/goodsController/Goods?typeId=2");
		$("#meet").load("${pageContext.request.contextPath}/goodsController/Goods?typeId=3");
		$("#egg").load("${pageContext.request.contextPath}/goodsController/Goods?typeId=4");
		$("#vegetables").load("${pageContext.request.contextPath}/goodsController/Goods?typeId=5");
		$("#ice").load("${pageContext.request.contextPath}/goodsController/Goods?typeId=6");
	</script>



		<div id="foot" class="footer"></div>
		<!--抠脚：-->
		<script type="text/javascript">
			$("#foot").load("${pageContext.request.contextPath}/goodsController/toFoot");
		</script>

	<script type="text/javascript" src="js/slideshow.js"></script>
	<script type="text/javascript">
		BCSlideshow('focuspic');
		var oFruit = document.getElementById('fruit_more');
		var oShownum = document.getElementById('show_count');

		var hasorder = localStorage.getItem('order_finish');

		if(hasorder)
		{
			oShownum.innerHTML = '2';
		}

		oFruit.onclick = function(){
			window.location.href = 'List.jsp';
		}
	</script>
</body>
</html>