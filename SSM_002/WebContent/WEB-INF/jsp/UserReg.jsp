<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>用户注册</title>
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
	width: 340px;
	height: 200px;
	margin-left: -170px;
	margin-top: -100px;
	background-color: #eee;
}
</style>
<script src="js/jquery.js"></script>
</head>

<body>
	<div class="loginPanel">
		<form id="form" action="UserReg.do" method="post">
			<fieldset>
				<legend>用户注册</legend>
				<table>
					<tr height="36">
						<td align="right">帐号：</td>
						<td><input name="userName" id="loginName" onblur="check()"/></td>
						<td><font id="nameResul" size="1" color="red">&nbsp;&nbsp;&nbsp;</font></td>
					</tr>
					<tr height="36">
						<td align="right">密码：</td>
						<td><input name="password" id="pwd" /></td>
						<td></td>
					</tr>
					<tr height="36">
						<td align="right">重复密码：</td>
						<td><input id="pwd" /></td>
						<td></td>
					</tr>
					<tr height="36">
						<td align="center" colspan="3">
							<input type="button" onclick="cheak()" value="提交" /> 
							<input type="button" onclick="location.href = 'index.jsp'" value="返回首页" />
						</td>
					</tr>
				</table>
			</fieldset>
			
		</form>
	</div>
<script type="text/javascript">
	function check(){
		var name = document.getElementById("loginName").value;	
		if(name!=null && name!=""){
			$.ajax({
					url:"ajax_AccoutNumCheak.action",
					type:"post",
					dataType:"text",
					data:{
						username:name
					},
					success:function(responseText){
						var obj = document.getElementById("nameResul");
						if(responseText=="1"){
							obj.color = "Green";
							obj.innerHTML = "ok";
						}else{
							obj.color = "Red";
							obj.innerHTML = "已存在";
						}
						
					},
					error:function(){
						alert("system error");
					}
				});
		}
	}
</script>
</body>
</html>
