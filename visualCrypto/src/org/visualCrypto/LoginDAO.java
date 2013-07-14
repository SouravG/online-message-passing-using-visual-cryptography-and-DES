package org.visualCrypto;



import java.io.IOException;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class LoginDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDAO() {
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
		String wrong="";
		String user=null;
		String UID=null;
		String pwd=null;
		boolean notCookieLogin=false;
		 Cookie c=null;
		 RequestDispatcher rd=null;
			Cookie[] cookies = request.getCookies();
		HttpSession hs=request.getSession();
		//////////////////
		if(cookies!=null)
		{
	    for (int i = 0; i < cookies.length; i++) {
	        
	       if(cookies[i].getName().equals("UID")){
	    	   c = cookies[i];
	    	   UID = c.getValue().toString();}
	      
	    
	}try{
		RetriveByUnoBean retv=UserData.getEmailAndPasswordByUno(UID);
		user=retv.getEmail();
		pwd=retv.getPassword();
		
	System.out.println(user+"      "+pwd);	
	}
	catch(NullPointerException e){
		 user=request.getParameter("user");
		 pwd=request.getParameter("pwd");
		 notCookieLogin=true;
		 //rd=request.getRequestDispatcher("index.jsp");
		// rd.forward(request, response);
	}
	
		}
		if(user==null||pwd==null){
	
		
		//////////////////
		 user=request.getParameter("user");
		 pwd=request.getParameter("pwd");}
		System.out.println(user+"  andagain  "+pwd+"             "+UID);

		String remember=request.getParameter("remember");
		if(remember!=null){
			Cookie nameCookie = new Cookie("UID", UserData.getUserNoByEmailAndPassword(user, pwd));
			nameCookie.setMaxAge(365 * 24 * 60 * 60);
			nameCookie.setPath("/");
			nameCookie.setValue(UserData.getUserNoByEmailAndPassword(user, pwd));
            response.addCookie(nameCookie);
		}else{
			Cookie nameCookie = new Cookie("UID", UserData.getUserNoByEmailAndPassword(user, pwd));
			nameCookie.setMaxAge(0);
			nameCookie.setPath("/");
			nameCookie.setValue(UserData.getUserNoByEmailAndPassword(user, pwd));
            response.addCookie(nameCookie);
		}
		//get id and password
	
		String username=UserData.getEmail(user, pwd);
		if(cookies==null){
			wrong="homepage.jsp";
		}else{
			wrong="index.jsp";
		}
		try{
		if(user.equals(username)){
			String name=UserData.getUserNameFromEmail(username);
			String ipAddr=request.getRemoteAddr();
			Locale local=request.getLocale();
			String country=local.getDisplayCountry();
			String header =request.getHeader("User-Agent");
			String Browser="Unknown";
			String os="unknown";
			///////////////////////////////////////////////////
			
			if ( header.toLowerCase().indexOf("windows nt 5.0") >= 0 )  
		     {  
		          os = "Windows nt 5";  
		     }   
		  
		     if ( header.toLowerCase().indexOf("windows nt 4.0") >= 0 )  
		     {  
		          os = "Windows nt 4";  
		     }   
		  
		     if ( header.toLowerCase().indexOf("windows 98") >= 0 )  
		     {  
		          os = "Windows 98";  
		     }   
		  
		     if ( header.toLowerCase().indexOf("windows 95") >= 0 )  
		     {  
		          os = "Windows 95";  
		     }  
		  
		     if ( header.toLowerCase().indexOf("windows 16") >= 0 )  
		     {  
		          os = "Windows 3.11";  
		     }   
		  
		     if ( header.toLowerCase().indexOf("mac") >= 0 )  
		     {  
		          os = "Mac";  
		     }   
		       
		     if ( header.toLowerCase().indexOf("X11") >= 0 )  
		     {  
		          os = "Unix";  
		     }
		    if ( header.toLowerCase().indexOf("windows nt 5.0") >= 0||header.indexOf("windows nt 5.1") >= 0||header.indexOf("windows nt 5.2") >= 0 )  
		     {  
		          os = "Unix";  
		     }if ( header.toLowerCase().indexOf("windows nt 6.0") >= 0 )  
		     {  
		          os = "Windows Vista";  
		     }
		     if ( header.toLowerCase().indexOf("windows nt 6.1") >= 0 )  
		     {  
		          os = "Windows 7";  
		     }if ( header.toLowerCase().indexOf("windows nt 6.2") >= 0 )  
		     {  
		          os = "Windows 8";  
		     }
			//////////////////////////////////////////////////
		     if(header.toLowerCase().indexOf("msie") != -1) {  
		          Browser = "IE";  
		     }  
		  
		     if(header.toLowerCase().indexOf("firefox") != -1)   
		     {  
		          Browser = "FireFox";  
		     }  
		       
		     if(header.toLowerCase().indexOf("safari") != -1)   
		     {  
		          Browser = "Safari";  
		     }  
		  
		   
		       
		     if(header.toLowerCase().indexOf("mozilla/7.0") > -1)   
		     {  
		          Browser = "netscape 7";  
		     }  
		  
		     if(header.toLowerCase().indexOf("netscape6") != -1)   
		     {  
		          Browser = "netscape 6";  
		     }  
		  
		     if(header.toLowerCase().indexOf("mozilla/4.7") != -1)   
		     {  
		          Browser = "netscape 4.7";  
		     }  
		  
		     if(header.toLowerCase().indexOf("mozilla/4.78") != -1)   
		     {  
		          Browser = "netscape 4.78";  
		     }  
		  
		     if(header.toLowerCase().indexOf("mozilla/4.08") != -1)   
		     {  
		          Browser = "netscape 4.08";  
		     }  
		  
		     if(header.toLowerCase().indexOf("mozilla/3") != -1)   
		     {  
		          Browser = "netscape 3";  
		     }  
		  
		     if(header.toLowerCase().indexOf("opera") > -1)  
		     {  
		          Browser = "Opera browser";  
		     } 
		     
		     
		     
		     
		     /////////////////////////////////////////////////////////////////////
			//if(notCookieLogin) SendMailExample.changeLoginConfirmationEmail(username, name, ipAddr, os, country, Browser);
			
			
			
			
			if(UserData.getAccStatus(user, pwd).equals("not active")){
				rd=request.getRequestDispatcher("activeAccount.jsp");
				//hs.setAttribute("key", "null");
				request.setAttribute("act", username);
				request.setAttribute("act1", name);
				hs.setAttribute("UID", UserData.getUserNoByEmailAndPassword(name, pwd));
				rd.include(request, response);
			}else{			if(notCookieLogin) SendMailExample.changeLoginConfirmationEmail(username, name, ipAddr, os, country, Browser);

			rd=request.getRequestDispatcher("uploadImage.jsp");
			//hs.setAttribute("key", "null");
			hs.setAttribute("name", name);
			hs.setAttribute("additional", "");
			hs.setAttribute("email", username);
			hs.setAttribute("UID", UserData.getUserNoByEmailAndPassword(name, pwd));
			rd.include(request, response);
		}}
		else{
			rd=request.getRequestDispatcher(wrong);
			//wrong="Wrong Username and Password";
			request.setAttribute("act","Wrong Username and Password");
			rd.forward(request, response);
		}	
		}
		catch(Exception e){
			rd=request.getRequestDispatcher("index.jsp");
			//request.setAttribute("act","dfgdfg");
			rd.forward(request, response);
		}
	
	
		}
}

