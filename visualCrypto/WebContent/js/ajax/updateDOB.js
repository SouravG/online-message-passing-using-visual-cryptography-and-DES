
function updateDoB(user)
{
	var str=document.getElementById("dob").value;
	var pwd=document.getElementById("pwd1").value;
	
	 
var xmlhttp;
if (str.length==0)
  { document.getElementById("dobHint").innerHTML="";
 
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
		 	  
    document.getElementById("dobHint").innerHTML="Date of birth changed";
    document.getElementById("dob").value="";
	document.getElementById("pwd1").value="";
	
    }
	  else{
		  document.getElementById("dobHint").innerHTML="failed to update";
		  document.getElementById("dobHint").style.color="red";
		  document.getElementById("dob").value="";
			document.getElementById("pwd1").value="";
			
		  
		    
	  }
    }
  }
xmlhttp.open("GET","UpdateDOB?dob="+str+"&pwd="+pwd+"&user="+user,true);
xmlhttp.send();
}
