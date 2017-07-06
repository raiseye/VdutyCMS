package com.vduty.cms;

//import org.apache.catalina.core.ApplicationContext;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.service.AdminMgrService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml" })
public class Junittest {

	@Autowired
	protected AdminMgrService adminService;
	private static final Logger logger = Logger.getLogger(Junittest.class);

	@Test
	public void test1() {
		System.out.println("hello , my test succeffully!");
	}

	@Test
	public void getAdminname() {
		System.out.println("***************************************************************");
		// ApplicationContext ac = new
		// ClassPathXmlApplicationContext("spring.xml");
		// AdminMgrService as = ac.getBean(AdminMgrService.class);
		Admin admin = adminService.getAdminByName("admin");
		if (admin == null) {
			System.out.print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			return;
		}
		else
		{
			
		}
		System.out.println("__________________结果：" + admin.getAdminId() + "____________________");
		System.out.println("***************************************************************");
	}

	@Test
	public void getsvctest() {
		System.out.println("***************************************************************");
		// ApplicationContext ac = new
		// ClassPathXmlApplicationContext("spring.xml");
		// AdminMgrService as = ac.getBean(AdminMgrService.class);
		String admin = adminService.test("admin");
		System.out.println(admin);
		System.out.println("***************************************************************");
	}
}
