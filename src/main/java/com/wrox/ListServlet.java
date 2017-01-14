package com.wrox;

import java.io.IOException;
import java.time.Instant;
import java.time.Month;
import java.time.MonthDay;
import java.util.Collections;
import java.util.Locale;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet(name="listServlet",description = "用于响应地址簿请求", urlPatterns = { "/list" })
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final SortedSet<Contact> contacts = new TreeSet<>();
	
	static{
		contacts.add(new Contact("Jane","Sanders","555-1593","394 E 22nd Ave", MonthDay.of(Month.JANUARY, 5),Instant.parse("2013-02-01T15:22:23.00Z")));
		contacts.add(new Contact("John","Smith","555-0712","315 Maple St",null,Instant.parse("2012-10-15T09:31:17.00Z")));
		contacts.add(new Contact("Scott","Johnson","555-9834","424 Oak Dr",MonthDay.of(Month.NOVEMBER , 17),Instant.parse("2013-04-04T19:45:01.00Z")));
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String language = request.getParameter("language");
		if("french".equalsIgnoreCase(language)){
			Config.set(request, Config.FMT_LOCALE, Locale.FRANCE);
		}else if ("usa".equalsIgnoreCase(language) ||"america".equalsIgnoreCase(language)) {
			Config.set(request, Config.FMT_LOCALE, Locale.US);
		}else {
			Config.set(request, Config.FMT_LOCALE, Locale.CHINA);
		}
		if(request.getParameter("empty")!=null){
			request.setAttribute("contacts", Collections.<Contact>emptySet());
		}else
			request.setAttribute("contacts", contacts);
		request.getRequestDispatcher("/WEB-INF/jsp/view/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
