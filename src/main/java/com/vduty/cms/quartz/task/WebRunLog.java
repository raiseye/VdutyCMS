package com.vduty.cms.quartz.task;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.vduty.cms.web.admin.service.AdminMgrService;
import com.vduty.cms.web.controller.HomeController;
import com.vduty.cms.web.utils.ApplicationContextHandle;

public class WebRunLog  implements Job {

	/*@Autowired
	private AdminMgrService adminService;*/
	private static final AdminMgrService adminService  = (AdminMgrService)ApplicationContextHandle.getBean(AdminMgrService.class); 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		//logger.info("new log qqqqqqqqqqqqqqqqqqqq "+ DatetimeUtils.getNowDate());
		if (adminService != null){
			logger.info("quartz job execute saveWebLog");
		adminService.saveWebLog("new log qqqqqqqqqqqqqqqqqqq");}
		else
			{
		
			System.out.println("adminService is null");
			
			
			}
	}
   
}
