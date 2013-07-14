
function sendImages(str1)
{
var str=document.getElementById("emailsend").value;
var xmlhttp;
if (str.length==0)
  { 
  document.getElementById("txtHint4").innerHTML="";
  return;
  }
var params = "name="+str1+"&email="+str;
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
    document.getElementById("txtHint4").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", params.length);
xmlhttp.setRequestHeader("Connection", "close");

xmlhttp.open("POST","EmailTheImages",true);
xmlhttp.send(params);
}
