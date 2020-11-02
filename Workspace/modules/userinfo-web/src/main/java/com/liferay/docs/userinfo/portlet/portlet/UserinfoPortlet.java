package com.liferay.docs.userinfo.portlet.portlet;

import com.liferay.docs.userinfo.portlet.constants.UserinfoPortletKeys;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;
import java.util.Calendar;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author Siavash
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=false",
		"javax.portlet.display-name=Userinfo",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/userinfo/view.jsp",
		"javax.portlet.name=" + UserinfoPortletKeys.USERINFO,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class UserinfoPortlet extends MVCPortlet {
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse)  throws IOException, PortletException {
		ThemeDisplay themeDisplay = (ThemeDisplay)renderRequest.getAttribute(WebKeys.THEME_DISPLAY);

		User currentUser = themeDisplay.getRealUser(); 	
		String[] userInfo = new String[6];
		String output = "";

		userInfo[0] = "User ID: " + Long.toString(currentUser.getUserId());
		userInfo[1] = "Email: " + currentUser.getEmailAddress();
		userInfo[2] = "Name: " + currentUser.getFullName();
		userInfo[3] = "Screen Name: " + currentUser.getScreenName();
		
		try {			
			Calendar cal = Calendar.getInstance();
			cal.setTime(currentUser.getBirthday());
			
			userInfo[4] = "Date of Birth: " + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH) + "/" + cal.get(Calendar.YEAR) ;
			userInfo[5] = "Gender: " +  (currentUser.getMale() ? "Male" : "Female");
		}
		catch (PortalException e) {
            System.out.println(e);   
		}

		for (String line : userInfo) {
			output += line + "<br/>";
		}
			
		renderRequest.setAttribute("info", output);    
	    super.doView(renderRequest, renderResponse);
	}
}