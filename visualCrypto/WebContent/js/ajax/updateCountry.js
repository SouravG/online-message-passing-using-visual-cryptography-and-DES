
function changeCountry(user)
{
	var str=document.getElementById("pwd3").value;
	var str1=document.getElementById("country").value;
	
	 
var xmlhttp;
if (str.length==0||str1.length==0)
  { document.getElementById("countryHint").innerHTML="";

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
    document.getElementById("countryHint").innerHTML="Country changed";
    document.getElementById("pwd3").value="";
    //document.getElementById("country").selectedIndex = -1;
    document.getElementById("countryHint").style.color="green";
    }
	  else{
		  document.getElementById("pwd3").value="";		 
			//document.getElementById("country").selectedIndex = -1;
		  document.getElementById("countryHint").innerHTML="Faild to update";
		    document.getElementById("countryHint").style.color="red";
		    
	  }
    }
  }
xmlhttp.open("GET","UpdateCountry?pwd="+str+"&country="+str1+"&email="+user,true);
xmlhttp.send();
}
