<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="org.visualCrypto.UserData"%>


<html>
<head>
	<title>Encrustation</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<meta name="copyright" content="" />	  
	<meta name="revisit-after" content="3 days" />
	<link href="style1.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->    
 
 
<script type="text/javascript">


    function noBack() { window.history.forward();   }
</script></head>
<body onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<%RequestDispatcher rd=null;
 HttpSession hs=request.getSession();
String actv="";

if(request.getAttribute("act")!=null){
	actv=(String)request.getAttribute("act");}
	String userName = null;
    String password =null;
    Cookie c=null;
    boolean forward=false;
	

		
 //else{ 
     

%>
 

<div id="container">
	<div id="header">
	    <h1><a href="#">Encrustation</a></h1>		
	</div>
    
	<div id="body">
		<ul id="nav">
			<li class="first"><a href="#">Home page</a></li>
			<li><a href="registration.jsp">Sign Up</a></li>
			<li><a href="programs.htm">About Us</a></li>
		
			</ul>
		<div id="content"><div>
			<div id="main">
				<h2>Login</h2>
				
			<form method="post" action="LoginDAO">            
					<fieldset>
					<span style="color:red"><%=actv %></span>
						<legend>Login</legend>
						<p><label for="Admin Id">Email: </label><input type="text" name="user" id="emp" /></p>
						<p><label for="Password">Password :</label><input type="password" name="pwd" id="pwd" /></p>
						<p><label>Keep me logged in:</label><input type="checkbox" value="remember" name="remember" id="check"></input></p>
					<p><label>&nbsp;</label><input type="submit" value="Submit" class="btn" /></p>
					<input type="hidden" id="txtHint"/>
					</fieldset>
				</form>         	
			</div> 
			<div id="sub">
				<h2>Forgot Password?</h2>
				<p><a href="forgotPassword.jsp"> Just click here.</a></p>
			</div>
			
			
			
		</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">&copy; 2012 encrustation.com</p>
		<p class="right"><a href="#">Home</a></p>
	</div>	
<div style="display:none;"></div>
</div>	<%// }%>
</body>
</html>