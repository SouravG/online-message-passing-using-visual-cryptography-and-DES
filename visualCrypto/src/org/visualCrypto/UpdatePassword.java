package org.visualCrypto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String user =request.getParameter("user");
		String oldPwd =request.getParameter("old");
		String newPwd =request.getParameter("new");
		System.out.println(oldPwd+"   "+user);
		if(UserData.updatePassword(user, oldPwd, newPwd)){
			if(UserData.updateUnoByEmail(user)){
			out.println(UserData.getUserNoByEmail(user));
			
			
		
		}
		
		}
	}

}
