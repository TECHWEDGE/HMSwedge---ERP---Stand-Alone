package ERPHO.viewcontroller;


import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import ERPHO.dao.impl.controllerDao;
import ERPHO.model.Branch;
import ERPHO.model.License;
import ERPHO.model.Session;

@Controller

public class Logincontroller {
	@Autowired
	controllerDao dao;
	@Autowired
	private Session session;

	
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(HttpServletRequest request,Principal principal,Authentication authentication ) throws Exception {
    	List<License> list = dao.getLusers();
 	    List<Branch> list2 = dao.getBranch(); 
 	    
 	   Map<String,Object> model = new HashMap<String, Object>();
 	  model.put("list", list); 
 	  model.put("list2", list2);
		/*
		 *  try{ License license =
		 * LicenseManager.decryptLicense(list.get(0).getLckey());
		 * list.get(0).setCompanyName(license.getCompanyName());
		 * list.get(0).setEmailId(license.getEmailId());
		 * 
		 * License license1 = LicenseManager.decryptLicense(list.get(0).getLckey());
		 * Date expirationDate = null; Date date = new
		 * Date(license1.getExpirationDate()); SimpleDateFormat format1 = new
		 * SimpleDateFormat("dd-MM-yyyy"); list.get(0).setExpiry(format1.format(date));
		 * } catch(IndexOutOfBoundsException exception) { System.out.println(exception);
		 * }
		 */
        return new ModelAndView("loginpage","model",model);
    }
   
    
    
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
	    public ModelAndView welcome(HttpServletRequest request,Principal principal,Authentication authentication,Model model) throws IOException {
	    	authentication.getAuthorities();
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String userRole = var.toString();
	    	if(userRole.contains("[ROLE_PHARMACIST]") || userRole.contains("[ROLE_DISPPHARMACIST]")){
	        	RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/ERP/hmspharma.html");
		        return new ModelAndView(redirectView); 
	        }
	        else if(userRole.contains("[ROLE_SALESMANAGER]") || userRole.contains("[ROLE_DISPSALESMANAGER]")){
	        	RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/ERP/hmspharma1.html");
		        return new ModelAndView(redirectView); 
	        }
	    	else{
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("/ERP/hmspharma.html");
		        return new ModelAndView(redirectView); 
	    	}
	    }

	
    @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
    public ModelAndView logoutSuccessfulPage(Model model) {
        model.addAttribute("title", "Logged out Successfully!");
        return new ModelAndView("logoutSuccessfulPage"); 
    }
    
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
        
        if (principal != null) {
            model.addAttribute("message", "Hi " + principal.getName()
                    + "<br> You do not have permission to access this page!");
        } else {
            model.addAttribute("msg",
                    "You do not have permission to access this page!");
        }
        return "403Page";
    }
    
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error(Model model)
    {
    	model.addAttribute("message", "Not able to open. File not found or corrupted");
		return "error";
    }

    
      
}
