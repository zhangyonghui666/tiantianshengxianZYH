<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.2.js"></script>
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
			<a href="${pageContext.request.contextPath}/cart/toCart" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">0</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>
				<!--抠出来的商品类型：-->
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
		<a href="${pageContext.request.contextPath}/goodsController/toList?typeId=${Singlegoods.typeId}">${goodsTypeTitle}</a>
		<span>></span>
		<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${Singlegoods.id}&typeId=${Singlegoods.typeId}">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl"><img src="${pageContext.request.contextPath}/${Singlegoods.bannerPath}"></div>

		<div class="goods_detail_list fr">
			<h3>${Singlegoods.title}</h3>
			<p>${Singlegoods.detail}</p>
			<div class="prize_bar">
				<span class="show_pirze">¥<em id="price">${Singlegoods.price}</em></span>
				<span class="show_unit">单  位：500g</span>
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：
					<span></span>
				</div>
				<div class="num_add fl">
					<input id="goodsNum" type="text" class="num_show fl" value="1">
					<a id="add" href="#" class="add fr"> +  </a>
					<a id="sub" href="#" class="minus fr">-</a>
				</div>
			</div>
			<div class="total">总价：<span id="totleMoney">${Singlegoods.price}</span>元</div>
			<script type="text/javascript">
				// 加：
				$("#add").click(function () {
					// 单价：
					var price = Number($("#price").text());
					// alert(price);

					// 数量加一：
					var goodNum = Number($("#goodsNum").val());
					goodNum = goodNum + 1;
					$("#goodsNum").val(goodNum);

					// 重新计算总价：
					var totalMoney = Number($("#totleMoney").text());
					// alert(totalMoney);
					totalMoney=(totalMoney+price);
					$("#totleMoney").text(totalMoney);
				});
				// 减：
				$("#sub").click(function () {
					// 单价：
					var price = Number($("#price").text());
					// alert(price);

					// 数量减一：
					var goodNum = Number($("#goodsNum").val());
					goodNum = goodNum - 1;
					// 判断：
					if (goodNum < 1) {
						goodNum = 1;
					}
					$("#goodsNum").val(goodNum);

					// 重新计算总价：
					var totalMoney = Number($("#totleMoney").text());
					// alert(totalMoney);
					totalMoney=(goodNum*price);
					$("#totleMoney").text(totalMoney);
				});
				// 手动输入：
				$("#goodsNum").blur(function () {
					// 单价：
					var price = Number($("#price").text());
					// alert(price);

					// 判断数量：：
					var goodNum = Number($("#goodsNum").val());
					// 小于1不行：
					if (goodNum < 1) {
						goodNum = 1;
					}
					$("#goodsNum").val(goodNum);

					// 重新计算总价：
					var totalMoney = Number($("#totleMoney").text());
					// alert(totalMoney);
					totalMoney=(goodNum*price);
					$("#totleMoney").text(totalMoney);
				})

			</script>
			<div class="operate_btn">
				<a href="javascript:;" class="buy_btn">立即购买</a>
				<a href="#" class="add_cart" id="add_cart">加入购物车</a>				
			</div>
			<div class="add_jump"></div>
			<script type="text/javascript">

				$("#add_cart").click(function () {

					var $add_x = $('#add_cart').offset().top;
					var $add_y = $('#add_cart').offset().left;

					var $to_x = $('#show_count').offset().top;
					var $to_y = $('#show_count').offset().left;

					$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'});
					// alert("!!!!!!!!!!!!!!!!!!!!!!");
					var show_count=Number($("#show_count").text());
					show_count = show_count + 1;

					$(".add_jump").stop().animate({
								'left': $to_y+7,
								'top': $to_x+7},
							"fast", function() {
								$(".add_jump").fadeOut('fast',function(){
									$('#show_count').html();
								});
							});

					$("#show_count").text(show_count);
					$.ajax({
						url: "${pageContext.request.contextPath}/cart/insertGoods",
						type:"post",
						async: true,
						data:{"goodsId":"${goodsId}","goodsNum":"1"},
						complete:function (ret) {
							if (ret.status=="firstok"){
								alert("第一次添加成功");
							}else {
								alert("添加购物车成功");
							}
						}
					});
				});
			</script>
		</div>
	</div>


	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood02.id}&typeId=${singleGood02.typeId}"><img src="${pageContext.request.contextPath}/${singleGood02.imgPath}"></a>
						<h4><a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood02.id}&typeId=${singleGood02.typeId}">美国${singleGood02.title}</a></h4>
						<div class="prize">￥${singleGood02.price}</div>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood03.id}&typeId=${singleGood03.typeId}"><img src="${pageContext.request.contextPath}/${singleGood03.imgPath}"></a>
						<h4><a href="${pageContext.request.contextPath}/goodsController/toDetail?goodsId=${singleGood03.id}&typeId=${singleGood03.typeId}">美国${singleGood03.title}</a></h4>
						<div class="prize">￥${singleGood03.price}</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>${Singlegoods.detail} </dd>
					<dd>${Singlegoods.detail} </dd>
				</dl>
			</div>

		</div>
	</div>

	<div id="foot" class="footer"></div>
	<!--抠脚：-->
	<script type="text/javascript">
		$("#foot").load("${pageContext.request.contextPath}/goodsController/toFoot");
	</script>


	
</body>
</html>