<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息查询</title>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	background-color: #333;
}

.userquery {
	width: 100%;
	background-color: #eee;
}

.userqueryresult {
	width: 100%;
	background-color: #eee;
}

#customersTb {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	width: 80%;
	border-collapse: collapse;
}

#customersTb td, #customers th {
	font-size: 16px;
	border: 1px solid #98bf21;
	padding: 3px 7px 2px 7px;
}

#customersTb th {
	font-size: 20px;
	text-align: centred;
	padding-top: 5px;
	padding-bottom: 4px;
	background-color: #A7C942;
	color: #ffffff;
}

#customersTb tr.alt td {
	color: #000000;
	background-color: #EAF2D3;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
</head>
<body>
	<div class="userquery">

		<fieldset>
			<legend>查询条件</legend>
			<form id="form1" action="UserQuery.do" method="post">
				<div>
					帐号:<input id="account" name="account" value="${user.account }"/>&nbsp; 
					姓名:<input id="username" name="userDetaile.userName"  value="${user.userDetaile.username }"/>&nbsp; 
					生日:<input id="birthday" name="userDetaile.birthday"  value="<fmt:formatDate value="${user.userDetaile.birthday}" pattern="yyyy-MM-dd" />"/>&nbsp; 
					性别:<input id="sex" name="userDetaile.sex"  value="${user.userDetaile.sex }" />&nbsp; 
					地址:<input id="address" name="userDetaile.address"  value="${user.userDetaile.address }"/>&nbsp;
				</div>
				&nbsp;
				<div style="text-align: center;">
					<input type="button" id="querybut" value="查询">&nbsp;&nbsp; 
					<input type="button" id="resetbut" value="复位">&nbsp;
				</div>
				<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }">
				<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
				<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
			</form>

		</fieldset>
	</div>
	&nbsp;
	<div class="userqueryresult">
		<fieldset>
			<legend>查询结果</legend>
			<table id="customersTb">
				<tr>
					<th width="30px"><input type="checkbox" id="checkReverse" /></th>
					<th>帐号</th>
					<th>姓名</th>
					<th>生日</th>
					<th>性别</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${page.objList}" var="user">
					<tr>
						<td align="center"><input type="checkbox" /></td>
						<td>${user.account}</td>
						<td><a href="UserInfoUpdatePage.do?userid=${user.id }">${user.userDetaile.username}</a></td>
						<td><fmt:formatDate value="${user.userDetaile.birthday}"
								pattern="yyyy-MM-dd" /></td>
						<td>${user.userDetaile.sex}</td>
						<td>${user.userDetaile.address}</td>
						<td><input type="button" value="删除" onclick="delete_(${user.id })"></td>
					</tr>
				</c:forEach>
				<c:if test="${page.objList!=null}">
					<tr>
						<td colspan="6" align="center">
							<button onclick="pageTurn_Ajax(1)">首页</button> &nbsp;
							<button onclick="pageTurn_Ajax(2)">上一页</button>&nbsp;
							&nbsp;第${page.currentPage }页&nbsp;/&nbsp;共${page.allPageNum }页&nbsp;
							<button onclick="pageTurn_Ajax(3)">下一页</button>&nbsp;
							<button onclick="pageTurn_Ajax(4)">末页</button>&nbsp;
							
						</td>
					</tr>
				</c:if>
			</table>
		</fieldset>
	</div>
	<%-- --%>
	<script type="text/javascript">
	
		function delete_(id_){
			$.ajax({
				url : "deleteCar_Ajax.do",
				type : "post",
				data : {
					id:id_,
				},
				success : function(data) {
				
				},
				error:function(){
				
				}
			});
		}
	
		//设置复选框全选或全不选
		$("#checkReverse").click(function() {
			$("input:checkbox").prop("checked", this.checked);
		});
		//定义复位按钮事件
		$("#resetbut").click(function() {
			$("input:text").prop("value", "");
		});
		//定义查询按钮事件
		$("#querybut").click(function() {
			pageTurn(0);
			//pageTurn_Ajax(0);
		});
		//当条件输入框发生改变时翻页信息从新初始化
		$("input:text").change(function(){
			$('#currentPage').val("0");
			$('#pageRowNum').val("0");
			$('#allPageNum').val("0");
		});
		
		
		//翻页 1:普通的刷新页面
		function pageTurn(num) {
			var currentPage = $('#currentPage').val();//('${page.currentPage}' == ''?0:'${page.currentPage}');
			var pageRowNum = $('#pageRowNum').val();//('${page.pageRowNum}' == ''?0:'${page.pageRowNum}');
			var allPageNum = $('#allPageNum').val();//('${page.allPageNum}' == ''?0:'${page.allPageNum}');
			switch (num) {
			case 0:
				$('#currentPage').val("0")
				$('#pageRowNum').val("0")
				$('#allPageNum').val("0")
				break;
			case 1:
				if(currentPage>1)$('#currentPage').val("1");
				else return;
				break;
			case 2:
				if(currentPage>1)$('#currentPage').val(currentPage-1);
				else return;
				break;
			case 3:
				if(currentPage<allPageNum)$('#currentPage').val(currentPage+1);
				else return;
				break;
			case 4:
				if(currentPage<allPageNum)$('#currentPage').val(allPageNum); 
				else return;
				break;
			}
			document.getElementById("form1").submit();
		}
		
		//翻页 2：ajax刷新页面
		function pageTurn_Ajax(num) {
			var currentPage = $('#currentPage').val();//('${page.currentPage}' == ''?0:'${page.currentPage}');
			var pageRowNum = $('#pageRowNum').val();//('${page.pageRowNum}' == ''?0:'${page.pageRowNum}');
			var allPageNum = $('#allPageNum').val();//('${page.allPageNum}' == ''?0:'${page.allPageNum}');
			switch (num) {
			case 0:	// 点击查询按钮
				currentPage = 0;
				pageRowNum = 0;
				allPageNum = 0;
				break;
			case 1:	// 点击首页
				if(currentPage>1) currentPage = 1; 
				else return;
				break;
			case 2:	// 点击上一页
				if(currentPage>1) currentPage--; 
				else return;
				break;
			case 3:	// 点击下一页
				if(currentPage<allPageNum) currentPage++; 
				else return;
				break;
			case 4:	// 点击末页
				if(currentPage<allPageNum) currentPage = allPageNum; 
				else return;
				break;
			}
			
			
			$.ajax({
				url : "UserQuery_Ajax.do",
				type : "post",
				data : {
					"account" : $('#account').val(),
					"userDetaile.username" : $('#username').val(),
					"userDetaile.birthday" : $('#birthday').val(),
					"userDetaile.sex" : $('#sex').val(),
					"userDetaile.address" : $('#address').val(),
					"currentPage":currentPage,
					"pageRowNum":pageRowNum,
					"allPageNum":allPageNum
				},
				success : function(data) {
					if(typeof data=='string'){
						data = JSON.parse(data);
					}
					//alert(data.currentPage);
					$('#currentPage').val(data.currentPage);
					$('#pageRowNum').val(data.pageRowNum);
					$('#allPageNum').val(data.allPageNum);
					
					//首先删除原表格数据
					var trArray = $("#customersTb tr");
					var trArrayLen = trArray.length;
					if(trArrayLen>2){
						for(var index=1;index<trArrayLen;index++){
							trArray[index].remove();
						}						
					}
					//刷新表格，将新数据绘制出来
					if(data.objList.length>0){
						for(var index in data.objList){
							var user = data.objList[index];
						    //alert("currentPage="+data.currentPage+";\nallPageNum="+data.allPageNum+";\naccount="+user.account+";\npassword="+user.password);
							var trObjStr='<tr><td align="center"><input type="checkbox" /></td>'
								+'<td>'+user.account+'</td>'
								+'<td><a href="UserInfoUpdatePage.do?userid='+user.id+'">'+user.userDetaile.username+'</a></td>'
								+'<td>'+dateFormat(user.userDetaile.birthday)+'</td>'
								+'<td>'+user.userDetaile.sex+'</td>'
								+'<td>'+user.userDetaile.address+'</td></tr>';
							$("#customersTb").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="6" align="center">'
							+'<input type="button" value="首页" onclick="pageTurn_Ajax(1)"/> &nbsp;'
							+'<input type="button" value="上一页" onclick="pageTurn_Ajax(2)"/>&nbsp;'
							+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
							+'<input type="button" value="下一页" onclick="pageTurn_Ajax(3)"/>&nbsp;'
							+'<input type="button" value="末页" onclick="pageTurn_Ajax(4)"/>&nbsp;'
							+'</td></tr>';
						$("#customersTb").append(pageInfoStr);
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
		//时间格式转换
		function dateFormat(nS) {  
		    var date = new Date(nS);
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    month = month<10?"0"+month:month;
		    var day = date.getDate();
		    day = day <10?"0"+day:day;
		    return year+"-"+month+"-"+day;
		}
	    //删除选择记录
	    function remove_line(index) {
	        if (index != null) {
	            currentStep = $(index).parent().parent().find("td:first-child").html();
	        }
	        if (currentStep == 0) {
	            alert('请选择一项!');
	            return false;
	        }
	        if (confirm("确定要删除改记录吗？")) {
	            $("#content tr").each(function () {
	                var seq = parseInt($(this).children("td").html());
	                if (seq == currentStep) { $(this).remove(); }
	                if (seq > currentStep) { $(this).children("td").each(function (i) { if (i == 0) $(this).html(seq - 1); }); }
	            });
	        }
	    }
	</script>
</body>
</html>