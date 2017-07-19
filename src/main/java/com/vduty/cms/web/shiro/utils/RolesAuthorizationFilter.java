package com.vduty.cms.web.shiro.utils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.util.SavedRequest;

public class RolesAuthorizationFilter extends AuthorizationFilter{  
	  
    @Override  
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)  
            throws Exception { 
    	
    	SavedRequest sr = org.apache.shiro.web.util.WebUtils.getAndClearSavedRequest(request);
    	if (sr != null) {
			String saveUrl = sr.getRequestUrl();
			 System.out.print("\r\nsaveUrl:"+saveUrl+"\r\n");
			 
    	}
        Subject subject = getSubject(request, response); 
        System.out.print("getPrincipal:"+(String)subject.getPrincipal()+"\r\n"); 
        String[] rolesArray = (String[]) mappedValue;   
  
        if (rolesArray == null || rolesArray.length == 0) {   
            //no roles specified, so nothing to check - allow access.   
            return true;   
        }   
  
        for(int i=0;i<rolesArray.length;i++){  
        	System.out.println("\r\ncurrole:" + rolesArray[i]+"\r\n"); 
        	
            if(subject.hasRole(rolesArray[i])){    
                return true;    
            } 
            
           
            	
        } 
      
        
        System.out.println("\r\nisAccessAllowed false:\r\n"); 
        
        
        return false;    
    }  
}
  
