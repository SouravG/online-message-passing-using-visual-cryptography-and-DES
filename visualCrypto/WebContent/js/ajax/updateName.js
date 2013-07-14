
function changeName(user)
{
	var str=document.getElementById("pwd2").value;
	var str1=document.getElementById("name").value;
	
	 
var xmlhttp;
if (str.length==0||str1.length==0)
  { document.getElementById("nameHint").innerHTML="";

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
	  if(xmlhttp.responseText==1){				  
    document.getElementById("nameHint").innerHTML="Name changed";
    document.getElementById("pwd2").value="";
    document.getElementById("name").value="";
    }
	  else{
		  document.getElementById("pwd2").value="";		 
			document.getElementById("name").value="";
		  document.getElementById("nameHint").innerHTML="Faild to update";
		    document.getElementById("nameHint").style.color="red";
		    
	  }
    }
  }
xmlhttp.open("GET","UpdateName?pwd="+str+"&name="+str1+"&email="+user,true);
xmlhttp.send();
}
