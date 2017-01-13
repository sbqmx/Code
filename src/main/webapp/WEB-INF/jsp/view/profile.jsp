<!-- @elvarable id="user" type="com.wrox.User" -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Profile</title>
</head>
<body>
	User ID: ${user.userId}<br/>
	Username: ${ user.username }(${user.username.length() } characters)<br/>
	Full Name: ${fn:escapeXml(user.lastName) += ', ' += fn:escapeXml(user.firstName) }<br/><br/>
	<b>Permissions (${fn: length(user.permissions) })</b><br/>
	User: ${user.permissions["user"] }<br/>
	Moderator: ${user.permissions["moderator"] }<br/>
	Administrator: ${user.permissions["admin"] }<br/>
</body>
</html>