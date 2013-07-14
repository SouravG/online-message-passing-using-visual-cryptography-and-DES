
function showHint2(str)
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
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
if(xmlhttp.responseText=="No user found on this email address"){
	document.getElementById("submit").disabled=true;
}
//else document.getElementById("submit").disabled=false;
    }
  }
xmlhttp.open("GET","forgotPass?email="+str,true);
xmlhttp.send();
}
