<%--@elvariable id="loginFailed" type="java.lang.Boolean" --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心</title>
</head>
<body>
	<h2>登录</h2>
	您必须登录才能进入客户中心。<br/><br/>
	<c:if test="${loginFaild }">
		<b>用户名或密码错误，请重试。</b><br><br>
	</c:if>
	
	<form action="<c:url value="/login" />" method="POST">
		用户名<br/>
		<input type="text" name="username"/><br><br>
		密码<br>
		<input type="password" name="password"/><br><br>
		<input type="submit" value="登录"/>
	</form>