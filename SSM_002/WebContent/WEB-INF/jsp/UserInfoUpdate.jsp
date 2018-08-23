<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <head>
  <title> 用户个人信息 </title>
 </head>

 <body>
  <form action="UserInfoUpdate.do" method="post" enctype="multipart/form-data"> 
  
  	<input type="hidden" name="id" value="${user.id }"/>
  	<input type="hidden" name="account" value="${user.account }"/>
  	<input type="hidden" name="userDetaile.userid" value="${user.id }"/>
  	
	<table border="1" rules="all" align="center" width="600px">
		<tr><th colspan="3"><font size="5">用户个人信息</font></th></tr>
		<tr>
			<td align="right" width="120px">帐号：</td>
			<td>${user.account }</td>
			<td align="center" width="20px"></td>
		</tr>
		<tr>
			<td align="right">姓名：</td>
			<td><input type="text" name="userDetaile.username" value="${user.userDetaile.username}"/></td>
			<td align="center"><font color="red">*</font></td>
		</tr>
		<tr>
			<td align="right">头像：</td>
			<td>
				<c:if test="${user.userDetaile.head_img!=null && user.userDetaile.head_img!=''}">
					<img alt="头像URL:${user.userDetaile.head_img}" 
						src="${user.userDetaile.head_img}"
						width="200px">
				</c:if>
				<c:if test="${user.userDetaile.head_img==null || user.userDetaile.head_img==''}">
					<img src="img/head/default_head.jpg">
				</c:if>
				<input type="file" name="file"/>
			</td>
			<td align="center"><font color="red">*</font></td>
		</tr>
		<tr>
			<td align="right">性别：</td>
			<td>
				<c:if test="${user.userDetaile.sex=='男'}">
					男：<input type="radio" name="userDetaile.sex" value="男" checked="checked"/>
					&nbsp;&nbsp;&nbsp;
					女：<input type="radio" name="userDetaile.sex" value="女"/>
				</c:if>
				<c:if test="${user.userDetaile.sex=='女'}">
					男：<input type="radio" name="userDetaile.sex" value="男" />
					&nbsp;&nbsp;&nbsp;
					女：<input type="radio" name="userDetaile.sex" value="女" checked="checked"/>
				</c:if>
			</td>
			<td align="center"><font color="red">*</font></td>
		</tr>
		<tr>
			<td align="right">生日：</td>
			<td><input type="text" name="userDetaile.birthday" value="<fmt:formatDate value="${user.userDetaile.birthday}" pattern="yyyy-MM-dd" />"/></td>
			<td align="center"><font color="red">*</font></td>
		</tr>
		<tr>
			<td align="right">所在地址：</td>
			<td><input type="text" name="userDetaile.address" value="${user.userDetaile.address}"/></td>
			<td align="center"><font color="red">*</font></td>
		</tr>		

		<tr>
			<td colspan="3" align="center">
				<input type="reset" value="重置"/>
				<input type="submit" value="提交"/>
			</td>
		</tr>
	</table>
  </form>
 </body>
</html>
