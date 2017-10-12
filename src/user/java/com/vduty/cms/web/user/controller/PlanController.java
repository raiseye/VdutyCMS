package com.vduty.cms.web.user.controller;

import java.util.List;

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
	public String getPlans(@RequestParam(value = "p", defaultValue = "0") int pageNum,
			ModelMap modelMap){
		
		Subject subject = SecurityUtils.getSubject();//用户名称
		modelMap.put("title_name","计划");
		long userId = Long.parseLong( SecurityUtils.getSubject().getSession().getAttribute("userId").toString());
		List<Plan> plans = planService.getPlans(userId, pageNum, 20);
		logger.info("plans:" + plans.size());
		modelMap.put("planlist",plans);
		
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
		int repeatType = Integer.parseInt( request.getParameter("repeatType").substring(0,1));
		String doTime = request.getParameter("doTime");
		logger.info( "doTime:"+ doTime);
		if (repeatType ==1 || repeatType ==0 )//一次和每天
		{
			doTime = request.getParameter("doTime");
			doTime = "1971-01-01 " + doTime + ":00";
		}
		else
		{
			doTime =  request.getParameter("doTime1");doTime = doTime + ":00";
		}
		logger.info(doTime);
		plan.setDoTime( DatetimeUtils.strToDate( doTime,"yyyy-MM-dd HH:mm:ss"));
		plan.setAlarmType( alarmType);
				
		plan.setRepeatType(repeatType);
		logger.info("repeatWeaks:" + request.getParameter("repeatWeaks"));
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
	
	@RequestMapping(method = RequestMethod.GET, value = "/plan/{pageindex}/{pagesize}")
	public String getPlans(@PathVariable int pageindex, @PathVariable int pagesize, ModelMap modelMap)
	{			
		long userId = Long.parseLong( SecurityUtils.getSubject().getSession().getAttribute("userId").toString());
		List<Plan> plans = planService.getPlans(userId, pageindex, pagesize);
		modelMap.put("planlist",plans);
		return "/user/userMgr/plan";		
	}
		
	
}
