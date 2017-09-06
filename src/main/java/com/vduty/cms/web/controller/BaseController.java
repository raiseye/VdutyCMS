package com.vduty.cms.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.entity.vo.JsonVo;
import com.vduty.cms.web.admin.exception.ValidateException;
import com.vduty.cms.web.constant.SystemConstant;
import com.vduty.cms.web.user.entity.RequestJsonResult;
import com.vduty.cms.web.utils.JsonUtils;
import com.vduty.cms.web.admin.service.AdminMgrService;

@Controller
public class BaseController {
	
	protected final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected AdminMgrService adminService;
	
	/**
	 * 参数校验
	 * 
	 * @param json
	 *            json数据Bean
	 * @throws ValidateException
	 */
	protected <T> void validate(JsonVo<T> json) throws ValidateException {
		if (json.getErrors().size() > 0) {
			json.setResult(false);
			throw new ValidateException("有错误发生");
		} else {
			json.setResult(true);
		}
	}

	/**
	 * 从session中获得管理员的信息
	 * 
	 * @param request
	 * @return
	 */
	protected Admin getAdmin(HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute(
				SystemConstant.SESSION_ADMIN);
		return admin;
	}
	/**
	 * 返回json
	 * @param errcode
	 * @param msg
	 * @return
	 */
	protected String returnJsonResult(Integer errcode,String msg)
	{
		RequestJsonResult result = new RequestJsonResult(errcode,msg);
		String re = "";
		re = JsonUtils.toJsonStr(result);
		return re;
		
	}
}
