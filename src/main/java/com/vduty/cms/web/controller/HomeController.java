package com.vduty.cms.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vduty.cms.quartz.task.WebRunLog;
import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.service.AdminMgrService;
import com.vduty.cms.web.utils.DatetimeUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static Scheduler scheduler = null;
	/**
	 * Simply selects the home view to render by returning its name.
	 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws SchedulerException {
		logger.info("Welcome home! The client locale is {}.", locale);
		 /* 注册定时任务 */
        try {
        System.out.println("--"+DatetimeUtils.getNowDate());	
            // 获取Scheduler实例
            scheduler = StdSchedulerFactory.getDefaultScheduler();
            scheduler.start();

            // 具体任务
            JobDetail job = JobBuilder.newJob(WebRunLog.class).withIdentity("job1", "group1").build();

            // 触发时间点
            SimpleScheduleBuilder simpleScheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                    .withIntervalInSeconds(5).repeatForever();
            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger1", "group1")
                    .startNow().withSchedule(simpleScheduleBuilder).build();

            // 交由Scheduler安排触发
           // scheduler.scheduleJob(job, trigger);
            
            this.logger.info("The scheduler register...");
            
        } catch (SchedulerException se) {
            logger.error(se.getMessage(), se);
        }
		
        
        
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("title_name", "太太聊聊吧");
		logger.info("网站成功进入!");
		
		return "main/index";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homepage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/index/{id}", method = RequestMethod.GET)
	public String index(@PathVariable String id, Locale locale, Model model) {
		logger.info("Welcome home index! The client locale is {}.", locale);

		Admin admin = adminService.getAdminByName(id);

		model.addAttribute("serverTime", admin.getPassword());

		return "home";
	}

}
