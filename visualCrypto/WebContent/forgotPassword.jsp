<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="errorPage.jsp" 
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
<link rel="stylesheet" href="css/base/jquery.ui.all.css"/>
	<script src="jquery-ui.js"></script>

	<link rel="stylesheet" href="validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	
	<link href="style1.css" rel="stylesheet" type="text/css" />
	<!--[if IE]><link href="css/ie-transparency.css" rel="stylesheet" type="text/css" /><![endif]-->  
	<style> 
		    #res
		    {
		    
		    padding:30px 20px; 
		    

		    width:230px;
		    border-radius:15px;
		    -moz-border-radius:15px; /* Old Firefox */
		    }
		    </style>
	<script>
	$(document).ready(function() {
		$("#frm").validationEngine({
		prettySelect : true,
		useSuffix: "_chzn"
});	});
</script>  
</head>

<body>

 
<div id="container">
	<div id="header">
	    <h1><a href="#">Encrustation</a></h1>		
	</div>
    
	<div id="body">
		<ul id="nav">
			<li class="first"><a href="homepage.jsp">Login</a></li>
			<li><a href="registration.jsp">Sign Up</a></li>
			<li><a href="programs.htm">About Us</a></li>
		
			</ul>
		<div id="content"><div>
			<div id="main">
				<h2>Password Recovery</h2>
			<form id="frm" method="post" action="ForgotPassword">            
					<fieldset>
				
						<legend>Password Recovery</legend>
						<p><label for="email">Enter Your Email Address: </label><input type="email" name="email" id="email" class="validate[required,custom[email]] " onkeyup="showHint2(this.value)"/></p>
					<span id="txtHint"></span>
					<p><label>&nbsp;</label><input type="submit" value="Submit" class="btn" id="submit"/></p>
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
		<p class="right"><a href="encrustation.jsp">Home</a></p>
	</div>	
<div style="display:none;"></div>
</div>	
</body>
</html>