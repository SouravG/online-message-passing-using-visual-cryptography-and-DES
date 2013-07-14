<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="errorPage.jsp" 
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="errorPage.jsp"  import="org.visualCrypto.Keygen"%>
<%@page import="org.visualCrypto.UserData"%><html>
<head>
	<title>Encryption</title>
		   <script src="itpoverlay.js" type="text/javascript"></script>
	   <link href="styleover.css" type="text/css" rel="stylesheet" />
	<meta http-equiv="content-type" content="application/xhtml+xml" />
	<meta http-equiv="Expires" content="0" /> <!-- disable caching -->
	<meta name="description" content="Your description goes here..." />
	<meta name="keywords" content="your,keywords,goe,here" />
	<meta name="author" content="Your Name / Design by Fernbap - http://fernbap.com/" />
	<link rel="stylesheet" type="text/css" href="style4.css" />
	
<script src="js/passwordValidator.js"></script>
<script src="js/ajax/updatePwd.js"></script>
<script src="js/ajax/updateDOB.js"></script>
<script src="js/ajax/updateName.js"></script>
<script src="js/ajax/updateCountry.js"></script>
	<script src="jquery.js" type="text/javascript"></script>
	<script src="jquery-ui.js"></script>
	<script src="js/chosen.jquery.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"/>
	<link rel="stylesheet" href="css/chosen.css" type="text/css"/>
		<link type="text/css" rel="stylesheet" href="css/passwordStrength.css"/>
	
<script src="jquery.validationEngine.js" type="text/javascript"></script>
<script src="jquery.validationEngine-en.js" type="text/javascript"></script>

<link rel="stylesheet" href="validationEngine.jquery.css" type="text/css" media="screen" title="no title" />	
<%HttpSession hs=request.getSession();
String user= (String)hs.getAttribute("name");
String email= (String)hs.getAttribute("email");
hs.setAttribute("name",UserData.getUserNameFromEmail(email));
hs.setAttribute("email",email);
String UID=(String)hs.getAttribute("UID");
String newUID=UserData.getUserNoByEmail(email);
%>
<script>

$(function() {
	var icons = {
			header: "ui-icon-circle-arrow-e",
			activeHeader: "ui-icon-circle-arrow-s"
		};
	
	$( "#accordion" )
		.accordion({
			header: "> div > h3",
			icons: icons,
			heightStyle: "content"
			
		})
		.sortable({
			axis: "y",
			handle: "h3",
			stop: function( event, ui ) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children( "h3" ).triggerHandler( "focusout" );
			}
		});


	 $( document ).tooltip({
         items: "img, [data-geo], [title]",
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
               //  return "<b>Password Strength:</b><br/><div id='passwordStrength' class='strength0'></div><br/><div id='passwordDescription'>Password not entered</div>Use at least 8 characters ...";
                 }
            // if ( element.is( "[title]" ) ) {
             	//$( "[type=tel]" ).tooltip({track: true});
             	//$( "[type=email]" ).tooltip({track: true});
             	//$( "#country" ).tooltip({track: true});
              //   return element.attr( "title" );
           //  } 
             
         }
     });
	
});

$(document).ready(function() {
			$("#form1").validationEngine({
				promptPosition : 'centerRight'
			
	});
////////////////////////////////////////////////////////////////////////////////////////////////////
			$( ".datepicker" ).datepicker({minDate:(new Date(1940, 1 - 1, 1)), maxDate:0,
				//showOn: "button",
	          //  buttonImage: "images/btn-calendar.gif",
	           // buttonImageOnly: true,
	           hideIfNoPrevNext :true,
	            changeMonth: true,
				changeYear: true
				
	
				 });
			$( ".datepicker" ).datepicker( "option", "showAnim", "fold" );

////////////////////////////////////////////////////////////////////////////////////////////////////////
			$("#country").chosen({
			
			});
///////////////////////////////////////////////////////////////////////////////////////////////////////////

			

			
			});
