<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>元素动态编辑演示</title>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<table border="1" rules="all" align="center" width="600px">
	<tr align="center">
		<td width="60px">ID</td>
		<td width="200px">用户名</td>
		<td>地址</td>
	</tr>
	<tr>
		<td align="center">1</td>
		<td idValue="1" nameValue="userName" ondblclick="dynamicEdit(this,'dynamicEdit.do')">张三</td>
		<td idValue="1" nameValue="address" ondblclick="dynamicEdit(this,'dynamicEdit.do')">成都</td>
	</tr>
	<tr>
		<td align="center">2</td>
		<td idValue="2" nameValue="userName" ondblclick="dynamicEdit(this,'dynamicEdit.do')">李四</td>
		<td idValue="2" nameValue="address" ondblclick="dynamicEdit(this,'dynamicEdit.do')">西安</td>
	</tr>
	<tr>
		<td align="center">3</td>
		<td idValue="3" nameValue="userName" ondblclick="dynamicEdit(this,'dynamicEdit.do')">王五</td>
		<td idValue="3" nameValue="address" ondblclick="dynamicEdit(this,'dynamicEdit.do')">北京</td>
	</tr>
</table>
<script type="text/javascript">
//表格单元内容格动态修改
function dynamicEdit(obj,urlStr){
	var $Obj = $(obj);
	var oldValue = $Obj.text();
	var inputObj = $("<input id='edit' value='"+oldValue+"'>").appendTo($Obj.html(""));
	inputObj.on("blur",function(){
		var newValue = inputObj.val();
		if(newValue==oldValue){
			$Obj.html(newValue);
			return;
		}
		$.ajax({
			url : urlStr,
			type : "post",
			data : {
				"id":$Obj.attr("idValue"),
				"name":$Obj.attr("nameValue"),
				"value":newValue,
			},
			success : function(data) {
				if(data=="success"){
					$Obj.html(newValue);
				}else{
					$Obj.html(oldValue);
					alert("修改失败");
				}
			},
			error : function() {
				alert("error");
			}	
		});
	}).focus();	
}
</script>
</body>
</html>