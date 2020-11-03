package com.liferay.docs.pagechangecolor.portlet.portlet;

import javax.portlet.Portlet;

import com.liferay.docs.changecolor.portlet.constants.ChangecolorPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

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
}