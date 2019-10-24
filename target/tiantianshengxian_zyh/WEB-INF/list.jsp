<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品列表</title>
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
			<div class="goods_count fl">1</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>
				<%-- 抠出来的商品类型：		--%>
				<div id="goodstype" ></div>
				<script type="text/javascript">
					$("#goodstype").load("${pageContext.request.contextPath}/goodsController/GoodsType");
				</script>
			</div>
			<ul class="navlist fl">
				<li><a href="${pageContext.request.contextPath}/user/index">首页</a></li>
				<li class="interval">|</li>
				<li><a href="${pageContext.request.contextPath}/user/index">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="${pageContext.request.contextPath}/user/index">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="${pageContext.request.contextPath}/user/index">全部分类</a>
		<span>></span>
		<a href="${pageContext.request.contextPath}/goodsController/toList?typeId=${typeId}">${goodsTitle}</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood02.id}&typeId=${singleGood02.typeId}">
							<img src="${pageContext.request.contextPath}/${singleGood02.imgPath}">
						</a>
						<h4>
							<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood02.id}&typeId=${singleGood02.typeId}">
								美国${singleGood02.title}
							</a>
						</h4>
						<div class="prize">
							￥${singleGood02.price}
						</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood03.id}&typeId=${singleGood03.typeId}">
							<img src="${pageContext.request.contextPath}/${singleGood03.imgPath}">
						</a>
						<h4>
							<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood03.id}&typeId=${singleGood03.typeId}">
								美国${singleGood03.title}
							</a>
						</h4>
						<div class="prize">
							 ￥${singleGood03.price}
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a class="paixu" href="${pageContext.request.contextPath}/goodsController/toList?order=id&typeId=${typeId}&pageNum=${pageInfo.pageNum}" >默认</a>
				<a class="paixu" href="${pageContext.request.contextPath}/goodsController/toList?order=price&typeId=${typeId}&pageNum=${pageInfo.pageNum}">价格</a>
				<a class="paixu" href="#">人气</a>
			</div>
			<script type="text/javascript">
				$(".paixu").click(function () {
					$(this).addClass("active");
				});
			</script>

			<ul class="goods_type_list clearfix">
				<c:forEach items="${goods}" var="good">
					<li>
						<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${good.id}&typeId=${good.typeId}"><img src="${pageContext.request.contextPath}/${good.imgPath}"></a>
						<h4><a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${good.id}&typeId=${good.typeId}">${good.title}</a></h4>
						<div class="operate">
							<span class="prize">￥${good.price}</span>
							<span class="unit">￥${good.price}/500g</span>
							<a href="#" class="add_goods" title="加入购物车"></a>
						</div>
					</li>
				</c:forEach>
			</ul>

			<div class="pagenation">
				<a class="pageClick" href="${pageContext.request.contextPath}/goodsController/toList?order=${order}&typeId=${typeId}&pageNum=${pageInfo.navigateFirstPage}">首页</a>
				<!--没有前一页了-->
				 <c:if test="${pageInfo.hasPreviousPage}">
					上一页
				</c:if>
				<a class="pageClick" href="${pageContext.request.contextPath}/goodsController/toList?order=${order}&typeId=${typeId}&pageNum=${pageInfo.prePage}">上一页</a>
 				<a class="pageClick" href="${pageContext.request.contextPath}/goodsController/toList?order=${order}&typeId=${typeId}&pageNum=1" >1</a>
				<a class="pageClick" href="${pageContext.request.contextPath}/goodsController/toList?order=${order}&typeId=${typeId}&pageNum=2">2</a>
				<!--没有下一页了-->
				 <c:if test="${pageInfo.hasNextPage}">
					下一页
				</c:if>
				<a class="pageClick" href="${pageContext.request.contextPath}/goodsController/toList?order=${order}&typeId=${typeId}&pageNum=${pageInfo.nextPage}">下一页></a>
				<a class="pageClick" href="${pageContext.request.contextPath}/goodsController/toList?order=${order}&typeId=${typeId}&pageNum=${pageInfo.navigateLastPage}">尾页></a>
			</div>
			<script type="text/javascript">
				$(".pageClick").click(function () {
							$(this).addClass("active");
				});

			</script>
		</div>
	</div>

	<div id="foot" class="footer"></div>
	<!--抠脚：-->
	<script type="text/javascript">
		$("#foot").load("${pageContext.request.contextPath}/goodsController/toFoot");
	</script>
	
</body>
</html>