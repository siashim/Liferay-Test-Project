<%@ include file="/init.jsp" %>


<script>
function changeColor(backgroundColor) {
	
	var textColor = "white";
	
	switch(backgroundColor) {
	  case "match color":
		  backgroundColor = "#393A4A";
	    break;
	  case "default color":
		  backgroundColor = "";
		  textColor = "";
	    break;
	}
	
	document.body.style.background = backgroundColor;
	
	document.getElementById('footer').style.backgroundColor = backgroundColor;
	
	var navbarTopElements = document.getElementsByClassName('navbar navbar-classic navbar-top py-3');
	
		for(var i = 0; i < navbarTopElements.length; i++){
			navbarTopElements[i].style.backgroundColor = backgroundColor;
		}
		
	var navbarLightElements = document.getElementsByClassName('navbar navbar-classic navbar-expand-md navbar-light pb-3');
	
		for(var i = 0; i < navbarLightElements.length; i++){
			navbarLightElements[i].style.backgroundColor = backgroundColor;
		}
	
	var textTruncateElements = document.getElementsByClassName('text-truncate');
	
		for(var i = 0; i < textTruncateElements.length; i++){
			textTruncateElements[i].style.color = textColor;
		}
		
	var portletElements = document.getElementsByClassName('portlet-content portlet-content-editable');
	
		for(var i = 0; i < portletElements.length; i++){
			portletElements[i].style.backgroundColor = backgroundColor;
			portletElements[i].style.color = textColor;
		}
		
	var fieldLabelElements = document.getElementsByClassName('control-label');
	
		for(var i = 0; i < fieldLabelElements.length; i++){
			fieldLabelElements[i].style.color = textColor;
		}
		
	var containerElements = document.getElementsByClassName('container');
		
		for(var i = 0; i < containerElements.length; i++){
			containerElements[i].style.backgroundColor = backgroundColor;
		}
}
</script>

<aui:select name="color" onchange="changeColor(this.value);">
	<option value="default color">Default Color</option>
	<option value="match color">Match Color</option>
    <option value="red">Red</option>
    <option value="blue">Blue</option>
    <option value="orange">Orange</option>
    <option value="green">Green</option>		
</aui:select>