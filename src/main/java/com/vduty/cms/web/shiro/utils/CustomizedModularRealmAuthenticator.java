package com.vduty.cms.web.shiro.utils;
import java.util.ArrayList;
import java.util.Collection;

import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import java.util.Collection;
import java.util.Map;
import org.apache.shiro.util.CollectionUtils;


/**
 * @author Alan_Xiang 
 * 自定义Authenticator
 * 注意，当需要分别定义处理普通用户和管理员验证的Realm时，对应Realm的全类名应该包含字符串“User”，或者“Admin”。
 * 并且，他们不能相互包含，例如，处理普通用户验证的Realm的全类名中不应该包含字符串"Admin"。
 */
public class CustomizedModularRealmAuthenticator extends ModularRealmAuthenticator {

	 private Map<String, Object> definedRealms;

	    /**
	     * 多个realm实现
	     */
	    @Override
	    protected AuthenticationInfo doMultiRealmAuthentication(Collection<Realm> realms, AuthenticationToken token) {
	        return super.doMultiRealmAuthentication(realms, token);
	    }
	    /**
	     * 调用单个realm执行操作
	     */
	    @Override
	    protected AuthenticationInfo doSingleRealmAuthentication(Realm realm,AuthenticationToken token) {

	        // 如果该realms不支持(不能验证)当前token
	        if (!realm.supports(token)) {
	            throw new ShiroException("token错误!");
	        }
	        AuthenticationInfo info = null;
	        try {
	            info = realm.getAuthenticationInfo(token);

	            if (info == null) {
	                throw new ShiroException("token不存在!");
	            }
	        } catch (Exception e) {
	            throw new ShiroException("用户名或者密码错误!");
	        }
	        return info;
	    }


	    /**
	     * 判断登录类型执行操作
	     */
	    @Override
	    protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken)throws AuthenticationException {
	    	System.out.print("CustomizedModularRealmAuthenticator doAuthenticate");
	        this.assertRealmsConfigured();
	        Realm realm = null;
	        CustomizedToken token = (CustomizedToken) authenticationToken;
	        //判断是否是后台用户
//	        if (token.getUsertype().equals("student")) {
//	            realm = (Realm) this.definedRealms.get("studentRealm");
//	        }
//	        else{
//	            realm = (Realm) this.definedRealms.get("dormAdminRealm");
//	        }
	        for(Object myrealm: this.definedRealms.values())
	        {
	        	Realm _realm = (Realm)myrealm;
	        	if (_realm.getClass().getName().contains(token.getLoginType()))
	        	{
	        		realm = _realm;
	        		break;
	        	}
	        }
	       System.out.println("  cur realm is:" + realm.getName());
	        return this.doSingleRealmAuthentication(realm, authenticationToken);
	    }

	    /**
	     * 判断realm是否为空
	     */
	    @Override
	    protected void assertRealmsConfigured() throws IllegalStateException {
	    	System.out.print("CustomizedModularRealmAuthenticator assertRealmsConfigured");
	        this.definedRealms = this.getDefinedRealms();
	        if (CollectionUtils.isEmpty(this.definedRealms)) {
	        	System.out.print("CustomizedModularRealmAuthenticator assertRealmsConfigured definedRealms空错误!");
	            throw new ShiroException("definedRealms空错误!");
	        }
	    }

	    public Map<String, Object> getDefinedRealms() {
	        return this.definedRealms;
	    }

	    public void setDefinedRealms(Map<String, Object> definedRealms) {
	        this.definedRealms = definedRealms;
	    }


}