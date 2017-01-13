package com.wrox;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StoreServlet
 */
@WebServlet(name="storeServlet",description = "shoppingcart��Ŀʵ��", urlPatterns = { "/shop" })
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final Map<Integer,String> products = new Hashtable<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreServlet() {
        this.products.put(1, "�ɿ���");
        this.products.put(2, "�޻���");
        this.products.put(3, "ˮ��Ӳ��");
        this.products.put(4, "̫����");
        this.products.put(5, "������");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action==null)
			action = "browse";
		
		switch (action) {
		case "addToCart":
			this.addToCart(request,response);
			break;
			
		case "viewCart":
			this.viewCart(request,response);
			break;
			
		case "emptyCart":
			this.emptyCart(request,response);
			break;
			
		case "browser":

		default:
			this.browse(request,response);
			break;
		}
	}

	private void emptyCart(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		request.getSession().removeAttribute("cart");
		response.sendRedirect("shop?action=viewCart");
	}

	private void browse(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException
	{
		request.setAttribute("products", this.products);
		request.getRequestDispatcher("/WEB-INF/shoppingcart/browse.jsp")
			.forward(request, response);
		
	}

	private void viewCart(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		request.setAttribute("products", this.products);
		request.getRequestDispatcher("/WEB-INF/shoppingcart/viewCart.jsp").forward(request, response);
		
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		int productId;
		try{
			productId = Integer.parseInt(request.getParameter("productId"));
		}catch (Exception e) {
			response.sendRedirect("shop");
			return;
		}
		
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") == null)
			session.setAttribute("cart", new Hashtable<Integer,Integer>());
		
		@SuppressWarnings("unchecked")
		Map<Integer,Integer> cart = (Map<Integer,Integer>)session.getAttribute("cart");
		if(!cart.containsKey(productId))
			cart.put(productId, 0);
		cart.put(productId, cart.get(productId)+1);
		
		response.sendRedirect("shop?action=viewCart");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
