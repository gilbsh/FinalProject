

function disableValues(event) {
	document.getElementById("ruleLowValue").style.display="inline";
	document.getElementById("ruleHighValue").style.display="inline";
	document.getElementById("ruleLowValue").value = "0"
	document.getElementById("ruleHighValue").value = "0"
	document.getElementById("ruleHighValueLable").style.display = "inline";
	document.getElementById("ruleLowValueLable").style.display = "inline";
	document.getElementById("ruleLowValueLable").innerHTML="Low Value";
	
    if(this.options[this.selectedIndex].text=='>'){
    	document.getElementById("ruleLowValue").style.display  = "none";
    	document.getElementById("ruleLowValueLable").style.display  = "none";
    	
    }
    else if(this.options[this.selectedIndex].text=='<'){
    	document.getElementById("ruleHighValue").style.display  = "none";
    	document.getElementById("ruleHighValueLable").style.display  = "none";
    	
    }
    else if(this.options[this.selectedIndex].text=='%'){
    	document.getElementById("ruleHighValue").style.display  = "none";
    	document.getElementById("ruleHighValueLable").style.display  = "none";
    	document.getElementById("ruleLowValueLable").innerHTML="Modulo";
    }
    
}


$(document).ready(function() {
    $('#chooseVehicle').multiselect({
        enableFiltering: true,
        enableClickableOptGroups: true
    });
    
    $('.selectpicker').selectpicker({
        size: 4
    });
});


$(document).ready(function() {	    	
    $('.multiSelection').each(
    	function(){
    		$(this).multiselect({
       		includeSelectAllOption: true,
        	enableFiltering: true
   		 })
   		});
    
    $('.selectpicker').selectpicker({
        size: 4
    });
});

