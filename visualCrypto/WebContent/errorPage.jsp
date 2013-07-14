<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page isErrorPage="true" import="java.io.*"%><html>
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

<%

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
			<li><a href="encrustation.jsp"> Homepage</a> </li>

		</ul>
	</div>
		<script src="jquery.js"></script>
		
	<%String errorCode=request.getParameter("error") ;String help="";
	if(errorCode.equals("java")){
		errorCode="We have some server issues at that moment";
		help="This is not your fault. Please give us some time to fix the problem.";
	}
	
	
	%>
	<div id="content">
		<div id="main">
				<h2>OOPs! <%=errorCode %></h2>					
			      
					<fieldset >
						<legend>ERROR</legend>
						<center>
					<img src="images/error.png"/><br/>	Encrustation got an error. 
					<br/><%=help %>
						</center>
							<%
out.println("<!--");
StringWriter sw = new StringWriter();
PrintWriter pw = new PrintWriter(sw);
//exception.printStackTrace(pw);
//out.print(sw);
//sw.close();
//pw.close();
out.println("-->");
%>		
					</fieldset>
			       
			
		
	</div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012 encrustation.com - All rights reserved | <a href="#">Encrustation</a> </p>
			</div>
	</div>
</div>
</body>
</html>
