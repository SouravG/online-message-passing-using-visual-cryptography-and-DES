
function showHint(str)
{
var xmlhttp;
if (str.length==0)
  { 
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
    {if(xmlhttp.responseText==1){
    document.getElementById("txtHint").innerHTML="<div id='res' style='border:2px solid #ff0000;background:pink;'>&nbsp; This email has been registered already</div>";
    document.getElementById("submit").disabled=true;
    
    }
    else{
    	document.getElementById("txtHint").innerHTML="";
    	document.getElementById("submit").disabled=false;
    	}
    }
  }
xmlhttp.open("GET","Test?email="+str,true);
xmlhttp.send();
}
