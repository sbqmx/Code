<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%
	ArrayList<User> users = new ArrayList<>();
	users.add(new User(19384L,"Code314","John","Smith"));
	users.add(new User(19383L,"geek12","Joe","Smith"));
	users.add(new User(19382L,"jack123","Jack","Johnson"));
	users.add(new User(19385L,"farmer-dude","Adam","Fisher"));
	request.setAttribute("users", users);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Collections and Streams</title>
</head>
<body>
	<b>以下输出请对照源代码进行查看，这是EL表达式中有关流API的练习。</b><br>
	${users.stream().filter(u->fn:contains(u.username,'1'))
		.sorted((u1,u2)->(x = u1.lastName.compareTo(u2.lastName); x==0?u1.firstName.compareTo(u2.firstName):x))
		.map(u->{'username':u.username, 'first':u.firstName, 'last':u.lastName})
		.toList() }
</body>
</html>