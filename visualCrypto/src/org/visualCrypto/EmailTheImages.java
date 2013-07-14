package org.visualCrypto;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmailTheImages
 */
public class EmailTheImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailTheImages() {
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
		    	out.println("<font color=blue>Username="+fromUser+"</font><img src='images/ok.png'/>");
		    }else	{
			out.println("<font color=red>No record found </font><div class='delete'>");	
			}
		    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String toUser=UserData.getUserNameFromEmail(email);
		HttpSession hs=request.getSession();
		String fromUser=(String)hs.getAttribute("name");
		String fromUserEmail=(String)hs.getAttribute("email");
		String file11="F:/JEE/workspace/visualCrypto/WebContent/userImages/"+fromUserEmail+"/encr1.png";
		File file1=new File(file11);
		String file22="F:/JEE/workspace/visualCrypto/WebContent/userImages/"+fromUserEmail+"/encr2.png";
		File file2=new File(file22);
		String key=(String)hs.getAttribute("key");
		RequestDispatcher rd=null;
		PrintWriter out=response.getWriter();
		if(fromUserEmail==null || fromUserEmail=="null"){
		 	response.sendRedirect("homepage.jsp");
		}
		try {
			test1.SendMail(email, toUser, fromUser, file1, file2, key);
			//Testmail.sendEmailWithAttach(email, toUser, fromUser, file1, file2, key);
			rd=request.getRequestDispatcher("uploadImage.jsp");
			hs.setAttribute("name", fromUser);
			hs.setAttribute("email", fromUserEmail);
			out.println("<script type='text/javascript'>alert('Email sent successfully.');</script>");
			rd.include(request, response);
		} catch (Exception e) {
			rd=request.getRequestDispatcher("crypting.jsp");
			hs.setAttribute("name",fromUser);
			hs.setAttribute("email", fromUserEmail);
			request.setAttribute("key",key);
			out.println("<script type='text/javascript'>alert('Sorry Internal Error, mail not sent');</script>");
			rd.include(request, response);
		}
			
		
	}

}
