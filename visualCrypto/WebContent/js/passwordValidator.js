function passwordStrength(password)

{

        var desc = new Array();

        desc[0] = "<div style='color:#cccccc'>Very Weak </div>";

        desc[1] = "<div style='color:#ff0000'>Weak</div>";

        desc[2] = "<div style='color:#ff7f7f'>Better</div>";

        desc[3] = "<div style='color:#56e722'>Medium</div>";

        desc[4] = "<div style='color:#4dcd22'>Strong</div>";

        desc[5] = "<div style='color:#399822'>Strongest</div>";



        var score   = 0;



        //if password bigger than 4 give 1 point

        if (password.length > 4) score++;



        //if password has both lower and uppercase characters give 1 point      

        if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;



        //if password has at least one number give 1 point

        if (password.match(/\d+/)) score++;



        //if password has at least one special caracther give 1 point

        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;



        //if password bigger than 8 give another 1 point

        if (password.length > 8) score++;
	





         document.getElementById("passwordDescription").innerHTML = desc[score];

         document.getElementById("passwordStrength").className = "strength" + score;
var meter=(score*50)+"px";
$("#passwordStrength").animate({width:meter});

}
