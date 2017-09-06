package com.vduty.cms.web.admin;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vduty.cms.web.controller.BaseController;
import com.vduty.cms.web.admin.controller.AdminBaseController;
import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.entity.vo.JsonVo;
import com.vduty.cms.web.admin.exception.ValidateException;
import com.vduty.cms.web.admin.service.AdminMgrService;
import com.vduty.cms.web.constant.SystemConstant;
import com.vduty.cms.web.utils.MD5Utils;

/**
 * 管理员管理
 * @author lee
 *
 */
@Controller
@RequestMapping("/manageradmin/admin")
public class AdminMgrController extends AdminBaseController{
	
	@RequestMapping
	public String showAdminMgr(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			ModelMap modelMap){
		modelMap.put("active_admin", "active");
		modelMap.put("pageVo", adminService.getAllListPage(pageNum));
		return "admin/adminMgr/main";
	}
	
	/**
	 * 添加管理员
	 * @param name
	 * @param pwd
	 * @return JsonVo<String>
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public JsonVo<String> addNewAdmin(@RequestParam("name") String name,
			@RequestParam("password") String pwd){
		JsonVo<String> result = new JsonVo<String>();
		Admin admin = adminService.getAdminByName(name);
		if (null != admin){
			result.getErrors().put("name", "管理员名称不能重复");
		} 
		if (StringUtils.isEmpty(name)){
			result.getErrors().put("name", "管理员名称不能为空");
		}
		if (StringUtils.isBlank(pwd)){
			result.getErrors().put("password", "管理员密码不能为空");
		} else if (pwd.length() < SystemConstant.MIN_PASSWORD_LENGTH){
			result.getErrors().put("password", "密码不能小于"+SystemConstant.MIN_PASSWORD_LENGTH+"位");
		} else if (pwd.length() > SystemConstant.MAX_PASSWORK_LENGTH){
			result.getErrors().put("password", "密码不能大于"+SystemConstant.MAX_PASSWORK_LENGTH+"位");
		}
		try {
			validate(result);
			name.trim();
			adminService.addAdmin(name, pwd);
			result.setResult(true);
		} catch (Exception e) {
			result.setResult(false);
			result.setMsg(e.getMessage());
		}
		return result;	
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public JsonVo<String> updateCurrAdmin(@RequestParam("pwd") String newPwd){
		JsonVo<String> result = new JsonVo<String>();
		int adminId = (Integer) SecurityUtils.getSubject().getSession().getAttribute("currenUserID");
		try {
			String pwd = MD5Utils.encrypt(newPwd);
			adminService.updateAdminPwdById(adminId,pwd);
			result.setResult(true);
		} catch (Exception e){
			result.setResult(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 删除管理员
	 * @param adminId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public JsonVo<String> delAdmin(@RequestParam("adminId") long adminId){
		JsonVo<String> result = new JsonVo<String>();
		try {
			adminService.delAdminById(adminId);
			result.setResult(true);
		} catch (Exception e){
			result.setResult(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
	
}
