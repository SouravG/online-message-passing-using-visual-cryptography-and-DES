package org.visualCrypto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckUserDAO
 */
public class CheckUserDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		  String email=request.getParameter("username");
		  if(email.length()>=6){
		    if(email.equals(UserData.checkUser(email))){
				
			out.println("<div id='res' style='border:1px solid #ff0000;background: white;'>&nbsp; This user name has been registered already</div>");	
			}
		    else{
				out.println("<div id='res' style='border:1px solid #0000ff;background:white;'>&nbsp; Available</div>");	
		    	
		    }}
		    //System.out.println(email);
		    
	}

}
