<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Encrustation</title>
<link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script>
   <link href="generic.css" rel="stylesheet" type="text/css" />
   
<link rel="icon" href="images/title.png" type="image/png" />
</head>

<style>

.button {cursor:url(images4/redCursor.cur),pointer;
	height: 50px;
	width: 70px;
	display: inline-block;
	zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
	*display: inline;
	vertical-align: baseline;
	margin: 0 2px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .55em 2em .55em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {cursor:url(images4/redCursor.cur),pointer;
	text-decoration: none;
}
.button:active {
	position: relative;
	top: 1px;
}
.blue {cursor:url(images4/redCursor.cur),pointer;
	color: #d9eef7;
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
	background: -moz-linear-gradient(top,  #00adee,  #0078a5);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}
.blue:hover {cursor:url(images4/redCursor.cur),pointer;
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e');
}
.blue:active {cursor:url(images4/redCursor.cur),pointer;
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));
	background: -moz-linear-gradient(top,  #0078a5,  #00adee);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee');
}

</style>

<script type="text/javascript">
</script>

<body >
	<div class="div1"><h1 style="color: black;">Encrustation</h1>      
    </div> 
    <!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style addthis_32x32_style">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5107e7224235160e"></script>
<!-- AddThis Button END -->  
    <div id="sliderFrame">

        <div id="slider">
            <img src="images/slider-1.jpg" alt="#htmlcaption1" />
            <img src="images/slider-2.jpg" alt="#htmlcaption2" />
            <img src="images/slider-3.jpg" alt="#htmlcaption3" />
            <img src="images/slider-4.jpg" alt="#htmlcaption4" />
        </div>
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <a onclick="imageSlider.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider.next()" class="group1-Next"></a>
        </div>
        <!--thumbnails-->
        <div id="thumbs">
            <!-- navigation buttons in the thumbnails bar -->
            <a onclick="imageSlider.previous()" class="group2-Prev"></a>
            <a id='auto' onclick="switchAutoAdvance()"></a>
            <a onclick="imageSlider.next()" class="group2-Next" style="margin-right:30px;"></a>
            <!--Each thumb-->
            <div class="thumb"><img src="images/thumb-1.gif" /></div>
            <div class="thumb"><img src="images/thumb-2.gif" /></div>
            <div class="thumb"><img src="images/thumb-3.gif" /></div>
            <div class="thumb"><img src="images/thumb-4.gif" /></div>
        </div>
        <div id="htmlcaption1" style="display: none;">
            <div style="width:190px;height:280px;display:inline-block;background:white url(images/caption1.jpg) no-repeat 0 0;border-radius:4px;"></div>
        </div>
        <div id="htmlcaption2" style="display: none;">
            <div style="width:190px;height:130px;display:inline-block;background:transparent url(images/caption2.gif) no-repeat 0 0;border-radius:4px;"></div>
        </div>
        <div id="htmlcaption3" style="display: none;">
            <div style="width:190px;height:240px;display:inline-block;background:white url(images/caption3.gif) no-repeat 0 0;border-radius:4px;"></div>
        </div>
        <div id="htmlcaption4" style="display: none;">
            <div style="width:190px;height:240px;display:inline-block;background:white url(images/caption4.gif) no-repeat 0 0;border-radius:4px;"></div>
        </div>
    </div>

	
	<div class="div2" align="center">
					<form name="frm" action="homepage.jsp" >
<input type="submit" value="Start" class="button blue" align="right"/>
	<iframe src="https://www.facebook.com/plugins/like.php?href=encrustation.org" align="right" 
        scrolling="no" frameborder="0"
        style="border:none; width:450px; height:80px; color:white"></iframe> 				
</form>	
 <script type="text/javascript">
        //The following script is for the group 2 navigation buttons.
        function switchAutoAdvance() {
            imageSlider.switchAuto();
            switchPlayPauseClass();
        }
        function switchPlayPauseClass() {
            var auto = document.getElementById('auto');
            var isAutoPlay = imageSlider.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass();
    </script>

<br/><br/>
<p align="center" style="color: black;">Copyright &copy; 2012-2013 encrustation.com - All rights reserved &nbsp;<a href="#">Terms &amp; Conditions</a>&nbsp; |&nbsp;<a href="#">Privacy &amp; Cookies</a>&nbsp;|&nbsp;<a href="#">About&nbsp;Us</a></p>
		</div>
<div style="display:none;"></div>

</body>
</html>