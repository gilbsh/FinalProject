

function disableValues(event) {
	document.getElementById("ruleLowValue").style.display="inline";
	document.getElementById("ruleHighValue").style.display="inline";
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