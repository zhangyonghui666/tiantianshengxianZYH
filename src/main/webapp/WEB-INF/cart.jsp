<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
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
		<a href="index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>

	<div class="total_count">全部商品<em>2</em>件</div>	
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>

	<c:forEach var="goods" items="${allGoods}">
	<ul id="oneGoods${goods.goodsId}" class="cart_list_td clearfix">
		<li class="col01"><input class="checkedbox" type="checkbox" name="" checked></li>
		<li class="col02"><img src="${pageContext.request.contextPath}/${goods.imgPath}"></li>
		<li class="col03">${goods.title}<br><em>${goods.price}元/500g</em></li>
		<li class="col04">500g</li>
		<!--商品单价：id：price-->
		<li class="col05">
			<a id="price${goods.goodsId}" href="#">${goods.price} </a>元
		</li>

		<li class="col06">
			<div class="num_add">
				<!--加按钮  id：add  -->
				<a  class="add fl">
					<span id="add" onclick="add(${goods.goodsId},${goods.userId})">+</span>
				</a>
				<!--商品数量：  id: goodsNum-->
				<input id="goodsNum${goods.goodsId}" type="text" class="num_show fl" value="1" onblur="num(${goods.goodsId},${goods.userId})">
				<!--减按钮  id:sub  -->
				<a id="sub" class="minus_zyh fl" onclick="sub(${goods.goodsId},${goods.userId})">-</a>
			</div>
		</li>
		<li class="col07">
			<!--小结  id：singleMoney  -->
			<span id="singleMoney${goods.goodsId}">${goods.price}</span>
			元
		</li>
		<!-- 删除  id：delete  -->
		<li  class="col08"><a id="delete${goods.goodsId}" onclick="deleteGoods(${goods.goodsId},${goods.userId})">删除</a></li>
	</ul>
	</c:forEach>


	<ul class="settlements">
		<li class="col01"><input id="allSelectChecked" type="checkbox" name="" checked=""></li>
		<li class="col02" id="allSelect">全选</li>
		<li class="col03">合计(不含运费)：
			<span>¥</span>
			<!-- 选中的商品的总金额： class： totleMoney -->
			<em class="totleMoney">42.60</em>
			<br>共计
			<!-- 选中的商品的总数量： class： totleNum -->
			<b class="totleNum">2</b>
			件商品
		</li>
		<li class="col04"><a href="place_order.jsp">去结算</a></li>
	</ul>



	<div id="foot" class="footer"></div>
	<!--抠脚：-->
	<script type="text/javascript">
		$("#foot").load("${pageContext.request.contextPath}/goodsController/toFoot");
	</script>


	<script type="text/javascript">
		// 加：
		function add(goodsId,userId){
			// 单价：
			// alert($("#price"+goodsId+"").text());
			var price = Number($("#price"+goodsId+"").text());
			// alert(price);

			// 数量加一：
			var goodNum = Number($("#goodsNum"+goodsId+"").val());
			// alert(goodNum);
			goodNum = goodNum + 1;
			$("#goodsNum"+goodsId+"").val(goodNum);

			// 重新计算小结：
			var singleMoney = Number($("#singleMoney"+goodsId+"").text());
			// alert(singleMoney);
			singleMoney=(goodNum*price);
			$("#singleMoney"+goodsId+"").text(singleMoney);

			// 发送Ajax异步请求：  goodsId,  goodsNum
			var data={};
			data["goodsId"]=goodsId;
			data["goodsNum"]=goodNum;
			$.ajax({
				url:"${pageContext.request.contextPath}/cart/update",
				data:JSON.stringify(data),
				type:"put",
				contentType:"application/json;charset=UTF-8",
				success:function (ret) {
					if (ret.status == "update") {
						alert("更新成功");
					}
				}
			});
		}


		// 减：
		function sub(goodsId,userId) {
			// 单价：
			var price = Number($("#price"+goodsId+"").text());
			// alert(price);

			// 数量减一：
			var goodNum = Number($("#goodsNum"+goodsId+"").val());
			// alert(goodNum);
			goodNum = goodNum - 1;
			// 判断：
			if (goodNum < 1) {
				goodNum = 1;
			}
			$("#goodsNum"+goodsId+"").val(goodNum);

			// 重新计算总价：
			var singleMoney = Number($("#singleMoney"+goodsId+"").text());
			// alert(singleMoney);
			singleMoney=(goodNum*price);
			$("#singleMoney"+goodsId+"").text(singleMoney);

			// 发送Ajax异步请求：  goodsId,  goodsNum
			var data={};
			data["goodsId"]=goodsId;
			data["goodsNum"]=goodNum;
			$.ajax({
				url:"${pageContext.request.contextPath}/cart/update",
				data:JSON.stringify(data),
				type:"put",
				contentType:"application/json;charset=UTF-8",
				success:function (ret) {
					// alert(ret.status);
					if (ret.status == "update") {
						alert("更新成功");
					}
				}
			});
		}

		// 手动输入：
		function num(goodsId,userId) {

			// 单价：
			var price = Number($("#price"+goodsId+"").text());
			// alert(price);

			// 判断数量：：
			var goodNum = Number($("#goodsNum"+goodsId+"").val());
			// 小于1不行：
			if (goodNum < 1) {
				goodNum = 1;
			}
			$("#goodsNum"+goodsId+"").val(goodNum);

			// 重新计算总价：
			var singleMoney = Number($("#singleMoney"+goodsId+"").text());
			// alert(totalMoney);
			singleMoney=(goodNum*price);
			$("#singleMoney"+goodsId+"").text(singleMoney);


			// 发送Ajax异步请求：  goodsId,  goodsNum
			var data={};
			data["goodsId"]=goodsId;
			data["goodsNum"]=goodNum;
			$.ajax({
				url:"${pageContext.request.contextPath}/cart/update",
				data:JSON.stringify(data),
				type:"put",
				contentType:"application/json;charset=UTF-8",
				success:function (ret) {
					if (ret.status == "update") {
						alert("更新成功");
					}
				}
			});
		}


		// 删除购物车中的该商品： 参数： goodsId userId

		function deleteGoods(goodsId,userId) {

			var isDelete = confirm("您确定要删除该商品嘛？");
			if (isDelete) {
				$.ajax({
					url:"${pageContext.request.contextPath}/cart/delete/"+goodsId+"",
					async:true,
					type:"delete",
					success:function (ret) {
						if (ret.status == "deleteok") {
							alert(" 删除成功");
						}else{
							alert("删除失败");
						}
					}
				});

				$("#oneGoods"+goodsId+"").remove();
			}
		}

	</script>




	<script type="text/javascript">
		// 实现全选功能
		$("#allSelect").click(function () {  // 当点击全选按钮时，触发这个匿名函数：

			//获取全选的那个单选框的checked属性值
			var isChecked=$("#allSelectChecked").prop("checked");
			// 如果 全选的那个单选框的checked属性值为true
			if (isChecked == true) {
				// 则 取消全选；
				$("#allSelectChecked").prop("checked",false);
				$(".checkedbox").prop("checked",false);
			}else{   // 如果 全选的那个单选框的checked属性值为false

				// 则 进行全选；
				$("#allSelectChecked").prop("checked", true);
				$(".checkedbox").prop("checked", true);
			}
		});
		
		
		$(function () {

		})
	</script>
</body>
</html>