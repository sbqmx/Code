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
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="loginServlet",description = "登录", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Map<String,String> userDatabase = new Hashtable<>();
	
	static{
		userDatabase.put("张三", "password");
		userDatabase.put("李四", "drowssap");
		userDatabase.put("王五", "wordpass");
		userDatabase.put("赵六", "green");
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(request.getParameter("logout")!=null){
			session.invalidate();
			response.sendRedirect("login");
			return;
		}else if(session.getAttribute("username") != null){
			response.sendRedirect("tickets");
			return;
		}
		
		request.setAttribute("loginFailed", false);
		request.getRequestDispatcher("/WEB-INF/jsp/view/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null){
			response.sendRedirect("tickets");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username == null || password == null || !LoginServlet.userDatabase.containsKey(username)
					|| !password.equals(LoginServlet.userDatabase.get(username))){
			request.setAttribute("loginFailed", true);
			request.getRequestDispatcher("WEB-INF/jsp/view/login.jsp").forward(request, response);
		}else {
			session.setAttribute("username", username);
			request.changeSessionId();
			response.sendRedirect("tickets");
		}
	}

}
