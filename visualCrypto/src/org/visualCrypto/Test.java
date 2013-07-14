package org.visualCrypto;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.rmi.transport.Transport;

import com.sun.corba.se.impl.protocol.giopmsgheaders.Message.*;

public class Test extends HttpServlet {

  //default value for mail server address, in case the user
  //doesn't provide one


  
      
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, java.io.IOException {
PrintWriter out=response.getWriter();
	  String email=request.getParameter("email");
	    if(email.equals(UserData.checkEmail(email))){
			
		out.println(1);	
		}
	    //System.out.println(email);
	    

  }

}//EmailServlet