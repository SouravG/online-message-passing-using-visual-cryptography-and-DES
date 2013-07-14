package org.visualCrypto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UploadImageBack
 */
public class UploadImageBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImageBack() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		
		String user= (String)hs.getAttribute("name");
		String email= (String)hs.getAttribute("email");
		String UID= UserData.getUserNoByEmail(email);
		
		hs.setAttribute("name", user);
		if(email==null || email=="null"){
		 	user=request.getParameter("name");
		}
	
		RequestDispatcher rd=request.getRequestDispatcher("uploadImage.jsp");
		hs.setAttribute("name", user);
		hs.setAttribute("email", email);
		hs.setAttribute("additional", "");
		hs.setAttribute("UID",UID);
		rd.include(request, response);
	}

}
