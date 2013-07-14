<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="errorPage.jsp" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page import="org.visualCrypto.UserData"%><html>
<head>
	<title>Decryption</title>
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />
	<meta name="description" content="Your description goes here..." />
	<meta name="keywords" content="your,keywords,goe,here" />
	<meta name="author" content="Your Name / Design by Fernbap - http://fernbap.com/" />
	<link rel="stylesheet" type="text/css" href="style4.css" />
	<script type="text/javascript" src="jquery.js"></script>

	<script type="text/javascript" src="ajaxfileupload.js"></script>
	<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
	</script>
	 	 
	 
		<%HttpSession hs=request.getSession();
		String user= (String)hs.getAttribute("name");
		String email= (String)hs.getAttribute("email");
		hs.setAttribute("name",UserData.getUserNameFromEmail(email));
		hs.setAttribute("email",email);
		
		String UID=(String)hs.getAttribute("UID");
		hs.setAttribute("UID",UID);
		String newUID=UserData.getUserNoByEmail(email);
		
		
		
		
		%>
</head>
<body id="body" onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<div id="wrapper">
<div id="header">
	<div id="title">
		
		</div>
</div>
	<div id="menu">
		<ul>
			<li><a  href="signout">Sign out</a></li>
			<li><a href="UploadImageBack">Encryption</a></li>
			<li><a class="selected" href="#">Decryption</a></li>
			<li><a  href="AccountSettings">Account Settings</a></li>
		</ul>
	</div>
	<div id="content">
		<div id="main">
		<%
		if(email==null || email=="null"||UID!=newUID){
		 	response.sendRedirect("logout.jsp");
		}
	//	String encr1=null;
	//	String encr2=null;
		String source=null;
		String key="";
		if(request.getAttribute("key")==null){
			// encr1="images/noimg.png";
			// encr2="images/noimg.png";
			 source="images/noimg.png";
			key="";
		}
			if(request.getAttribute("key")=="Image Decrypted"){
				// encr1="userImages/"+email+"/decr1.png";
				// encr2="userImages/"+email+"/decr2.png";
				source="userImages/"+email+"/DecrypedSrc.png";
				key=(String)request.getAttribute("key");
			}else{
			//	encr1="images/noimg.png";
			//	encr2="images/noimg.png";
				source="images/noimg2.png";
				key="Key not found";
			}
		
			
			
			
		
			%><h2>Welcome <%=user %></h2><font color="red">        <%=key %></font>	
			
			<form action="decryptionDAO.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1">            
					<fieldset >
						<legend>Decryption</legend>
						Choose 1st encrypted image <input type="file"  name="filename" id="encr1" accept="image/*" />
						<br/><br/>
						Choose 2nd encrypted image <input type="file"  name="filename1" id="encr2" accept="image/*" />
						<br/><br/>
						key::<input type="text" name="key" placeholder="Enter the key"/>
						<br/><br/>
						<input type="submit" class="btn" value ="Decript"/>	
						<br/><br/>
						
						
					
						<img src=<%= source %> width="300" height="300"/>
						<br/>Decrypted Image<br/><br/>					
					</fieldset>
				</form>        
			
		
	</div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012 encrustation.com - All rights reserved | <a href="#">Encrustation</a> </p>
			</div>
	</div>
</div>
</body>
</html>
