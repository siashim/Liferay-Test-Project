<%@ include file="/init.jsp" %>


<script>
	function loadColor() {
		var savedVariable = localStorage.getItem("color");
		if (savedVariable != null) {
			changeColor(savedVariable);
	    }
	}
	
	function saveColor(color) {
		localStorage.setItem("color", color);
		changeColor(color);
	}
	
	function changeColor(color) {		
		
		var textColor = "";
		var backgroundColor = color;
		
		switch(backgroundColor) {
			case "match color":
				textColor = "white"
			  	backgroundColor = "#393A4A";
		    	break;
		  	case "default color":
			  	backgroundColor = "";
		    	break;
		  	case "green":
		  	case "blue":
				textColor = "white";
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
			
		var editablePortletElements = document.getElementsByClassName('portlet-content portlet-content-editable');
		
			for(var i = 0; i < editablePortletElements.length; i++){
				editablePortletElements[i].style.backgroundColor = backgroundColor;
				editablePortletElements[i].style.color = textColor;
			}
			
		var portletElements = document.getElementsByClassName('portlet-content');
			
			for(var i = 0; i < portletElements.length; i++){
				portletElements[i].style.backgroundColor = backgroundColor;
				portletElements[i].style.color = textColor;
			}
			
		var editablePortletTextElements = document.getElementsByClassName('portlet-title-text portlet-title-editable');
			
			for(var i = 0; i < editablePortletTextElements.length; i++){
				editablePortletTextElements[i].style.color = textColor;
			}
			
		var PortletTextElements = document.getElementsByClassName('portlet-title-text');
			
			for(var i = 0; i < PortletTextElements.length; i++){
				PortletTextElements[i].style.color = textColor;
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
	
	window.onload=loadColor;
</script>



<aui:select name="color" id="colorDropdown" onchange="saveColor(this.value);">
	<option value="default color"> </option>
	<option value="default color">Default Color</option>
	<option value="match color">Match Color</option>
    <option value="red">Red</option>
    <option value="blue">Blue</option>
    <option value="orange">Orange</option>
    <option value="green">Green</option>		
</aui:select>