<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true" required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true" required="true"%>
<%@ attribute name="headContent" fragment="true" required="false"%>
<%@ attribute name="navigationContent" fragment="true" required="true" %>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
			Customer Support :: <c:out value="${fn:trim(htmlTitle) }" />
		</title>
		<link rel="stylesheet" href="<c:url value="/CSS/main.css" />" />
		<jsp:invoke fragment="headContent" />
	</head>
	<body>
		<h1>Multinational Widget Corporation</h1>
		<table border="0" id="bodyTable">
			<tr>
				<td class="sidebarCell">
					<jsp:invoke fragment="navigationContent"></jsp:invoke>
				</td>
				<td class="contentCell">
					<h2><c:out value="${fn:trim(bodyTitle) }"></c:out></h2>
					<jsp:doBody></jsp:doBody>
				</td>
			</tr>
		</table>
	</body>
</html>