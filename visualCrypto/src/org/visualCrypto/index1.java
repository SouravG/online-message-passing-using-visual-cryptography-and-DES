package org.visualCrypto;

import java.io.*;
import java.util.*;


import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;

import com.cr34.enumeration.DISPLAYMODE;
import com.cr34.facebookfunctions.FaceBook;
import com.google.code.facebookapi.FacebookXmlRestClient;

import com.google.code.facebookapi.*;
import com.google.code.facebookapi.apt.*;
import com.google.code.facebookapi.schema.*;


public class index1 extends HttpServlet
{
	
	
	
	private String printUserInfo(Long uid, FacebookXmlRestClient client, String sessionKey) throws FacebookException

    {

        StringBuffer ret = new StringBuffer();

        //init array parameter

        ArrayList<Long> uids = new ArrayList<Long>(1);

        uids.add(uid);

        //init field parameter - we choose all profile infos.

        List<ProfileField> fields = Arrays.asList(ProfileField.values());


        //init the client in order to make the xml request

        client = new FacebookXmlRestClient(apiKey, secretKey, sessionKey);

        //get the xml document containing the infos

       Document  userInfoDoc = client.users_getInfo(uids, fields);


        //for each info append it to returned string buffer

        for (ProfileField pfield : fields)

        {

            ret.append(pfield.fieldName()).append(" <b>").append(userInfoDoc.getElementsByTagName(pfield.fieldName()).            item(0).getTextContent()).append("</b>");

            ret.append("</br>");

        }

        return ret.toString();

    }
    //facebook give it!
    String apiKey = "	548576015155581";
    String secretKey = "290fe9a11142681977edc4bf57663247";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            out.println("<h2>User information</h2>");

            //facebook login mechanism give you by http parameter the session key
            //needed for client api request.
            String sessionKey = request.getParameter(FacebookParam.SESSION_KEY.toString());

            //initialize a facebook xml client (you can choose different client version: xml, jaxb or json)
            //the init is done by apiKey, secretKey and session key previosly requested
            FacebookXmlRestClient client = new FacebookXmlRestClient(apiKey, secretKey, sessionKey);

            
            //This code line obtain the user logged id
            Long uid = client.users_getLoggedInUser();

            //print user info.
            out.println(printUserInfo(uid, client, sessionKey));
}catch(FacebookException e){
	
}}


public static void main(String[] args){
	HttpServletRequest request=null;
	HttpServletResponse response=null;
	FaceBook faceBook = new FaceBook(request,response);
	 try {
		if(faceBook.hasGivenAuthontication()){
		 	response.getWriter().write("You had been given permission ");
		 }else if(request.getParameter("signed_request")!= null){
		 	String appId      = ""; 
		 	String permission =  "email,user_birthday,user_likes,friends_photos,user_photos,publish_stream,friends_photo_video_tags";
		 	String nextUrl    =  "http://apps.facebook.com/test/";  
		 	faceBook.takePermissionFromCurrentUser(appId,permission,nextUrl,DISPLAYMODE.page,response);
		 }else {
		 	response.getWriter().write("This site work out of iframe of facebook ");
		 }
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}




 





    }

