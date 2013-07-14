package org.visualCrypto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

/**
 * Servlet implementation class Signout
 */
public class SignoutDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignoutDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user=(String)session.getAttribute("user");
		System.out.println(user);
		//session.setAttribute(user, "null");
		session.removeAttribute("email");
		session.removeAttribute("name");
		session.invalidate();
		
		Cookie c=null;
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
		{
	    for (int i = 0; i < cookies.length; i++) {
	        
	       if(cookies[i].getName().equals("UID")){
	    	   c = cookies[i];
	    	   c.setValue(null);
	    	   c.setMaxAge(0);
	    	   c.setPath("/");
	    	   
	    
	       }}
		}


        response.sendRedirect("logout.jsp");
	} 

}
