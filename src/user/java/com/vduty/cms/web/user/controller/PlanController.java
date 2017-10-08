package com.vduty.cms.web.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.vduty.cms.web.controller.BaseController;
import com.vduty.cms.web.user.entity.Plan;
import com.vduty.cms.web.user.service.PlanService;
import com.vduty.cms.web.utils.DatetimeUtils;

/**
 * 任务管理
 * @author luther
 *
 */
@Controller
@RequestMapping("/manageruser/user")
public class PlanController extends BaseController{
	
	@Autowired
	protected PlanService planService;
	
	@RequestMapping("/plan")
	public String getPlans(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			ModelMap modelMap){
		
		Subject subject = SecurityUtils.getSubject();//用户名称
		modelMap.put("title_name","计划");
		
		
		return "/user/userMgr/plan";
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/plan/add")
	public String addPlan(ModelMap modelMap)
	{	
		modelMap.put("title", "添加计划");
		
		return "/user/userMgr/addplan";
	}
	
	//添加保存
	@RequestMapping(method = RequestMethod.POST, value ="/plan/addsave")
	public String addSave(HttpServletRequest request, ModelMap modelMap)
	{
		logger.info("正要添加计划："+request.getParameter("title") );
		
		Plan plan = new Plan();
	    String alarmTypeStr = "0";
	    int alarmType = 0;
		if (request.getParameter("alarmType")!=null)
		{
			alarmTypeStr  = request.getParameter("alarmType");	
			alarmType = Integer.parseInt( alarmTypeStr.substring(0, 1));			
		}
		logger.info(alarmTypeStr);
		String title = request.getParameter("title");
		plan.setTitle(title);
		logger.info( "doTime:"+request.getParameter("doTime"));
		plan.setDoTime( DatetimeUtils.strToDate( request.getParameter("doTime"),"yyyy-MM-dd HH:mm:ss"));
		plan.setAlarmType( alarmType);
		int repeatType = Integer.parseInt( request.getParameter("repeatType").substring(0,1));
		
		plan.setRepeatType(repeatType);
	    plan.setRepeatWeaks( request.getParameter("repeatWeaks"));
	    long userId = Long.parseLong( SecurityUtils.getSubject().getSession().getAttribute("userId").toString());
	    plan.setUserId(userId);	    
		plan.setRepeatType(repeatType);		
		planService.addItem(plan);
		modelMap.put("title_name", title);
		
		modelMap.put("message", "保存记录成功" + plan.getTitle());
		return "/user/resultwindow";
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/plan/{id}")
	public String planInfo(@PathVariable int id, ModelMap modelMap)
	{			
		modelMap.put("planinfo", planService.planInfo(id));
		return "/user/userMgr/planinfo";		
	}
		
	
}
