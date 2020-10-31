<%@ include file="/init.jsp" %>

<portlet:renderURL var="addEntryURL">
    <portlet:param name="mvcPath" value="/newaccount/add_entry.jsp"></portlet:param>
</portlet:renderURL>


<aui:button-row>
    <aui:button onClick="<%= addEntryURL.toString() %>" value="Create User"></aui:button>
</aui:button-row>