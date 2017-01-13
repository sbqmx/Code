package com.wrox;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(
	name = "helloServlet",
	urlPatterns = {"/greeting","/salutation","/wazzup"},
	loadOnStartup = 1
)
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_USER ="Guest";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user = request.getParameter("user");
		if(user==null || user.trim().length()<1)
			user = HelloServlet.DEFAULT_USER;
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		writer.append("<!DOCTYPE html>\r\n")
			  .append("<html>\r\n")
			  .append("    <head>\r\n")
			  .append("        <title>Hello User Application</title>\r\n")
			  .append("    </head>\r\n")
			  .append("    <body>\r\n")
			  .append("        Hello, ").append(user).append("!<br/><br/>\r\n")
			  .append("        <form action=\"greeting\" method=\"POST\">\r\n")
			  .append("            Enter your name:<br/>\r\n")
			  .append("            <input type=\"text\" name=\"user\"/><br/>\r\n")
			  .append("            <input type=\"submit\" value=\"Submit\"/>\r\n")
			  .append("        </form>\r\n")
			  .append("    </body>\r\n")
			  .append("<html>\r\n");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().println("  Hello, World!");
		Map<String, String[]> map = request.getParameterMap();
		Iterator it = map.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry e = (Map.Entry)it.next();
			System.out.println("Key: "+e.getKey()+" Value: "+e.getValue());
		}
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURL());
		System.out.println(request.getServletPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Servlet "+this.getServletName()+" has stopped.");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Servlet "+this.getServletName()+" has started.");

	}

}
