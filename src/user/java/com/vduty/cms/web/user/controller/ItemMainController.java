package com.vduty.cms.web.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.vduty.cms.web.user.service.ItemMainService;
import com.vduty.cms.web.user.service.UserMgrService;
import com.vduty.cms.web.utils.JsonUtils;

import net.sf.json.JSONObject;

/**
 * 任务管理
 * 
 * @author luther
 *
 */
@Controller
@RequestMapping("/manageruser/user")
public class ItemMainController extends UserBaseController {

	@Autowired
	protected ItemMainService itemService;
	

	@RequestMapping("/item")
	public String showUserItem(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {

		Subject subject = SecurityUtils.getSubject();
		modelMap.put("title_name", "我的记录分类");// subject.getPrincipal());
		int userId = (Integer) SecurityUtils.getSubject().getSession().getAttribute("userId");
		List<ItemMain> itemlist = itemService.getItemLists(userId);
		modelMap.put("itemlist", itemlist);

		return "/user/userMgr/item";
	}

	@RequestMapping("/itemedit")
	public String showItemEdit(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {

		Subject subject = SecurityUtils.getSubject();
		modelMap.put("title_name", "我的记录分类");// subject.getPrincipal());
		int userId = (Integer) SecurityUtils.getSubject().getSession().getAttribute("userId");
		List<ItemMain> itemlist = itemService.getItemLists(userId);
		modelMap.put("itemlist", itemlist);

		return "/user/userMgr/itemedit";
	}

	@RequestMapping("/item/set")
	public String setUserItem(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {

		Subject subject = SecurityUtils.getSubject();
		modelMap.put("title_name", "添加自定义事项");
		modelMap.put("userId", SecurityUtils.getSubject().getSession().getAttribute("userId"));
		return "/user/userMgr/setitem";
	}
	
	@RequestMapping("/item/add/{itemId}")
	public String addUserItem(@PathVariable String itemId,ModelMap modelMap) {
		
		System.out.println("itemId:" + itemId);
		
    	Subject subject = SecurityUtils.getSubject();
    	String title = "";
    	
    	long long_itemId = Long.parseLong(itemId);
    	ItemMain itemMain = itemService.getItem(long_itemId );
    	List<ItemDefine> itemDefineList = itemService.itemDefineList(long_itemId);
    	
    	System.out.println(itemMain.getTitle());
    	System.out.println(itemDefineList.size());
    	
    	
    	title= itemMain.getTitle();
    	
		modelMap.put("title_name", "添加"+title);
		modelMap.put("itemDefineList", itemDefineList);
		modelMap.put("userId", SecurityUtils.getSubject().getSession().getAttribute("userId"));
		//{itemMainId}/{pageIndex}/{pageSize}
		modelMap.put("itemMainId", itemId);
		modelMap.put("pageIndex", 0);
		modelMap.put("pageSize", 20);
		return "/user/userMgr/additem";
	}

	/**
	 * 原始接受客户端request数据的方法；
	 * 
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST, value = "/item/_setsave")
	public void addUserItemSave(HttpServletRequest request, HttpServletResponse response) {
		int pnum = 0;
		String result = "";
		// 原始的request数据--start
		BufferedReader br;
		try {
			br = request.getReader();
			String str, wholeStr = "";
			while ((str = br.readLine()) != null) {
				wholeStr += str;
			}
			wholeStr = URLDecoder.decode(wholeStr, "utf-8");
			result = wholeStr;
			System.out.println("wholeStr:" + wholeStr);
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (true) {
			System.out.println("\r\n");
			// 原始的request数据--end
			System.out.print("addUserItemSave");
			@SuppressWarnings("rawtypes")

			String item_name = request.getParameter("item_name");
			System.out.print("item_name:" + item_name);
			Enumeration enu = request.getParameterNames();
			while (enu.hasMoreElements()) {
				pnum++;
				String paraName = (String) enu.nextElement();
				System.out.println(paraName + ": " + request.getParameter(paraName));
			}
			System.out.print("addUserItemSave22222");

			String data = "--pnames len:" + pnum;
			System.out.print("addUserItemSave4444444--" + pnum);
			OutputStream outputStream = null;
			try {
				outputStream = response.getOutputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 获取OutputStream输出流
			response.setHeader("content-type", "text/html;charset=UTF-8");// 通过设置响应头控制浏览器以UTF-8的编码显示数据，如果不加这句话，那么浏览器显示的将是乱码
			/**
			 * 37 * data.getBytes()是一个将字符转换成字节数组的过程，这个过程中一定会去查码表， 38 *
			 * 如果是中文的操作系统环境，默认就是查找查GB2312的码表， 39 *
			 * 将字符转换成字节数组的过程就是将中文字符转换成GB2312的码表上对应的数字 40 * 比如：
			 * "中"在GB2312的码表上对应的数字是98 41 * "国"在GB2312的码表上对应的数字是99 42
			 */
			/**
			 * 44 * getBytes()方法如果不带参数，那么就会根据操作系统的语言环境来选择转换码表，如果是中文操作系统，
			 * 那么就使用GB2312的码表 45
			 */
			byte[] dataByteArr = null;
			try {
				dataByteArr = data.getBytes("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 将字符转换成字节数组，指定以UTF-8编码进行转换
			try {
				outputStream.write(dataByteArr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 使用OutputStream流向客户端输出字节数组
		}
		// return result;
	}

	/**
	 * 前端ajax $.ajax({ type: "POST", url: "/manageruser/user/item/setsave",
	 * contentType:
	 * "application/json;charset=utf-8",//"application/json;charset=utf-8",//
	 * "application/json" data:
	 * JSON.stringify(properties),//"itemProperties":[{"name":"name","type":
	 * "type","unit":"unit"}]}), //JSON.stringify把object对象转换为json格式的字符串
	 * dataType: "json", success: function (html) { $.toast("提交成功");
	 * console.log("提交成功：") console.log("result:"+html); }
	 * 
	 * 
	 * 
	 * @param p
	 * @return
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "/item/setsave")
	public String itemSetSave(@RequestBody ItemMain item) {
		System.out.println("itemSet:" + item.getTitle() + " " + item.getItemDefine().size());
		// 保存数据
		itemService.addItem(item);

		return this.returnJsonResult(1, "succ");

	}

	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "/item/delete")
	public String itemDel(@RequestParam long id ) {
		System.out.println("item id :" + id);
		// 保存数据
		int re = itemService.deleteItem(id);
		if (re > 0)
			return this.returnJsonResult(1, "succ");
		else
			return this.returnJsonResult(0, "fail");
	}

	/**
	 * 可用，未用
	 * 
	 * @param itemstring
	 * @return
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "/item/setsavejsonstr")
	public Map<String, String> itemSetSaveJsonString(@RequestBody String itemstring) {
		ItemMain item = new ItemMain();
		try {
			String jsonParams = URLDecoder.decode(itemstring, "utf-8");
			System.out.println(jsonParams);

			item = JsonUtils.fromJson(jsonParams, ItemMain.class);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, String> map = new HashMap<String, String>(1);
		map.put("result", item.getTitle());
		return map;

	}

	
	
	@RequestMapping(method = RequestMethod.GET, value = "/item/test")
	public String test( HttpServletRequest request, ModelMap modelMap) {

		Subject subject = SecurityUtils.getSubject();
		modelMap.put("title_name", subject.getPrincipal());
		return "/user/userMgr/test";
	}

}
