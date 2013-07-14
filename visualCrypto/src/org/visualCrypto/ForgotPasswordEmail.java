package org.visualCrypto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPasswordEmail
 */
public class ForgotPasswordEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		System.out.println(email);
		RecoveryPassBean recover=UserData.getUserPasswordAndName(email);
		System.out.println(recover.getPassword());
		SendMailExample.sendPassword(email, recover.getPassword(), recover.getUsername());
		RequestDispatcher rd=request.getRequestDispatcher("homepage.jsp");
		//PrintWriter out=response.getWriter();
		
		request.setAttribute("act","Password is sent to your email.Check your email...");
		rd.forward(request, response);
	}

}
