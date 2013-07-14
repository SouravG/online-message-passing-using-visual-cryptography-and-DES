package org.visualCrypto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPass
 */
public class ForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		  String email=request.getParameter("email");
		    if(email.equals(UserData.checkEmail(email))){
		    	String fromUser=UserData.getUserNameFromEmail(email);
		    	out.println("<div id='res' style='border:2px solid #0000ff;background:#D6D6FF;color=blue;'>&nbsp; Username="+fromUser+"</div>");
			}else{
				out.println("<div id='res' style='border:2px solid #ff0000;background:pink;'>No user found on this email address</div>");	
			}
		    
		    

	}

}
