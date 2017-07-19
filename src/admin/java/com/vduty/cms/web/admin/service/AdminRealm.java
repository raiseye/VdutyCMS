package com.vduty.cms.web.admin.service;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.druid.util.StringUtils;
import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.shiro.utils.LoginType;

public class AdminRealm extends AuthorizingRealm {

	@Autowired
	private AdminMgrService adminService;

	/**
	*/
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		String realmname = principals.getRealmNames().iterator().next();
		if (realmname.contains(LoginType.USER.toString()))
		{
			return null;
			
		}
		 //用户名    
        String username = (String) principals.fromRealm(getName()).iterator().next(); 
        System.out.println("AuthorizationInfo "+username);
        //根据用户名来添加相应的权限和角色  
        if(!StringUtils.isEmpty(username)){  
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();  
//            addPermission(username,info);  
//            addRole(username, info);  
            info.addRole("admin");
            //System.out.println("AuthorizationInfo info role "+info.getRoles().iterator().next().toString());
            
            return info;  
        }  
       
		return null;
	}

	/**
	 当adminlogincontroller 的subject.login被调用是本方法被调用
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String adminName = token.getUsername();
		Admin admin = adminService.getAdminByName(adminName);
		if (null == admin) { 
			return null;
		}
		if (!admin.getPassword().equals(new String(token.getPassword()))) {
			return null;
		}
		AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(admin.getName(), admin.getPassword(), getName());
		
		setSession("currentAdmin", admin.getName());
		setSession("currenAdminID", admin.getAdminId());
		
		return authcInfo;
	}

	/** 
	
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}
