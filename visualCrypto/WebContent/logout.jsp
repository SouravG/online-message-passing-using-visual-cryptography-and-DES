<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style4.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="refresh" content="1;URL='encrustation.jsp'" />
<title>Encrustation</title>
</head>
<script type="text/javascript">history.forward();

var name="UID";
	var date=new Date();
	date.setDate(date.getDate()-1);
	document.cookie = name+ "=''; expires=" + date + "; path=/";

	//alert('Successfully erased Cookie ' + name);




</script>
<body>
<div id="wrapper">
<div id="header">
	<div id="title">
		
		</div>
</div>
	
	<div id="content">
		<div id="main">
		
		<%request.setAttribute("email","null");
		session.removeAttribute("email");
		session.removeAttribute("name");
		session.invalidate();
		response.setHeader("Pragma","no-cache"); // HTTP 1.0
		response.setHeader("Cache-Control", "private,no-store,no-cache"); // HTTP 1.1
		response.setHeader("Expires","0");
		response.setDateHeader("Expires", -1);
		/////////////////////////////////////////////////////////////////
		
	    
	
		
		
		
		
		
		%>
		<center>
		You have been Logged Out.<br/>
		This page will redirected to homepage<br/>
		or <a href="encrustation.jsp">Click here</a>
		</center>
		</div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012 encrustation.com - All rights reserved | <a href="#">Encrustation</a> </p>
			</div>
	</div>
</div>
</body>
</html>