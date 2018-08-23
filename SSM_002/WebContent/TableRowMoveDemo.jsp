<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在此处插入标题</title>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>

	<input type="button" onclick="add_line();" value="添加一行">
	<input type="button" onclick="remove_line();" value="删除一行">
	<input type="button" onclick="up_exchange_line();" value="上移">
	<input type="button" onclick="down_exchange_line();" value="下移">

	<table border="1" rules="all" width="600px" id="content">
		<tr>
			<th>序号</th>
			<th>步骤名称</th>
			<th>步骤描述</th>
			<th>相关操作</th>
		</tr>
	</table>

	<script language="javascript">
		var currentStep = 0;
		var max_line_num = 0;
		//添加一行
		function add_line() {
			max_line_num = $("#content tr:last-child").children("td").html();
			if (max_line_num == null) {
				max_line_num = 1;
			} else {
				max_line_num = parseInt(max_line_num);
				max_line_num += 1;
			}
			$('#content').append(
					"<tr id='line" + max_line_num + "' onclick='lineclick(this);'>"
					+ "<td>" + max_line_num + "</td>"
					+ "<td>打开网页" + max_line_num + "</td>"
					+ "<td>打开登录网页" + max_line_num + "</td>"
					+ "<td>删除  编辑</td>"
					+ "</tr>");
		}
		//删除选中行
		function remove_line() {
			$("#content tr").each(function() {
				var seq = parseInt($(this).children("td").html());
				if (seq == currentStep)
					$(this).remove();
				if (seq > currentStep)
					$(this).children("td").each(function(i) {
						if (i == 0)
							$(this).html(seq - 1);
					});
			});
			currentStep = 0;
		}
		//选中行上移
		function up_exchange_line() {
			if (currentStep == 0) {
				alert('请选择一项!');
				return false;
			}
			if (currentStep <= 1) {
				alert('非法操作!');
				return false;
			}
			var upStep = currentStep - 1;
			//修改序号
			$('#line' + upStep + " td:first-child").html(currentStep);
			$('#line' + currentStep + " td:first-child").html(upStep);
			//取得两行的内容
			var upContent = $('#line' + upStep).html();
			var currentContent = $('#line' + currentStep).html();
			$('#line' + upStep).html(currentContent);
			//交换当前行与上一行内容
			$('#line' + currentStep).html(upContent);
			$('#content tr').each(function() {
				$(this).css("background-color", "#ffffff");
			});
			$('#line' + upStep).css("background-color", "yellow");
			currentStep = upStep;
		}
		//选中行下移
		function down_exchange_line() {
			if (currentStep == 0) {
				alert('请选择一项!');
				return false;
			}
			if (currentStep >= max_line_num) {
				alert('非法操作!');
				return false;
			}
			var nextStep = parseInt(currentStep) + 1;
			//修改序号
			$('#line' + nextStep + " td:first-child").html(currentStep);
			$('#line' + currentStep + " td:first-child").html(nextStep);
			//取得两行的内容
			var nextContent = $('#line' + nextStep).html();
			var currentContent = $('#line' + currentStep).html();
			$('#line' + nextStep).html(currentContent);
			//交换当前行与上一行内容
			$('#line' + currentStep).html(nextContent);
			$('#content tr').each(function() {
				$(this).css("background-color", "#ffffff");
			});
			$('#line' + nextStep).css("background-color", "yellow");
			currentStep = nextStep;
		}
		//点击选中一行
		function lineclick(line) {
			$('#content tr').each(function() {
				$(this).css("background-color", "#ffffff");
			});
			var seq = $(line).children("td").html();
			$(line).css("background-color", "yellow");
			currentStep = seq;
		}
	</script>
</body>
</html>