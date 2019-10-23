<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="login_top clearfix">
		<a href="index.jsp" class="login_logo"><img src="${pageContext.request.contextPath}/images/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="${pageContext.request.contextPath}/user/regist">立即注册</a>
				</div>
				<div class="form_input">
					<form id="login_form">
						<input id="usernameID" type="text" name="username" class="name_input" placeholder="请输入用户名">
						<div class="user_error">输入错误</div>
						<input id="passwordID" type="password" name="password" class="pass_input" placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div  style="position: absolute;left: 0;top: 120px;">
							<img id="cap" src="${pageContext.request.contextPath}/captcha" style="height: 40px; vertical-align: middle;">
							<input id="capInput" style="background: #fdfdfd;height: 25px;width: 100px;vertical-align: middle;">
						</div>
						<div class="more_input clearfix">
							<input type="checkbox" name="checkBox">
							<label>记住用户名</label>
							<a href="${pageContext.request.contextPath}/user/regist">忘记密码</a>
						</div>
						<input id="loginID" type="button" name="login" value="登录" class="input_submit">
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var username_error = true;
	var password_error = true;
	var code_error = true;

	// 验证码刷新：
	$("#cap").click(function () {
		path = $(this).attr("src") +"?"+ new Date().getTime();
		$(this).attr("src", path);
	});



	// 判断用户名和密码  是否为空：
		$("#usernameID").blur(function () {
			var username = $("#usernameID").val();
			if (username == null || username=="") {
				// alert("用户名不能为空！");
				username_error = true;
			}else{
				username_error = false;
			}

		});
		$("#passwordID").blur(function () {
			var password = $("#passwordID").val();
			if (password == null || password=="") {
				password_error = true;
			}else{
				password_error = false;
			}
		});


	// 验证码Ajax判断：
	$("#capInput").blur(function () {
		var codeInput = $("#capInput").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/user/isValicode",
			type: "post",
			data: "codename="+codeInput,
			success:function (ret) {
				if (ret.status == "codeisno") {
					alert("验证码输入错误，请重新输入！");
					$("#capInput").val("");
					code_error = true;
				} else {
					code_error = false;
				}
			}
		})
	});



	// 登录判断：
	$("#loginID").click(function () {


		if (code_error == false) {
			if (username_error == false && password_error == false) {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/login",
					type: "post",
					data: $("#login_form").serialize(),
					success: function (ret) {
						if (ret.code == 0) {
							alert(ret.msg);
							location.href = "${pageContext.request.contextPath}/user/index";
						} else {
							alert(ret.msg);
							/* 验证码刷新：*/
							var path = $("#cap").attr("src") + "?" + new Date().getTime();
							$("#cap").attr("src", path);
						}
					}
				});
			} else {
				alert("用户名和密码不能为空！")
			}
		} else {
			alert("验证码错误！")
		}
	});



</script>
	<div class="footer no-mp">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	
</body>
</html>