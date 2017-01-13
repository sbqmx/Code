<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String[] fruits = request.getParameterValues("fruit"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello User Application</title>
</head>
<body>
	<h2>Your Selection</h2>
	<%
		if(fruits==null){
	%>You did not select any fruits.<%
		}
		else{
	%><ul><%
			for(String s:fruits){
				out.println("<li>"+s+"</li>");//这里也可以不用out,用表达式拼接也可
			}
	%></ul><%
		}
	%>
</body>
</html>