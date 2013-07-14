package org.visualCrypto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AccountSettings
 */
public class AccountSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountSettings() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		String user= (String)hs.getAttribute("name");
		String email= (String)hs.getAttribute("email");
		if(email==null || email=="null"){
		 	response.sendRedirect("logout.jsp");
		}
		RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
		hs.setAttribute("email", email);
			hs.setAttribute("name", user);
			rd.include(request, response);
		
	}

}
