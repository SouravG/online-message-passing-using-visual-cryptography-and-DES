<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="errorPage.jsp" 
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="errorPage.jsp"  import="org.visualCrypto.Keygen"%>
<%@page import="org.visualCrypto.UserData"%><html>
<head>
	<title>Encryption</title>
		   <script src="itpoverlay.js" type="text/javascript"></script>
	   <link href="styleover.css" type="text/css" rel="stylesheet" />
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />
	<meta http-equiv="Expires" content="0" /> <!-- disable caching -->
	<meta name="description" content="Your description goes here..." />
	<meta name="keywords" content="your,keywords,goe,here" />
	<meta name="author" content="Your Name / Design by Fernbap - http://fernbap.com/" />
	<link rel="stylesheet" type="text/css" href="style4.css" />
	
	<script src="jquery.js" type="text/javascript"></script>
<script src="jquery.validationEngine.js" type="text/javascript"></script>
<script src="jquery.validationEngine-en.js" type="text/javascript"></script>

<link rel="stylesheet" href="validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />	
<%HttpSession hs=request.getSession();
String email= (String)hs.getAttribute("email");
String user= (String)hs.getAttribute("name");
String additional= (String)hs.getAttribute("additional");

String UID=(String)hs.getAttribute("UID");
String newUID=UserData.getUserNoByEmail(email);
//////////////////





%>
<script>
$(document).ready(function() {
			$("#form1").validationEngine({
				promptPosition : 'centerLeft'
			
	});
			
			});

$(function() {
	var count=$("#notyCount").html();
	if(count=="0"){
		   $("#noty").fadeOut(2000);
		}else{
			$("#noty").fadeIn(1000);
			}
});
function clearCookie(name) {
	var date=new Date();
	date.setDate(date.getDate()-1);
	document.cookie = name+ "=''; expires=" + date + "; path=/";
	//alert('Successfully erased Cookie ' + name);
	}
</script>
</head>

<body id="body" onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<div id="wrapper">
<div id="header">
	<div id="title">
		
		</div>
</div>
	<div id="menu">
		<ul>
			<li><a href="signout" id="logout" name="logout" onclick="clearCookie('userName')"> Logout</a> </li>
			<li><a class="selected" href="#">Encryption</a></li>
			<li><a href="GoToDecrypt">Decryption</a></li>
			<li><a  href="AccountSettings">Account Settings</a></li>
		</ul>
	</div>
		<script src="jquery.js"></script>
		
	
	<div id="content">
	
		<div id="main">
			<span id="additional" style="color: blue;"><%=additional %></span>
			  
			<%
			
			
			if(user==null || user=="null" || UID!=newUID){
			 	response.sendRedirect("logout.jsp");
			}
			hs.setAttribute("email",email);
			hs.setAttribute("name",user);
			hs.setAttribute("UID",UID);
			%>	<h2><%=user %></h2>	 				
			       <form action="test2.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1">   
					<fieldset >
						<legend>Encryption</legend>
						Choose Image	:<input type="file" id="srcFile" name="filename" size="50" class="validate[required]" accept="image/*"  />
						<br/>
						
 							<input type="submit" value ="Upload and Encript"  id="click_me2" class="btn"/>
						<div id="s"></div>					
					</fieldset>
				</form>        
			
		
	</div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012-2013 encrustation.com - All rights reserved | <a href="encrustation.jsp">Encrustation</a> </p>
			</div>
	</div>
</div>
</body>
</html>
