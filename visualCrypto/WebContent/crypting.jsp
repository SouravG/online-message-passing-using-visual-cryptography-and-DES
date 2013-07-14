<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page errorPage="errorPage.jsp"  import="org.visualCrypto.Keygen"%>
<%@page import="org.visualCrypto.UserData"%><html>
<head>
	<title>Encrypting</title>
	<script src="jquery.js" type="text/javascript"></script>
		   <script src="js/checkRegisteredUser.js" type="text/javascript"></script>
		 
		   <script src="jquery-ui.js"></script>
		
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"/>

		   <script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js"></script>

	<link rel="stylesheet" href="css/chosen.css" type="text/css"/>
	<link rel="stylesheet" href="css/template.css" type="text/css"/>

	<meta http-equiv="content-type" content="application/xhtml+xml" />
	<meta http-equiv="Expires" content="0" /> <!-- disable caching -->
	<meta name="description" content="Your description goes here..." />
	<meta name="keywords" content="your,keywords,goe,here" />
	<meta name="author" content="Your Name / Design by Fernbap - http://fernbap.com/" />
	<link rel="stylesheet" type="text/css" href="style4.css" />
		<link type="text/css" rel="stylesheet" href="css/icon.css"/>
		<script >
		 $(function() {
			 var tabs = $( "#tabs" ).tabs();
			 tabs.find( ".ui-tabs-nav" ).sortable({
			 axis: "x",
			 stop: function() {
			 tabs.tabs( "refresh" );
			 }
			 });
			 });
		$(document).ready(function() {
			$( "#theImg" ).draggable({iframeFix: true,cursor: "move",containment: "parent"});
			$( "#encr1" ).draggable({iframeFix: true,cursor: "move",containment: "parent"});
			$( "#encr2" ).draggable({iframeFix: true,cursor: "move",containment: "parent"});
		$( document ).tooltip({
            items: " [data-geo], [title]",
            show: {
            	effect: "explode",
            	delay: 250
            	},
            hide: {effect: "explode",
	            	delay: 250
            	},
            
            content: function() {
                var element = $( this );
                if ( element.is( "[data-geo]" ) ) {
                	
                    var text = element.text();
                    return "  The username is = <br/><span id='txtHint4'>retriving...</span><br/>";
                    }
                if ( element.is( "[title]" ) ) {
                    return element.attr( "title" );
                } 

                }}
        );
		});
		function clearCookie(name) {
			var date=new Date();
			date.setDate(date.getDate()-1);
			document.cookie = name+ "=''; expires=" + date + "; path=/";
			//alert('Successfully erased Cookie ' + name);
			}
		</script>
		
		
		<style >
		.img:hover {
     width: 300px;
     height: 300px;
}
		
		
		.ui-tooltip {
        max-width: 350px;}
		
		</style>
<% 
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
response.setHeader("Pragma", "no-cache");
HttpSession hs=request.getSession();
String user= (String)hs.getAttribute("name");
String email= (String)hs.getAttribute("email");
String UID=(String)hs.getAttribute("UID");
String newUID=UserData.getUserNoByEmail(email);
hs.setAttribute("name",UserData.getUserNameFromEmail(email));
hs.setAttribute("email",email);
hs.setAttribute("UID",UID);
%>
</head>
<body id="body" onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<a href="signout" id="logout" name="logout" onclick="clearCookie('userName')" align="right"> Logout</a>
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
		
		
    	 <script type="text/javascript">	
    	 $(document).ready(function(){

    		  
		  function getData(srci) {
			  srci = srci.replace(/\\/g, "/"); /* convert all \ to / */
			  encodeURI(srci); /* encode the URI to enable escaping */
			  srci = "file://" + srci;
			 
			  document.getElementById('theImg').src=srci;
			  } });   	   	
		</script>
	
	<div id="content">
		<div id="main">
			
			  
			<%
			String encr1="images/noimg1.png";
			String encr2="images/noimg1.png";
			String source="images/noimg.png";
			String key="Key Not Generated";
			
			if(email==null || email=="null" || UID!=newUID){
			 	response.sendRedirect("logout.jsp");
			}
				encr1="images/noimg1.png";
				 encr2="images/noimg1.png";
				source="images/noimg.png";
				key="Key Not Generated";	
			
			
			if(request.getAttribute("key")!=null && request.getAttribute("key")!="null"){
				 encr1="userImages/"+email+"/encr1.png";
				 encr2="userImages/"+email+"/encr2.png";
				source="userImages/"+email+"/sourceimg.png"; 
				key=(String)request.getAttribute("key");
				hs.setAttribute("key",key);
			}
			//else{if(request.getParameter("key")==(null)&&request.getParameter("key")==("null")){
				//encr1="images/noimg1.png";
				// encr2="images/noimg1.png";
				//source="images/noimg.png";
				//key="Key Not Generated";	
			//}}
			%>	<h2>Welcome <%=user %></h2>				
			       <form action="EmailTheImages" method="post">   
					<fieldset >
						<legend>Encryption</legend>
						<p>Source Image</p>
						<div id="tabs">
						<img src="<%=source %>" width="200" height="200" id="theImg" />
 						<br/>
 						
 							
 													
										
						</div><br/><br/><a id="encr1" href="<%= encr1 %>" >Download First Encrypted Image Here</a><br/>
 							<a id="encr2" href="<%= encr2 %>" >Download Second Encrypted Image Here</a>	<br/>	<br/><br/>
						key=<%=key %><br/>
						
						
						Sender email address:<input  type="text" name="email" onkeyup="showHint4(this.value);"  data-geo="data-geo"/>
						<br/>	
						<input  type="submit"  class="btn" name="email" value="Send"/>
						<div id="s"></div>					
					</fieldset>
					<input  type="button" class="btn" value="Back" src="UploadImageBack?uno=<%=UID %>"/>
				</form>        
			
			
			
	
		
	</div></div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012 encrustation.com - All rights reserved | <a href="#">Encrustation</a> </p>
			</div>
	</div>

</body>
</html>
