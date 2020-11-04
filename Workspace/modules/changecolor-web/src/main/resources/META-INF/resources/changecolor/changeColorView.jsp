<%@ include file="/init.jsp" %>

<script>
	function loadColor() {
		var savedVariable = localStorage.getItem(${userid} + "-color");
		if (savedVariable != null) {
			changeColor(savedVariable);
	    }
	}
	
	function saveColor(color, userid) {
		if (color !== "empty" && ${userid} != null) {
			localStorage.setItem(${userid} + "-color", color);
			changeColor(color);
		}
	}
	
	function changeElementColors(backgroundColor, textColor, elementClass) {
		var elements = document.getElementsByClassName(elementClass);
				
		for(let i = 0; i < elements.length; i++) {
			if (backgroundColor != null)
				elements[i].style.backgroundColor = backgroundColor;
			
			if (textColor != null)
				elements[i].style.color = textColor;
		}	
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
		  	case "purple":	
				textColor = "white";
				break;
		}
		
		document.body.style.background = backgroundColor;		
		
		document.getElementById('footer').style.backgroundColor = backgroundColor;
		
		changeElementColors(backgroundColor, null, 'navbar navbar-classic navbar-top py-3');
		
		changeElementColors(backgroundColor, null, 'navbar navbar-classic navbar-expand-md navbar-light pb-3');
			
		changeElementColors(null, textColor, 'text-truncate');

		changeElementColors(backgroundColor, textColor, 'portlet-content portlet-content-editable');

		changeElementColors(backgroundColor, textColor, 'portlet-content');

		changeElementColors(null, textColor, 'portlet-title-text portlet-title-editable');
		
		changeElementColors(null, textColor, 'portlet-title-text');
		
		changeElementColors(null, textColor, 'control-label');
		
		changeElementColors(backgroundColor, null, 'container');
											
		changeElementColors(null, textColor, 'taglib-icon-label');
		
	}
	
	window.onload=loadColor;
</script>


<% String userid = (String) request.getAttribute("userid"); %>

<aui:select name="color" id="colorDropdown" onchange="saveColor(this.value);">
	<option value="empty"> </option>
	<option value="default color">Default Color</option>
	<option value="match color">Match Color</option>
	<option value="blue">Blue</option>
	<option value="gold">Gold</option>
	<option value="green">Green</option>
	<option value="orange">Orange</option>
	<option value="hotpink">Pink</option>
	<option value="purple">Purple</option>
    <option value="red">Red</option>
</aui:select>