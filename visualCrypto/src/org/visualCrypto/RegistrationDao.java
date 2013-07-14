package org.visualCrypto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

/**
 * Servlet implementation class RegistrationDao
 */
public class RegistrationDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationDao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("username");
		String password=request.getParameter("pwd1");
		String dob=request.getParameter("dob");
		String country=request.getParameter("country");
		String sex=request.getParameter("radio");
		String email=request.getParameter("email");
		int phone=(int)Long.parseLong(request.getParameter("phono"));
		String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6Lfqa9oSAAAAANd5oha6OJWZQCWw-dHnIOXQyPGp ");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
        	
    		
    		
    		UserData.saveUserData(name, password, dob,sex , country, email, phone);
    		String userno=UserData.getUserNoByEmail(email);
        	SendMailExample.mail(email, userno , name);
    		RequestDispatcher rd=request.getRequestDispatcher("homepage.jsp");
    		//PrintWriter out=response.getWriter();
    		
    		request.setAttribute("act","Registration successful.Check your email...");
    		rd.forward(request, response);
        	
		//if(email.equals(UserData.checkEmail(email))){
			
		}else{
			
			RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
			request.setAttribute("act","The characters you entered didn't match the word verification. Please try again");
			rd.forward(request, response);
		}
	}

}
