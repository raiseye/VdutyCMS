package com.vduty.cms.web.user.controller;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.channels.FileChannel.MapMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.vduty.cms.web.controller.BaseController;
import com.vduty.cms.web.user.UserBaseController;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.user.service.ItemDataService;
import com.vduty.cms.web.user.service.ItemMainService;
import com.vduty.cms.web.user.service.UserMgrService;
import com.vduty.cms.web.user.service.UserRealm;
import com.vduty.cms.web.utils.JsonDateValueProcessor;
import com.vduty.cms.web.utils.JsonUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 任务管理
 * 
 * @author luther
 *
 */
@Controller
@RequestMapping("/manageruser/user")
public class ItemDataController extends UserBaseController {

	@Autowired
	protected ItemDataService itemDataService;

	@Autowired
	protected ItemMainService itemMainService;

	/**
	 * 记录列表
	 * 
	 * @param request
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/item/datalist/{itemMainId}/{pageIndex}/{pageSize}")
	public String itemDataList(@PathVariable long itemMainId, @PathVariable int pageIndex, @PathVariable int pageSize,
			ModelMap modelMap) {

		pageIndex = pageIndex < 0 ? 0 : pageIndex;
		pageIndex = pageIndex * pageSize;
		List<ItemDefine> itemDefineList = itemMainService.itemDefineList(itemMainId);

		if (itemDefineList != null && itemDefineList.size() > 0) {
			StringBuilder sb = new StringBuilder();
			sb.append(" select  id,item_id,create_time,execute_datetime, ");
			for (ItemDefine itemdefine : itemDefineList) {
				sb.append(itemdefine.getFieldName());
				sb.append(",");
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append(" ");
			sb.append("from item_data where item_id=");
			sb.append(itemMainId);
			sb.append("  order by id desc limit   ");
			sb.append(" ");
			sb.append(pageIndex);
			sb.append(" , ");
			sb.append(pageSize);
			String sql = sb.toString();
			logger.info("sql: " + sql);
			List<Map> sourceItemDefineList = itemDataService.getItemData(sql);
			
			//testjson
			JsonConfig jsonConfig = new JsonConfig();  
			jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor()); 
			
			JSONArray json = JSONArray.fromObject(sourceItemDefineList,jsonConfig); 
			
			System.out.println(json.toString());
			//testjson end;
			
			logger.info("item_data_map_len:" + sourceItemDefineList.size());

			List<ItemDefine> definelist = itemMainService.itemDefineList(itemMainId);
			Map<String, String> fielsMeaningMap = new HashMap<String, String>();
			if (definelist != null) {
				for (ItemDefine idf : definelist) {
					fielsMeaningMap.put(idf.getFieldName(), idf.getFieldMeaning());
				}
			}

			// List<Map> sourceItemDefineList = itemDataService.getItemData("
			// select * from item_data where item_id=" + itemMainId);

			List<Map<String, Object>> itemDataList = new ArrayList<Map<String, Object>>();
            StringBuilder dateSb = new StringBuilder();
            
            
			for (Map<String, Object> map : sourceItemDefineList) {//记录循环
				Map<String, Object> itemDataMap = new HashMap<String, Object>();
				StringBuilder nSb = new StringBuilder("[");
				for (Map.Entry<String, Object> entry : map.entrySet()) {//字段循环
					
				
					String newKey = "";
					if (entry.getKey().equals("execute_datetime")) {
						newKey = "记录时间";
						
						
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

			System.out.println(
					"************************************************************" + sourceItemDefineList.size());

			for (Map<String, Object> map : itemDataList) {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
				}
				System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			}
			modelMap.put("list", itemDataList);
			modelMap.put("title_name", "记录报表");
		    modelMap.put("json",json);
		    modelMap.put("meaning",JSONArray.fromObject(fielsMeaningMap) );
			return "/user/userMgr/itemreport";
			
			
		}
		else
			
		return "/user/userMgr/itemreport";
		
	

	}

	/**
	 * 保存记录
	 * 
	 * @param request
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/item/addsave")
	public String saveAddItem(HttpServletRequest request, ModelMap modelMap) {

		@SuppressWarnings("unchecked")
		Enumeration<String> params = request.getParameterNames();
		String paramlist = "";
		StringBuilder sb = new StringBuilder();
		StringBuilder fields = new StringBuilder();
		StringBuilder values = new StringBuilder();

		sb.append("insert into item_data ");

		fields.append("(");
		values.append("(");

		while (params.hasMoreElements()) {
			String name = params.nextElement();
			fields.append(name);
			
			if ("execute_datetime".equals(name))
			{
				values.append("'" + request.getParameter(name)+"'");
			}
			else
			
			values.append(request.getParameter(name));

			fields.append(",");
			values.append(",");

		}

		fields.delete(fields.length() - 1, fields.length());
		values.deleteCharAt(values.length() - 1);
		fields.append(")");
		values.append(")");

		sb.append(fields.toString());
		sb.append(" ");
		sb.append("values");
		sb.append(values);

		String addsql = sb.toString();
         logger.info(addsql);
		System.out.println(addsql);

		itemDataService.addItem(addsql);

		modelMap.put("title_name", "保存成功");
		modelMap.put("message", "保存记录成功" + paramlist);
		return "/user/resultwindow";
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET, value = "/item/deletedata/{id}")
	public String deleteDataItem(@PathVariable int id,ModelMap modelMap)
	{
		
		int reusult = itemDataService.deleteItemData(id);
		if (reusult>0)
		return this.returnJsonResult(1, "成功");
		else
			return  this.returnJsonResult(10004, "失败");
	}
	
	

}
