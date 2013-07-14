<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
	<script src="jquery.js" type="text/javascript"></script>
<script src="jquery.validationEngine.js" type="text/javascript"></script>
<script src="jquery.validationEngine-en.js" type="text/javascript"></script>
<script src="js/forgotPass.js"></script>
	<link rel="stylesheet" href="validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link type="text/css" rel="stylesheet" href="css/icon.css"/>
	<link href="style1.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->  
	<script>
	$(document).ready(function() {
		$("#frm").validationEngine({
		prettySelect : true,
		useSuffix: "_chzn"
});	});
</script>  
</head>

<body>
<%
String actv=(String)request.getAttribute("act");
String name=(String)request.getAttribute("act1");
HttpSession hs=request.getSession();
String UID=(String)hs.getAttribute("UID");
hs.setAttribute("user",actv);
if(actv==null || actv=="null"){
 	response.sendRedirect("homepage.jsp");
 	
}String result=(String)request.getAttribute("res");
	if(result==null) result="";
%>
 
<div id="container">
	<div id="header">
	    <h1><a href="#">Encrustation</a></h1>		
	</div>
    
	<div id="body">
		<ul id="nav">
			<li class="first"><a href="homepage.jsp">Home page</a></li>
			<li><a href="registration.jsp">Sign Up</a></li>
			<li><a href="programs.htm">About Us</a></li>
		
			</ul>
		<div id="content"><div>
			<div id="main">
				<h2>Encrustation Account Activation</h2>
			<form id="frm" method="post" action="AccountActivationDao">            
					<fieldset>
				<span style="color:blue">Hello <%=name %></span><br/>
				<span style="color:red"><%= result %></span>
						<legend>Account Activation</legend>
						<p><label for="email">Your Activation Code: </label><input type="text" name="Actv" class="validate[required]"/></p>
					<input type="hidden" name="user" value=<%=actv%>/>
					<p><label>&nbsp;</label><input type="submit" value="Activate" class="btn" /></p>
					</fieldset>
				</form>         	
			</div><br/>
			<div id="sub">
				<h2></h2>	<br/>	<br/>
	



				
			</div>
		</div></div>	
	</div>
	
	<div id="footer">
		<p class="left">Copyright &copy; 2012-2013 encrustation.com - All rights reserved</p>
		<p class="right"><a href="#">Home</a></p>
	</div>	
<div style="display:none;"></div>
</div>	
</body>
</html>