package org.visualCrypto;



	import java.io.IOException;
	import java.io.PrintWriter;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.http.Cookie;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IndexLoginDAO
 */
public class IndexLoginDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	/**
	 * Servlet implementation class Login
	 */
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
	    
	    	doPost(request, response);
	    }
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String user=null;
			String pwd=null;
			 Cookie c=null;
				Cookie[] cookies = request.getCookies();
			HttpSession hs=request.getSession();
			//////////////////
			
		
			
			//////////////////
			 user=request.getParameter("user");
			 pwd=request.getParameter("pwd");
			String remember=request.getParameter("remember");
			if(remember!=null){
				Cookie nameCookie = new Cookie("userName", user);
				nameCookie.setMaxAge(365 * 24 * 60 * 60);
				nameCookie.setPath("/");
				nameCookie.setValue(user);
	            response.addCookie(nameCookie);
	            Cookie passCookie = new Cookie("password", pwd);
	            passCookie.setMaxAge(365 * 24 * 60 * 60);
	            passCookie.setPath("/");
	            passCookie.setValue(pwd);
	            response.addCookie(passCookie);
			}
			//get id and password
			System.out.println(user+"    "+pwd);
			String username=UserData.getEmail(user, pwd);
			System.out.println(username);
			RequestDispatcher rd=null;
			if(user.equals(username)){
				String name=UserData.getUserNameFromEmail(username);
				if(UserData.getAccStatus(user, pwd).equals("not active")){
					rd=request.getRequestDispatcher("activeAccount.jsp");
					//hs.setAttribute("key", "null");
					request.setAttribute("act", name);
					request.setAttribute("act1", username);
					rd.include(request, response);
				}else{
				rd=request.getRequestDispatcher("uploadImage.jsp");
				//hs.setAttribute("key", "null");
				hs.setAttribute("name", name);
				request.setAttribute("email", username);
				rd.include(request, response);
			}}
			else{
				rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("act","Wrong Username and Password");
				rd.forward(request, response);
			}	
			
		
		
			}
	}

