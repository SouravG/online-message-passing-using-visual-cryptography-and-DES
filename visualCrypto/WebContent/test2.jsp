
<%@page import="javax.crypto.SecretKey"%>
<%@page import="org.visualCrypto.DES_EncryptAndDecrypt"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="errorPage.jsp" 
    pageEncoding="ISO-8859-1"%>
<%@page import="java.awt.Color"%>
<%@page import="org.visualCrypto.Keygen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%><%@ page import="java.io.*" %>
<%@page import="org.visualCrypto.Crypting"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   
<%HttpSession hs=request.getSession();
String user=(String)hs.getAttribute("name");
String email=(String)hs.getAttribute("email");
if(user==null || user=="null"){
 	response.sendRedirect("homepage.jsp");
}
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////--------CHANGE SERVER IMAGE PATH HERE--------//////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
String serverPath="F:/JEE/workspace/visualCrypto/WebContent/userImages/"+email;///////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
boolean path=new File(serverPath).mkdir();
File oldFile=new File(serverPath+"/sourceimg.png");
oldFile.delete();
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart) {
} else {
	   FileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   List items = null;
	   try {
		   items = upload.parseRequest(request);
	   } catch (FileUploadException e) {
		   e.printStackTrace();
	   }
	   Iterator itr = items.iterator();
	   int count=0;
	   while (itr.hasNext()) {
	   FileItem item = (FileItem) itr.next();
	   count++;
	   if (item.isFormField()) {
	   } else {
		   try {
			   String itemName = serverPath+"/sourceimg.png";
			    
			   File savedFile = new File(itemName);
			   item.write(savedFile); 
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
  }
  
 
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
response.setHeader("Pragma", "no-cache");
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	File srcFile=new File(serverPath+"/sourceimg.png");
	BufferedImage imgFile;
	String result="encryption done";
		imgFile = ImageIO.read(srcFile);
		BufferedImage imgKey=Crypting.generateKey(imgFile.getWidth(),imgFile.getHeight());
		File outputKey=new File(serverPath+"/encr11.png");
		ImageIO.write(imgKey, "png", outputKey);
///////////////////////////////////////////////////////////////////////
		BufferedImage imgSrc=Crypting.loadAndCheckSource(srcFile, imgKey.getWidth()/2, imgKey.getHeight()/2, true);
		
		if (imgSrc == null) {
			result="Image is not fit for encryption";				
		}			
		BufferedImage enrfile=Crypting.encryptImage(imgKey, imgSrc);
		File outputEncr=new File(serverPath+"/encr21.png");
		ImageIO.write(enrfile, "png", outputEncr);
		
		String key=Keygen.key(srcFile);
		SecretKey secKey=Keygen.generateKey(key);
		DES_EncryptAndDecrypt.imageEcryp(secKey,serverPath+"/encr21.png",serverPath+"/encr2.png");
		DES_EncryptAndDecrypt.imageEcryp(secKey,serverPath+"/encr11.png",serverPath+"/encr1.png");
		
		RequestDispatcher rd=request.getRequestDispatcher("crypting.jsp?key="+key);
		hs.setAttribute("name", user);
		hs.setAttribute("email", email);	
		
		request.setAttribute("key",key);
		//request.setAttribute("source","userImages/sourceimg.png");
		//request.setAttribute("encr1","userImages/encr1.png");
		//request.setAttribute("encr2","userImages/encr2.png");
		rd.include(request, response);


	
%>


