<%@ include file="../init.jsp" %>

<portlet:renderURL var="viewURL">
    <portlet:param name="mvcPath" value="/newaccount/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="addEntry" var="addEntryURL" />

<aui:form action="<%= addEntryURL %>" name="<portlet:namespace />fm">

	<aui:fieldset>

		<aui:input name="first name" />
		<aui:input name="last name" />
		<aui:input name="screen name" />
		<aui:input name="email">
			<aui:validator name="email" />
	  	</aui:input>
	  	<aui:input name="password" type="password" />
		<aui:select name="gender">
    		<option value="M">Male</option>
    		<option value="F">Female</option>
  		</aui:select>
		<aui:input name="date of birth" type="date">
			<aui:validator name="date" />
		</aui:input>

	</aui:fieldset>

	<aui:button-row>

		<aui:button type="submit"></aui:button>
		<aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>

	</aui:button-row>
</aui:form>
