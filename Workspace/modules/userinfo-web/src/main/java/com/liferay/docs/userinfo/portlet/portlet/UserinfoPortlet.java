package com.liferay.docs.userinfo.portlet.portlet;

import com.liferay.docs.userinfo.portlet.constants.UserinfoPortletKeys;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;

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

		User user = themeDisplay.getRealUser(); 	
		String[] userInfo = new String[4];
		String output = "";

		userInfo[0] = "User ID: " + Long.toString(user.getUserId());
		userInfo[1] = "Email: " + user.getEmailAddress();
		userInfo[2] = "Name: " + user.getFullName();
		userInfo[3] = "Screen Name: " + user.getScreenName();

		for (String line : userInfo) {
			output += line + "<br/>";
		}
			
		renderRequest.setAttribute("info", output);    
	    super.doView(renderRequest, renderResponse);
	}
}