<%@ page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表</title>
</head>
<body>
	<h2>产品列表</h2>
	<a href="<c:url value="shop?action=viewCart" />">查看购物车</a><br /><br />
	<%
		@SuppressWarnings("unchecked")
		Map<Integer,String> products=(Map<Integer,String>)request.getAttribute("products");
	
		for(int id:products.keySet()){
			%><a href="<c:url value="shop">
				<c:param name="action" value="addToCart" />
				<c:param name="productId" value="<%=Integer.toString(id) %>"/>
			</c:url>"><%= products.get(id) %></a><br /><%
		}
	%>
</body>
</html>