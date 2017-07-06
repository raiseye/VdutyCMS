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
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.vduty.cms.web.admin.entity.Admin;

public class AdminRealm extends AuthorizingRealm {

	@Autowired
	private AdminMgrService adminService;

	/**
	*/
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
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
		setSession("currentUser", admin.getName());
		setSession("currenUserID", admin.getAdminId());
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
