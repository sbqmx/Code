package com.wrox;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MultiValueParameterServlet
 */
@WebServlet(name="multiValueParameterServlet",description = "演示servlet多值参数的接收", urlPatterns = { "/checkboxes" })
public class MultiValueParameterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiValueParameterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		writer.append("<!DOCTYPE html>\r\n")
			  .append("<html>\r\n")
			  .append("    <head>\r\n")
			  .append("        <title>Hello User Application</title>\r\n")
			  .append("    </head>\r\n")
			  .append("    <body>\r\n")
			  .append("        <form action=\"checkboxes\" method=\"POST\">\r\n")
			  .append("Select the fruits you like to eat:<br/>\r\n")
			  .append("<input type=\"checkbox\" name=\"fruit\" value=\"Banana\">\r\n")
			  .append(" Banana<br/>\r\n")
			  .append("<input type=\"checkbox\" name=\"fruit\" value=\"Apple\">\r\n")
			  .append(" Apple<br/>\r\n")
			  .append("<input type=\"checkbox\" name=\"fruit\" value=\"Orange\">\r\n")
			  .append(" Orange<br/>\r\n")
			  .append("<input type=\"checkbox\" name=\"fruit\" value=\"Guava\">\r\n")
			  .append(" Guava<br/>\r\n")
			  .append("<input type=\"checkbox\" name=\"fruit\" value=\"Kiwi\">\r\n")
			  .append(" Kiwi<br/>\r\n")
			  .append("<input type=\"submit\" value=\"提交\"/>\r\n")
			  .append("        </form>")
			  .append("    </body>\r\n")
			  .append("</html>\r\n");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] fruits = request.getParameterValues("fruit");
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		writer.append("<!DOCTYPE html>\r\n")
			  .append("<html>\r\n")
			  .append("    <head>\r\n")
			  .append("        <title>Hello User Application</title>\r\n")
			  .append("    </head>\r\n")
			  .append("    <body>\r\n")
			  .append("        <h2>Your Selections</h2>\r\n");
		
		if(fruits==null)
			writer.append("        You did not select any fruits.\r\n");
		else{
			writer.append("        <ul>\r\n");
			for(String s:fruits){
				writer.append("        <li>").append(s).append("</li>\r\n");
			}
		}
		
		writer.append("    </body>\r\n")
		      .append("</html>\r\n");
	}

}
