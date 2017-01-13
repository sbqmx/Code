<%@ page import="java.util.Map"%>
<!Doctype html>
<html>
	<head>
		<title>购物车</title>
	</head>
	<body>
		<h2>购物车</h2>
		<a href="<c:url value="shop"/>">产品列表</a><br><br>
		<a href="<c:url value="shop?action=emptyCart"/>">清空购物车</a><br><br>
		<%
			@SuppressWarnings("unchecked")
			Map<Integer,String> products = (Map<Integer,String>)request.getAttribute("products");
			@SuppressWarnings("unchecked")
			Map<Integer,Integer> cart = (Map<Integer,Integer>)session.getAttribute("cart");
			
			if(cart == null || cart.size() == 0)
				out.println("您的购物车为空。");
			else{
				for(int id:cart.keySet()){
					out.println(products.get(id) + " (数量: " + cart.get(id) + ")<br/>");
				}
			}
		%>
	</body>
</html>