function clearCookie(name) {
	var date=new Date();
	date.setDate(date.getDate()-1);
	document.cookie = name+ "=''; expires=" + date + "; path=/";
	//alert('Successfully erased Cookie ' + name);
	}
</script>

</head>

<body id="body" onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<div id="wrapper">
<div id="header">
	<div id="title">
		
		</div>
</div>
	<div id="menu">
		<ul>
			<li><a href="signout" id="logout" name="logout" onclick="clearCookie('userName')"> Logout</a> </li>
			<li><a href="UploadImageBack">Encryption</a></li>
			<li><a href="GoToDecrypt">Decryption</a></li>
			<li><a class="selected" href="#">Account Settings</a></li>			
			
		</ul>
	</div>
		
		
	
	<div id="content">
		<div id="main">
			
			  
			<%
			
			
			if(user==null || user=="null"|| UID!=newUID){
			 	response.sendRedirect("logout.jsp");
			}
		
			
			%>	<h2> <%=(String)hs.getAttribute("name") %></h2>					
			       <form action="#" method="post"  name="form1" id="form1">   
					<fieldset >
						<legend>Account Settings</legend>
						
						
						<div id="accordion">
		<div class="group">
		<h3>Name</h3>
		<div><b>Enter your full name.</b><br/>
			<input type="text" class="validate[required] text-input" id="name"/><br/>
		<b>To save these settings, please enter your password.</b><br/>
				  Password<input type="password" class="validate[required] text-input" id="pwd2"/><br/>
		
		 						<input  type="submit" id="submit3" class="btn" name="email" value="Save Changes" onclick="changeName('<%=email %>');return false;"/><span id="nameHint" style="color: green;"></span>
		</div>
	</div>
	<div class="group">
		<h3>Password</h3>
		<div>
		<p>To prevent hacking to your account and make sure your account's secure, we are log you out of any other computers and phones. You can log back in with your new password.</p><hr/>
		 <label style="width: 200px;float: left;">Current Password</label><input type="password" id="pwd" class="validate[required,minSize[8]] text-input"/><span id="txtHint1" style="color: red;font-size: 0.7em;"></span><br/>
		<label style="width: 200px;float: left;"> New Password</label><input type="password" id="password" onkeyup="passwordStrength(this.value)" class="validate[required,minSize[8]] text-input" data-geo="data-geo"/><div id='passwordDescription' >Password not entered</div>
		<label style="width: 200px;float: left;"> Retype New Password</label><input type="password" class="validate[required,equals[password]] text-input" id="repwd"/><br/>
		 						<input  type="button" id="submit1" class="btn" name="email" value="Save Changes" onclick="showHint('<%=email %>');return false;"/>
		 <span id="txtHint" style="color: green;"></span>
		</div>
	</div>
	<div class="group">
		<h3>Date Of Birth</h3>
		<div><b>Enter your date of birth .</b><br/>
		<input type="text" class="validate[required] text-input datepicker" id="dob"/><br/>
		<b>To save these settings, please enter your password.</b><br/>
				  Password<input type="password" class="validate[required] text-input" id="pwd1"/><br/>
		
		 						<input  type="button" id="submit2" class="btn" onclick="updateDoB('<%=email %>');return false;" value="Save Changes"/>
		<span id="dobHint" style="color: green;"></span>
		</div>
	</div>

	<div class="group">
		<h3>Country</h3>
		<div><b>Enter your country name </b><br/>
   <select name="country" id="country" class="validate[required]" title="Choose your Country name" style="width: 400px;" data-placeholder="Choose a country...">
						<option value=""></option>
						<option value="United States">United States</option>
						<option value="United Kingdom">United Kingdom</option>
						<option value="Afghanistan">Afghanistan</option>
						<option value="Albania">Albania</option>
						<option value="Algeria">Algeria</option>
						<option value="American Samoa">American Samoa</option>
						<option value="Andorra">Andorra</option>
						<option value="Angola">Angola</option>
						<option value="Anguilla">Anguilla</option>
						<option value="Antarctica">Antarctica</option>
						<option value="Antigua and Barbuda">Antigua and Barbuda</option>
						<option value="Argentina">Argentina</option>
						<option value="Armenia">Armenia</option>
						<option value="Aruba">Aruba</option>
						<option value="Australia">Australia</option>
						<option value="Austria">Austria</option>
						<option value="Azerbaijan">Azerbaijan</option>
						<option value="Bahamas">Bahamas</option>
						<option value="Bahrain">Bahrain</option>
						<option value="Bangladesh">Bangladesh</option>
						<option value="Barbados">Barbados</option>
						<option value="Belarus">Belarus</option>
						<option value="Belgium">Belgium</option>
						<option value="Belize">Belize</option>
						<option value="Benin">Benin</option>
						<option value="Bermuda">Bermuda</option>
						<option value="Bhutan">Bhutan</option>
						<option value="Bolivia">Bolivia</option>
						<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
						<option value="Botswana">Botswana</option>
						<option value="Bouvet Island">Bouvet Island</option>
						<option value="Brazil">Brazil</option>
						<option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
						<option value="Brunei Darussalam">Brunei Darussalam</option>
						<option value="Bulgaria">Bulgaria</option>
						<option value="Burkina Faso">Burkina Faso</option>
						<option value="Burundi">Burundi</option>
						<option value="Cambodia">Cambodia</option>
						<option value="Cameroon">Cameroon</option>
						<option value="Canada">Canada</option>
						<option value="Cape Verde">Cape Verde</option>
						<option value="Cayman Islands">Cayman Islands</option>
						<option value="Central African Republic">Central African Republic</option>
						<option value="Chad">Chad</option>
						<option value="Chile">Chile</option>
						<option value="China">China</option>
						<option value="Christmas Island">Christmas Island</option>
						<option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
						<option value="Colombia">Colombia</option>
						<option value="Comoros">Comoros</option>
						<option value="Congo">Congo</option>
						<option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
						<option value="Cook Islands">Cook Islands</option>
						<option value="Costa Rica">Costa Rica</option>
						<option value="Cote D'ivoire">Cote D'ivoire</option>
						<option value="Croatia">Croatia</option>
						<option value="Cuba">Cuba</option>
						<option value="Cyprus">Cyprus</option>
						<option value="Czech Republic">Czech Republic</option>
						<option value="Denmark">Denmark</option>
						<option value="Djibouti">Djibouti</option>
						<option value="Dominica">Dominica</option>
						<option value="Dominican Republic">Dominican Republic</option>
						<option value="Ecuador">Ecuador</option>
						<option value="Egypt">Egypt</option>
						<option value="El Salvador">El Salvador</option>
						<option value="Equatorial Guinea">Equatorial Guinea</option>
						<option value="Eritrea">Eritrea</option>
						<option value="Estonia">Estonia</option>
						<option value="Ethiopia">Ethiopia</option>
						<option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
						<option value="Faroe Islands">Faroe Islands</option>
						<option value="Fiji">Fiji</option>
						<option value="Finland">Finland</option>
						<option value="France">France</option>
						<option value="French Guiana">French Guiana</option>
						<option value="French Polynesia">French Polynesia</option>
						<option value="French Southern Territories">French Southern Territories</option>
						<option value="Gabon">Gabon</option>
						<option value="Gambia">Gambia</option>
						<option value="Georgia">Georgia</option>
						<option value="Germany">Germany</option>
						<option value="Ghana">Ghana</option>
						<option value="Gibraltar">Gibraltar</option>
						<option value="Greece">Greece</option>
						<option value="Greenland">Greenland</option>
						<option value="Grenada">Grenada</option>
						<option value="Guadeloupe">Guadeloupe</option>
						<option value="Guam">Guam</option>
						<option value="Guatemala">Guatemala</option>
						<option value="Guinea">Guinea</option>
						<option value="Guinea-bissau">Guinea-bissau</option>
						<option value="Guyana">Guyana</option>
						<option value="Haiti">Haiti</option>
						<option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
						<option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
						<option value="Honduras">Honduras</option>
						<option value="Hong Kong">Hong Kong</option>
						<option value="Hungary">Hungary</option>
						<option value="Iceland">Iceland</option>
						<option value="India">India</option>
						<option value="Indonesia">Indonesia</option>
						<option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
						<option value="Iraq">Iraq</option>
						<option value="Ireland">Ireland</option>
						<option value="Israel">Israel</option>
						<option value="Italy">Italy</option>
						<option value="Jamaica">Jamaica</option>
						<option value="Japan">Japan</option>
						<option value="Jordan">Jordan</option>
						<option value="Kazakhstan">Kazakhstan</option>
						<option value="Kenya">Kenya</option>
						<option value="Kiribati">Kiribati</option>
						<option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
						<option value="Korea, Republic of">Korea, Republic of</option>
						<option value="Kuwait">Kuwait</option>
						<option value="Kyrgyzstan">Kyrgyzstan</option>
						<option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
						<option value="Latvia">Latvia</option>
						<option value="Lebanon">Lebanon</option>
						<option value="Lesotho">Lesotho</option>
						<option value="Liberia">Liberia</option>
						<option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
						<option value="Liechtenstein">Liechtenstein</option>
						<option value="Lithuania">Lithuania</option>
						<option value="Luxembourg">Luxembourg</option>
						<option value="Macao">Macao</option>
						<option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
						<option value="Madagascar">Madagascar</option>
						<option value="Malawi">Malawi</option>
						<option value="Malaysia">Malaysia</option>
						<option value="Maldives">Maldives</option>
						<option value="Mali">Mali</option>
						<option value="Malta">Malta</option>
						<option value="Marshall Islands">Marshall Islands</option>
						<option value="Martinique">Martinique</option>
						<option value="Mauritania">Mauritania</option>
						<option value="Mauritius">Mauritius</option>
						<option value="Mayotte">Mayotte</option>
						<option value="Mexico">Mexico</option>
						<option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
						<option value="Moldova, Republic of">Moldova, Republic of</option>
						<option value="Monaco">Monaco</option>
						<option value="Mongolia">Mongolia</option>
						<option value="Montenegro">Montenegro</option>
						<option value="Montserrat">Montserrat</option>
						<option value="Morocco">Morocco</option>
						<option value="Mozambique">Mozambique</option>
						<option value="Myanmar">Myanmar</option>
						<option value="Namibia">Namibia</option>
						<option value="Nauru">Nauru</option>
						<option value="Nepal">Nepal</option>
						<option value="Netherlands">Netherlands</option>
						<option value="Netherlands Antilles">Netherlands Antilles</option>
						<option value="New Caledonia">New Caledonia</option>
						<option value="New Zealand">New Zealand</option>
						<option value="Nicaragua">Nicaragua</option>
						<option value="Niger">Niger</option>
						<option value="Nigeria">Nigeria</option>
						<option value="Niue">Niue</option>
						<option value="Norfolk Island">Norfolk Island</option>
						<option value="Northern Mariana Islands">Northern Mariana Islands</option>
						<option value="Norway">Norway</option>
						<option value="Oman">Oman</option>
						<option value="Pakistan">Pakistan</option>
						<option value="Palau">Palau</option>
						<option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
						<option value="Panama">Panama</option>
						<option value="Papua New Guinea">Papua New Guinea</option>
						<option value="Paraguay">Paraguay</option>
						<option value="Peru">Peru</option>
						<option value="Philippines">Philippines</option>
						<option value="Pitcairn">Pitcairn</option>
						<option value="Poland">Poland</option>
						<option value="Portugal">Portugal</option>
						<option value="Puerto Rico">Puerto Rico</option>
						<option value="Qatar">Qatar</option>
						<option value="Reunion">Reunion</option>
						<option value="Romania">Romania</option>
						<option value="Russian Federation">Russian Federation</option>
						<option value="Rwanda">Rwanda</option>
						<option value="Saint Helena">Saint Helena</option>
						<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
						<option value="Saint Lucia">Saint Lucia</option>
						<option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
						<option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
						<option value="Samoa">Samoa</option>
						<option value="San Marino">San Marino</option>
						<option value="Sao Tome and Principe">Sao Tome and Principe</option>
						<option value="Saudi Arabia">Saudi Arabia</option>
						<option value="Senegal">Senegal</option>
						<option value="Serbia">Serbia</option>
						<option value="Seychelles">Seychelles</option>
						<option value="Sierra Leone">Sierra Leone</option>
						<option value="Singapore">Singapore</option>
						<option value="Slovakia">Slovakia</option>
						<option value="Slovenia">Slovenia</option>
						<option value="Solomon Islands">Solomon Islands</option>
						<option value="Somalia">Somalia</option>
						<option value="South Africa">South Africa</option>
						<option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
						<option value="South Sudan">South Sudan</option>
						<option value="Spain">Spain</option>
						<option value="Sri Lanka">Sri Lanka</option>
						<option value="Sudan">Sudan</option>
						<option value="Suriname">Suriname</option>
						<option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
						<option value="Swaziland">Swaziland</option>
						<option value="Sweden">Sweden</option>
						<option value="Switzerland">Switzerland</option>
						<option value="Syrian Arab Republic">Syrian Arab Republic</option>
						<option value="Taiwan, Republic of China">Taiwan, Republic of China</option>
						<option value="Tajikistan">Tajikistan</option>
						<option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
						<option value="Thailand">Thailand</option>
						<option value="Timor-leste">Timor-leste</option>
						<option value="Togo">Togo</option>
						<option value="Tokelau">Tokelau</option>
						<option value="Tonga">Tonga</option>
						<option value="Trinidad and Tobago">Trinidad and Tobago</option>
						<option value="Tunisia">Tunisia</option>
						<option value="Turkey">Turkey</option>
						<option value="Turkmenistan">Turkmenistan</option>
						<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
						<option value="Tuvalu">Tuvalu</option>
						<option value="Uganda">Uganda</option>
						<option value="Ukraine">Ukraine</option>
						<option value="United Arab Emirates">United Arab Emirates</option>
						<option value="United Kingdom">United Kingdom</option>
						<option value="United States">United States</option>
						<option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
						<option value="Uruguay">Uruguay</option>
						<option value="Uzbekistan">Uzbekistan</option>
						<option value="Vanuatu">Vanuatu</option>
						<option value="Venezuela">Venezuela</option>
						<option value="Viet Nam">Viet Nam</option>
						<option value="Virgin Islands, British">Virgin Islands, British</option>
						<option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
						<option value="Wallis and Futuna">Wallis and Futuna</option>
						<option value="Western Sahara">Western Sahara</option>
						<option value="Yemen">Yemen</option>
						<option value="Zambia">Zambia</option>
						<option value="Zimbabwe">Zimbabwe</option>
					</select> <br/>
		<b>To save these settings, please enter your password.</b><br/>
				  Password<input id="pwd3" type="password" class="validate[required] text-input"/><br/>
<input  type="submit" id="submit4" class="btn" name="countryChange"  value="Save Changes" onclick="changeCountry('<%=email %>');return false;"/><span id="countryHint"></span>		
	<br/><br/><br/><br/><br/><br/><br/><br/><br/></div>
	</div>
</div>
						
						
						
						<div id="s"></div>					
					</fieldset>
				</form>        
			
		
	</div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012-2013 encrustation.com - All rights reserved | <a href="encrustation.jsp">Encrustation</a> </p>
			</div>
	</div>
</div>
</body>
</html>
