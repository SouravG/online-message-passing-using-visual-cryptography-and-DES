
function showHint(user)
{
	var str=document.getElementById("pwd").value;
	var str1=document.getElementById("password").value;
	
	 
var xmlhttp;
if (str.length==0||str1.length==0)
  { document.getElementById("txtHint1").innerHTML="";
  document.getElementById("txtHint").innerHTML="";
  return;
  }

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  if(xmlhttp.responseText!=null){
		  document.getElementById("txtHint1").innerHTML=""; 		  
    document.getElementById("txtHint").innerHTML="password changed";
    document.getElementById("pwd").value="";
    document.getElementById("repwd").value="";
	document.getElementById("password").value="";

    }
	  else{
		  document.getElementById("pwd").value="";
		  document.getElementById("repwd").value="";
			document.getElementById("password").value="";
		  document.getElementById("txtHint").innerHTML="";
		    document.getElementById("txtHint1").innerHTML="your password was incorrect";
		    
	  }
    }
  };
xmlhttp.open("GET","UpdatePassword?old="+str+"&new="+str1+"&user="+user,true);
xmlhttp.send();
}
