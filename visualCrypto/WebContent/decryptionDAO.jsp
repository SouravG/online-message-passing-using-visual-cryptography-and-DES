<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="org.visualCrypto.Keygen"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.visualCrypto.Crypting"%>
<%@page import="org.visualCrypto.DES_EncryptAndDecrypt"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%

RequestDispatcher rd=null;
String user=(String) session.getAttribute("name");
String email=(String) session.getAttribute("email");
String key ="";
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////--------CHANGE SERVER IMAGE PATH HERE--------//////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
String serverPath="F:/JEE/workspace/visualCrypto/WebContent/userImages/"+email;///////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
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
			   String name = item.getFieldName();
               String value = item.getString();
               if(name.equals("key"))
                {
                        key=value;
                      
                        }

			   
			   
			   
		   } else {
			   try {
				   String itemName = serverPath+"/decr"+count+".png";
				    
				   File savedFile = new File(itemName);
				   item.write(savedFile); 
			   } catch (Exception e) {
				   e.printStackTrace();
			   }
		   }
		   }
	   }
	 
	 response.setDateHeader("Expires", 0);  
	 response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
	 response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
	 response.setHeader("Pragma", "no-cache");
///////////////////////////////////////////////////////////////////////////////////////
DES_EncryptAndDecrypt.imageDecrip(Keygen.generateKey(key),serverPath+"/decr1.png",serverPath+"/decr11.png");
DES_EncryptAndDecrypt.imageDecrip(Keygen.generateKey(key),serverPath+"/decr2.png",serverPath+"/decr21.png");
File decr1=new File(serverPath+"/decr11.png");
File decr2=new File(serverPath+"/decr21.png");
if(key!=null){
try{
BufferedImage decr1Buff1=Crypting.loadAndCheckEncrFile(decr1);

BufferedImage decr1Buff2=Crypting.loadAndCheckEncrFile(decr2);

BufferedImage output=Crypting.decryptImage(decr1Buff1, decr1Buff2);

File decrfile=new File(serverPath+"/DecrypedSrc.png");

ImageIO.write(output, "png", decrfile);

/////////////////////////////////////////////////////////////////////////////////////////////

rd=request.getRequestDispatcher("decrypting.jsp?name="+user);

session.setAttribute("email",email);
request.setAttribute("key", "Image Decrypted");

rd.include(request, response);
}catch(Exception e){
	BufferedImage  errorBuff=ImageIO.read( new File("F:/JEE/workspace/visualCrypto/WebContent/decryptionError.png"));
	File decrfile=new File(serverPath+"/DecrypedSrc.png");
	ImageIO.write(errorBuff, "png", decrfile);
}}
else{
	rd=request.getRequestDispatcher("decrypting.jsp?name="+user);

	session.setAttribute("email",email);
	request.setAttribute("key", "Key not found, Image not Decrypted");
	//request.setAttribute("key", key);
	rd.include(request, response);
	
}

	 



%>
<body>

</body>
</html>