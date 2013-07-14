<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="errorPage.jsp" 
    pageEncoding="ISO-8859-1"%>
    <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sign up</title>
<script src="jquery.js" type="text/javascript"></script>
<script src="jquery.validationEngine.js" type="text/javascript"></script>
<script src="jquery.validationEngine-en.js" type="text/javascript"></script>
<script src="js/passwordValidator.js"></script>
<script src="js/checkEmail.js"></script>
<script src="js/checkUser.js"></script>

<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js"></script>


	<link rel="stylesheet" href="validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link type="text/css" rel="stylesheet" href="css/passwordStrength.css"/>
	<link type="text/css" rel="stylesheet" href="css/icon.css"/>
	<link rel="stylesheet" href="css/chosen.css" type="text/css"/>
	<link rel="stylesheet" href="css/template.css" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"/>
	<meta name="description" content="This is Encrustation Registration form." />
	<meta name="keywords" content="your,keywords,goe,here" />
	<meta name="author" content="Your Name / Design by Fernbap - http://fernbap.com/" />
	<link rel="stylesheet" type="text/css" href="style4.css" />
	<style>
	   
    #res{		    
		    padding:7px 5px; 		    
		    max-width:400px;
		   
		    border-radius:5px;
		    -moz-border-radius:5px; /* Old Firefox */
		    }
	</style>
<style type="text/css">
  .recaptcha-widget .recaptcha-buttons {
  position: absolute;
  bottom: 16px;
  right: 11px;
  }

</style>
	
	
	<script type="text/javascript">
	var RecaptchaOptions = {
			 theme : 'custom',
			 tabindex : 2
			 ,
			    custom_theme_widget: 'recaptcha_widget'
 };</script>
	<script>
	
		    // Invoke the plugin
		   
$(document).ready(function() {
			$("#frm").validationEngine({
				promptPosition : 'centerLeft',
			prettySelect : true,
			useSuffix: "_chzn"
});
			$("#country").chosen({
				allow_single_deselect: true 
			});
			$( ".datepicker" ).datepicker({minDate:(new Date(1940, 1 - 1, 1)), maxDate:0,
				//showOn: "button",
	          //  buttonImage: "images/btn-calendar.gif",
	           // buttonImageOnly: true,
	           hideIfNoPrevNext :true,
	            changeMonth: true,
				changeYear: true
				
	
				 });
			$( ".datepicker" ).datepicker( "option", "showAnim", "fold" );
			 
			 $( document ).tooltip({
				 
		            items: "img, [data-geo]",
		            show: {
		            	effect: "slide",
		            	delay: 250
		            	},
		            hide: {effect: "explode",
			            	delay: 250
		            	},
		            
		            content: function() {
		                var element = $( this );
		                if ( element.is( "[data-geo]" ) ) {
		                	
		                    var text = element.text();
		                    return "<b>Password Strength:</b><br/><div id='passwordStrength' class='strength0'></div><br/><div id='passwordDescription'>Password not entered</div>Use at least 8 characters ...";
		                    }
		                if ( element.is( "[title]" ) ) {
		                	$( "[type=tel]" ).tooltip({track: true});
		                	$( "[type=email]" ).tooltip({track: true});
		                	$( "#country" ).tooltip({track: true});
		                    return element.attr( "title" );
		                } 
		                if ( element.is( "img" ) ) {
		                    return element.attr( "alt" );
		                }
		            },opacity: 0.95, 
				    left: -120 
		        });
			
					$( "#radio" ).buttonset();
					// $('[type=text],[type=email], [type=password]').placeholder();	        
			});
</script>
 <style>
  .ui-buttonset {
  background-color: D0D0FF;
  }
     .ui-tooltip {
        max-width: 350px;
         border-color:#9ecaed;
    box-shadow:0 0 18px #9ecaed;
    left: 120px;
    }
    .ui-datepicker {
        
        background-color: #D0D0FF;
    }
    </style>
</head>
<body >
<% HttpSession hs=request.getSession();
String actv="";
if(request.getAttribute("act")!=null){
	actv=(String)request.getAttribute("act");
}


%>
<div id="wrapper">
<div id="header">
	<div id="title">
		<h1><a href="#"></a></h1>
		</div>
</div>
	<div id="menu">
		<ul>
			<li><a  href="encrustation.jsp">Home</a></li>
			<li><a  href="homepage.jsp">Login</a></li>
			
		</ul>
	</div>
	<div id="content">
		<div id="main">
			<h2>Registration</h2>
			<form method="post" action="Registration" id="frm">
					<fieldset>
					
						<legend></legend>
						
<label for="Name" style="width: 200px;float: left;">	Full Name	:</label><input type="text" autocomplete="off" id="account" name="username" class="validate[required,minSize[1]] text-input" onkeyup="showHint1(this.value)" title="Choose your own Username" placeholder="e.g. John_Doe"/>           
<br/><br/>
<label for="pwd" style="width: 200px;float: left;">	Password	:</label><input type="password" name="pwd" class="validate[required,minSize[8]] text-input" id="password" onkeyup="passwordStrength(this.value)" title="Enter your own Password" data-geo="data-geo" placeholder="provide your own password"/>
  
                        
<br/><br/><label for="repwd" style="width: 200px;float: left;">	Retype Password	:</label><input type="password" id="password" name="pwd1" class="validate[required,equals[password]] text-input" title="Retype your Password" placeholder="Retype your password"/>
<br/>
<br/>

<label for="email" style="width: 200px;float: left;">Email:</label><input type="email" name="email" autocomplete="off" id="email" class="validate[required,custom[email]] text-input" onkeyup="showHint(this.value)" title="Enter your email address" placeholder="e.g. address@example.ext"/>						
<span  id="txtHint"></span><br/> <br/>

