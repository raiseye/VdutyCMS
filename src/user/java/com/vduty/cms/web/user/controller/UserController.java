package com.vduty.cms.web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.web.util.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vduty.cms.web.controller.BaseController;
import com.vduty.cms.web.shiro.utils.CustomizedToken;
import com.vduty.cms.web.shiro.utils.LoginType;
import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.entity.vo.JsonVo;
import com.vduty.cms.web.utils.ApplicationContextHandle;
import com.vduty.cms.web.utils.MD5Utils;

/**
 * 
 * @author luther
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	/**
	 * 登录
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String showLoginView(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {

		logger.info("user login");
		logger.error("user login errorlogtest");
		// System.out.println(org.apache.shiro.web.util.WebUtils.getSavedRequest(request).getRequestUrl());
		SavedRequest sr = org.apache.shiro.web.util.WebUtils.getSavedRequest(request);//获取原来要访问的网站
		//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	
		modelMap.put("title_name","用户登录");
		if (sr != null) {
			String saveUrl = sr.getRequestUrl();
			
			System.out.println("serveUrl:" + saveUrl);
//			System.out.println(basePath+"/manageruser/user");
//			System.out.println(basePath+"/manageradmin/admin");
			if (saveUrl != null && !saveUrl.equals("")) {				
				System.out.println(saveUrl.indexOf("/manageruser/user"));
				if (saveUrl.indexOf("/manageruser/user") >= 0) {
					
				
					
					return "user/login";//返回用户的登录view
				}
				System.out.println(saveUrl.indexOf("/manageradmin/admin"));
				if (saveUrl.indexOf("/manageradmin/admin") >= 0) {
				
					return "admin/login";//返回管理员的view
				}
			}
		}
		else
		{
			System.out.println("refer url is null!");
		}
		System.out.println(this.getClass());	
		return "user/login";
	}

	/**
	 * 登录验证
	 * 
	 * @param name
	 * @param password
	 * @param attr
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login/validate", method = RequestMethod.POST)
	public JsonVo<Admin> userLogin(@RequestParam("name") String name, @RequestParam("password") String password,
			RedirectAttributes attr) {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
		JsonVo<Admin> result = new JsonVo<Admin>();
		try {
			// org.apache.shiro.subject,
			SecurityUtils.getSubject()
					.login(new CustomizedToken(name, MD5Utils.encrypt(password), LoginType.USER.toString()));
			result.setResult(true);
			
			return result;
		} catch (AuthenticationException e) {
			result.setMsg("user's name or passwrod error!");
			result.setResult(false);
			return result;
		}
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public String userLogout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/user/login";
	}

}
