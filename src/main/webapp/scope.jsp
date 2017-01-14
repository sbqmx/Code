<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("a", "page");
	request.setAttribute("a", "request");
	session.setAttribute("a", "session");
	application.setAttribute("a", "application");
	
	request.setAttribute("b", "request");
	session.setAttribute("b", "session");
	application.setAttribute("b", "application");
	
	session.setAttribute("c", "session");
	application.setAttribute("c", "application");
	
	application.setAttribute("d", "application");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scope Demonstration</title>
</head>
<body>
	该页面演示了4种作用域同名属性存在冲突值时显示的优先级。<br>
	a = ${a }<br>
	b = ${b }<br>
	c = ${c }<br>
	d = ${d }<br>
</body>
</html>