<label for="dob" style="width: 200px;float: left;">	Date of Birth	:</label><input type="text" name="dob" class="validate[required] text-input datepicker" placeholder="e.g. mm-dd-yyyy"/>
<br/><div id="radio"><br/>
<label for="dob" style="width: 200px;float: left;">	Gender		:</label><input type="radio" id="radio1" name="radio" class="validate[required] radio" value="male"/><label for="radio1">Male</label><input type="radio" id="radio2" name="radio" class="validate[required] radio" value="female"/><label for="radio2">Female</label>
	</div>
<br/>
<label for="dob" style="width: 200px;float: left;">	Country	:	</label><select name="country" id="country" class="validate[required] " title="Choose your Country name" data-placeholder="Choose a country...">
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
					</select> <br/><br/>
					

<br/><label for="phono" style="width: 200px;float: left;">Phone no:</label><input type="tel" autocomplete="off" name="phono" id="phone" class="validate[required,custom[phone],maxSize[13]] text-input" title="Enter your phone number" placeholder="e.g. +32 472 77 69 88"/>
  
<br/><br/>

<div id="recaptcha_widget" style="display:none; border: 1px solid; width: 350px">
<input id="signuptoken" name="signuptoken" value="03AHJ_Vuvf8vAOOB6hoHa5qO6jEH-q_lJEjZH9SlECaDciAbxt1Ntxk6Q0eMxBSxcaHNWcQpLCcEb6NBAiG6oZvWiRomYfywBF5x6jIeGp_IqA2uXiaecy_xsKPSpxxM7Cf1N7mm90JhpP0JZlPz9qIaEymJ0Qv614on5RD-SCj98g_pd4Gj7GiNo" type="hidden">
<input id="signuptoken_audio" name="signuptoken_audio" value="03AHJ_VutLr7o6p1d2NjsX5IqtliwLM7NfV5D40zaJ1sxLECVPCxrJ64Z236yZO3SH8Dv_yGn1DKCs5lY8gMblU8HIvvDsJ7h6JPHQi-EKhBcdzCR5w20QKksk90LUXu-wTrOq3XYqDvgbTRWZQJmw6F_sgobdzjuSCv11qrQWivl_pGiY9q5n4Y3na42Ilk_FJQPefgWaIGQu2YY-xLod78v_XoRHczrvvw" type="hidden">
<input name="signupcaptchaStats" value="lXwdDsMp7GrULOoHgdBT03T_Lo24fSX-3Kg1yBkdTy0:-LrO0fo-ZNKFRUnVMlmXqA" type="hidden">
<input name="recaptchaKeyVersion" value="0" type="hidden">
   <div id="recaptcha_image" ></div><br/><hr/>
   
   <div  style="color:red"><%=actv %></div><div class="recaptcha-main">
    <label>
  <strong>
  <span id="recaptcha_instructions_image" class="recaptcha_only_if_image">
  Type the two pieces of text:
  </span>
  <span id="recaptcha_instructions_audio" class="recaptcha_only_if_audio">
  Type what you hear:
  </span>
  </strong>
  <span style="display: none;" id="recaptcha_challenge_field_holder"></span><input autocomplete="off" id="recaptcha_response_field" name="recaptcha_response_field" type="text">
  </label>
  <div class="recaptcha-buttons" align="right">
  <a id="recaptcha_reload_btn" href="javascript:Recaptcha.reload()" style="border-color: white;">
  <img src="images/reload.png" title="Get a new challenge" style="border-color: white;"/>
  </a>
  <a id="recaptcha_switch_audio_btn" class="recaptcha_only_if_image" href="javascript:Recaptcha.switch_type('audio');" style="border-color: white;">
  <img src="images/audio.png" title="Get an audio challenge" style="border-color: white;"/>
  </a>
  <a id="recaptcha_switch_img_btn" class="recaptcha_only_if_audio" href="javascript:Recaptcha.switch_type('image');" style="border-color: white;">
   <img src="images/text.png" title="Get a visual challenge"style="border-color: white;"/>
  </a>
  <a id="recaptcha_whatsthis_btn" href="javascript:Recaptcha.showhelp()" style="border-color: white;">
   <img src="images/help.png" title="Help" style="border-color: white;"/>
  </a>
  </div>
 </div></div>
 <script type="text/javascript"
   src="https://www.google.com/recaptcha/api/challenge?k=6Lfqa9oSAAAAAA1Lem6jbMzYnFeSOk8oDErxdlrF&amp;lang=en">
</script>
<noscript>
   <iframe src="https://www.google.com/recaptcha/api/noscript?k=6Lfqa9oSAAAAAA1Lem6jbMzYnFeSOk8oDErxdlrF"
       height="300" width="500" frameborder="0"></iframe><br>
   <textarea name="recaptcha_challenge_field" rows="3" cols="40">
   </textarea>
   <input type="hidden" name="recaptcha_response_field"
       value="manual_challenge">
</noscript> 
<br/><br/>
<input class="validate[required] checkbox" type="checkbox" id="agree" name="agree"/>I agree to the Encrustation <a href="#">Terms of Use </a> and <a href="#">Privacy Policy Statement</a>.<br/> 
<input type="submit" value="Sign up" class="btn" onclick="f(this.form);" id="submit"/>
					</fieldset>
				</form>


	</div>
	<div class="clearbottom"></div>
	<div id="footer">
		<p>Copyright &copy; 2012 encrustation.com - All rights reserved | <a href="homepage.jsp">Encrustation</a> </p>
			</div>
	</div>
</div>
</body>
</html>
