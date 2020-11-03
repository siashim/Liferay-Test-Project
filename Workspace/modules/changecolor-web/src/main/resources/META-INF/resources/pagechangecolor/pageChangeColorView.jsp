<%@ include file="/init.jsp" %>


<script>
	function loadColor() {
		var savedVariable = localStorage.getItem("color");
		if (savedVariable != null) {
			changeColor(savedVariable);
	    }
	}
		
	function changeElementColors(backgroundColor, textColor, elementClass) {
		var elements = document.getElementsByClassName(elementClass);
				
		for(var i = 0; i < elements.length; i++){
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
		
		changeElementColors(backgroundColor, null, 'management-bar management-bar-light navbar navbar-expand-md');
									
		changeElementColors(null, textColor, 'taglib-icon-label');

	}
	
	window.onload=loadColor;
</script>


<div hidden></div>
