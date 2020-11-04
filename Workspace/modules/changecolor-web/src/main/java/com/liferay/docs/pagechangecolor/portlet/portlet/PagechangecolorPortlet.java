package com.liferay.docs.pagechangecolor.portlet.portlet;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.docs.changecolor.portlet.constants.ChangecolorPortletKeys;

import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;

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
		"javax.portlet.display-name=Pagechangecolor",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/pagechangecolor/pageChangeColorView.jsp",
		"javax.portlet.name=" + ChangecolorPortletKeys.PAGECHANGECOLOR,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class PagechangecolorPortlet extends MVCPortlet {
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		
		ThemeDisplay themeDisplay = (ThemeDisplay)renderRequest.getAttribute(WebKeys.THEME_DISPLAY);

		User currentUser = themeDisplay.getRealUser(); 
		
		String UserID = Long.toString(currentUser.getUserId());
		
		renderRequest.setAttribute("userid", UserID);		
		
	    super.doView(renderRequest, renderResponse);
	}
}