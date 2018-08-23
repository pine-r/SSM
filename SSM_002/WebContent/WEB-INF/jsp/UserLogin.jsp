<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	border: 0;
	background-color: #333;
}

.loginPanel {
	position: absolute;
	text-align: center;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 160px;
	margin-left: -150px;
	margin-top: -80px;
	background-color: #eee;
}


</style>

</head>
<body onload="isLoginReturn()">
	<div class="loginPanel">
		<form id="form" action="UserLogin.do" method="post">
			<fieldset>
				<legend>登陆</legend>
				<br />
				<div>
					用户： <input name="account" id="loginName" />&nbsp;<font
						id="nameResul" size="3" color="red">*</font>
				</div>
				<br />
				<div>
					密码： <input name="password" id="pwd" />&nbsp;<font id="pwdResul"
						size="3" color="red">*</font>
				</div>
				<br /> 
					<input type="button" onclick="cheak()" value="提交" /> 
					<input type="button" onclick="gotoReg()" value="注册" />
					<input type="button" onclick="location.href = 'index.jsp'" value="返回首页" />
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
		function isLoginReturn() {
			var msg = "${error}";
			if (msg != null && msg.trim() != "") {
				alert(msg);
			}
		}
		function cheak() {
			var userName = document.getElementById("loginName").value;
			var password = document.getElementById("pwd").value;

			if (userName == null || userName == "") {
				alert("登录名不能为空！");
				return false;
			}
			if (password == null || password == "") {
				alert("密码不能为空！");
				return false;
			}
			document.getElementById("form").submit();
		}
	</script>
</body>

</html>