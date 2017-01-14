<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%--@elvariable id="numberOfSessions" value="java.lang.Integer" --%>
<%!
	private static String toString(long timeInterval){
		if(timeInterval < 1_000)
			return "less than one second";
		if(timeInterval < 60_000)
			return (timeInterval / 1_000) + " seconds";
		return "about " + (timeInterval / 60_000) + " minutes";
	}
%>
<%
	//int numberOfSessions = (Integer)request.getAttribute("numberOfSessions");
	@SuppressWarnings("unchecked")
	List<HttpSession> sessions = (List<HttpSession>)request.getAttribute("sessionList");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Support</title>
</head>
<body>
	<a href="<c:url value="/login?logout" />">Logout</a>
	<h2>Sessions</h2>
	There are a total of ${numberOfSessions } active session in this application.<br/><br/>
	<%
		long timestamp = System.currentTimeMillis();
		for(HttpSession aSession : sessions){
			out.print(aSession.getId() + "-" + aSession.getAttribute("username"));
			if(aSession.getId().equals(session.getId()))
				out.print("(you)");
			out.print(" - last active " + toString(timestamp - aSession.getLastAccessedTime()));
			out.println(" ago<br/>");
		}
	%>
</body>
</html>