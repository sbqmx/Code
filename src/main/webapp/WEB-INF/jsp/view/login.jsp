<%--@elvariable id="loginFailed" type="java.lang.Boolean" --%>
<template:loggedOut htmlTitle="Log In" bodyTitle="Login In">
	You must log in to access the customer support site.<br/><br/>
	<c:if test="${loginFailed }">
		<b>The username and password you entered are not correct. Please try again.</b><br/><br/>
	</c:if>
	<form method="POST" action="<c:url value="/login"/>">
		Username<br/>
		<input type="text" name="username"/><br/><br/>
		Password<br/>
		<input type="password" name="password" /><br/><br/>
		<input type="submit" value="Log In"/>
	</form>
</template:loggedOut>
<%-- 原代码，新代码使用了自定义标签
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心</title>
</head>
<body>
	<h2>登录</h2>
	您必须登录才能进入客户中心。<br/><br/>
	<%
		if((Boolean)request.getAttribute("loginFailed")){
	%>
	<b>用户名或密码错误，请重试。</b><br><br>
	<%
		}
	%>
	<form action="<c:url value="/login" />" method="POST">
		用户名<br/>
		<input type="text" name="username"/><br><br>
		密码<br>
		<input type="password" name="password"/><br><br>
		<input type="submit" value="登录"/>
	</form>
	<div style="background-color: silver;border: medium black dotted;">
		源代码中查看引用的login_c.jsp文件，以替换页面中的java代码为目的，该文件使用了&lt;c:if&gt;标签。
		<c:import url="login_c.jsp" />
	</div>
</body>
</html> --%>