package com.vduty.cms.web.admin;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vduty.cms.web.controller.BaseController;
import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.entity.vo.JsonVo;
import com.vduty.cms.web.utils.MD5Utils;

/**
 * 
 * @author luther
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController{    
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("/login")
	public String showLoginView(){
		return "admin/login";
	}
	
	/**
	 *登录验证
	 * @param name
	 * @param password
	 * @param attr
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login/validate", method = RequestMethod.POST)
	public JsonVo<Admin> adminLogin(@RequestParam("name") String name, 
			@RequestParam("password") String password, RedirectAttributes attr){
		JsonVo<Admin> result = new JsonVo<Admin>();
		try {
			//org.apache.shiro.subject,
			SecurityUtils.getSubject().login(new UsernamePasswordToken(name,
					MD5Utils.encrypt(password)));
			result.setResult(true);
			return result;
		} catch (AuthenticationException e){
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
	public String adminLogout(){
		SecurityUtils.getSubject().logout();
		return "redirect:/admin/login";
	}
	

}
