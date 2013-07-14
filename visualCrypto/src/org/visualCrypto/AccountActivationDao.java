package org.visualCrypto;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AccountActivationDao
 */
public class AccountActivationDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountActivationDao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Activate=request.getParameter("Actv");
		HttpSession hs=request.getSession();
		String username=(String) hs.getAttribute("user");
		String UID=(String)hs.getAttribute("UID");
		RequestDispatcher rd=null;
		System.out.println(username);
		//HttpSession hs=request.getSession();
		//PrintWriter out=response.getWriter();
		if(UserData.updateAccStatus(Activate, username)){
			rd=request.getRequestDispatcher("uploadImage.jsp");
			//hs.setAttribute("key", "null");
			String name=UserData.getUserNameFromEmail(username);
			//out.println("<script type='text/javascript'>alert('')</script>");
			hs.setAttribute("name",name);
			hs.setAttribute("email", username);
			hs.setAttribute("additional", "account has been successfully activated");
			hs.setAttribute("UID",UID);
			rd.include(request, response);
		}
		else{
			String name=UserData.getUserNameFromEmail(username);
			rd=request.getRequestDispatcher("activeAccount.jsp");
			request.setAttribute("act",username);
			request.setAttribute("act1", name);
			hs.setAttribute("UID",UID);
			request.setAttribute("res","Sorry! Account has not activated. Please enter activation no correctly");
			rd.forward(request, response);
			
		}
	}

}
