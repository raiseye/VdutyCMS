package com.vduty.cms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import org.apache.catalina.core.ApplicationContext;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.service.AdminMgrService;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.service.ItemDataService;
import com.vduty.cms.web.user.service.ItemMainService;

import org.springframework.beans.factory.annotation.Autowired;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml" })
public class Junittest {

	@Autowired
	protected AdminMgrService adminService;
	@Autowired
	protected ItemDataService itemDataService;
	@Autowired
	protected ItemMainService itemMainService;

	private static final Logger logger = Logger.getLogger(Junittest.class);

	@Test
	public void getItemData() {
		System.out.println("hello , getItemData!");
		try {

			@SuppressWarnings("rawtypes")

			String sqlAdd = " insert into item_data(n1,n2,n3) values (66,66,66) ";

			long resultAdd = itemDataService.addItem(sqlAdd);

			System.out.println("************************************************************" + resultAdd);

			long itemMainId = 16;
			List<ItemDefine> definelist = itemMainService.itemDefineList(itemMainId);
			Map<String, String> fielsMeaningMap = new HashMap<String, String>();
			if (definelist != null) {
				for (ItemDefine idf : definelist) {
					fielsMeaningMap.put(idf.getFieldName(), idf.getFieldMeaning());
				}
			}

			List<Map> sourceItemDefineList = itemDataService.getItemData(" select * from item_data where item_id=" + itemMainId);

			List<Map<String, Object>> itemDataList = new ArrayList<Map<String, Object>>();

			for (Map<String, Object> map : sourceItemDefineList) {
				Map<String, Object> itemDataMap = new HashMap<String, Object>();
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					String newKey = "";
					if (entry.getKey().equals("execute_datetime")) {
						newKey = "执行时间";
					} else if (entry.getKey().equals("create_time")) {
						newKey = "创建时间";
					} else if (entry.getKey().equals("id")) {
						newKey = "id";
					} else if (entry.getKey().equals("item_id")) {
						newKey = "item_id";
					} else {
						newKey = fielsMeaningMap.get(entry.getKey());
					}
					if (newKey != null) {
						itemDataMap.put(newKey, entry.getValue());
					}

					System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
				}
				itemDataList.add(itemDataMap);
				System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			}

			System.out.println("************************************************************" + sourceItemDefineList.size());

			for (Map<String, Object> map : itemDataList) {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
				}
				System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Test
	public void test1() {
		System.out.println("hello , my test succeffully!");
	}

	// @Test
	public void getAdminname() {
		System.out.println("***************************************************************");
		// ApplicationContext ac = new
		// ClassPathXmlApplicationContext("spring.xml");
		// AdminMgrService as = ac.getBean(AdminMgrService.class);
		Admin admin = adminService.getAdminByName("admin");
		if (admin == null) {
			System.out.print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			return;
		} else {

		}
		System.out.println("__________________结果：" + admin.getAdminId() + "____________________");
		System.out.println("***************************************************************");
	}

	// @Test
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
