package com.vduty.cms.web.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.entity.vo.JsonVo;
import com.vduty.cms.web.admin.exception.ValidateException;
import com.vduty.cms.web.constant.SystemConstant;
import com.vduty.cms.web.user.entity.RequestJsonResult;
import com.vduty.cms.web.user.entity.User;
import com.vduty.cms.web.user.service.UserMgrService;
import com.vduty.cms.web.utils.JsonUtils;
import com.vduty.cms.web.admin.service.AdminMgrService;

@Controller
public class UserBaseController {
	
	protected final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected UserMgrService userService;
	
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
	protected User getUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(
				SystemConstant.SESSION_USER);
		return user;
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
