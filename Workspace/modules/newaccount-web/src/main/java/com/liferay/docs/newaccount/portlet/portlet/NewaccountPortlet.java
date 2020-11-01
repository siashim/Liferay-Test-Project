package com.liferay.docs.newaccount.portlet.portlet;

import com.liferay.docs.newaccount.portlet.constants.NewaccountPortletKeys;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.service.ServiceContext;
import com.liferay.portal.kernel.service.ServiceContextFactory;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;

import java.util.Calendar;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;

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
		"javax.portlet.display-name=Newaccount",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/newaccount/view.jsp",
		"javax.portlet.name=" + NewaccountPortletKeys.NEWACCOUNT,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class NewaccountPortlet extends MVCPortlet {
	public void addEntry(ActionRequest request, ActionResponse response)
            throws PortalException {
		
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);

		User user = themeDisplay.getRealUser(); 

		long[] groupID = new long[1];
		long[] roleID = new long[1];

		groupID[0] = themeDisplay.getScopeGroupId();
		ServiceContext serviceContext = ServiceContextFactory.getInstance(User.class.getName(), request);
		
        String firstName = ParamUtil.getString(request, "first name");
        String lastName = ParamUtil.getString(request, "last name");
        String screenName = ParamUtil.getString(request, "screen name");
        String email = ParamUtil.getString(request, "email");
        String password = ParamUtil.getString(request, "password");
        String dob = ParamUtil.getString(request, "date of birth");
        String gender = ParamUtil.getString(request, "gender");

        String[] dobData = dob.split("-");
        
        Calendar cal = Calendar.getInstance();
        cal.set(Integer.parseInt(dobData[0]), Integer.parseInt(dobData[1]), Integer.parseInt(dobData[2]));
        cal.add(Calendar.MONTH, -1);
                
        try { 
        	UserLocalServiceUtil.addUser(user.getUserId(), themeDisplay.getCompanyId(), false, password, password, false,
        			screenName, email, 0, "",  LocaleUtil.US, firstName, "", lastName, 0, 0, gender.equals("M"), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH),
        			cal.get(Calendar.YEAR), "", groupID, user.getOrganizationIds(), roleID, user.getUserGroupIds(), false, serviceContext);
		  } 
		  catch (PortalException e) {
	            System.out.println(e);   
		  }
	}
}