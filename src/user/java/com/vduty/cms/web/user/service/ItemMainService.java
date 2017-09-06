package com.vduty.cms.web.user.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import com.vduty.cms.web.user.dao.ItemMainDAO;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.utils.MD5Utils;

//解决方法是①首先查看@Autowired标记的字段对应的接口的实现类是否标记@Service、@Repository
//等交给Spring的IOC容器管理；②查看对应的类型是否一致或满足里氏代换原则，
//如@Autowired标记字段属性对应的接口的实现类是否实现了这个接口。
@Service
public class ItemMainService {

	@Autowired
	private ItemMainDAO itemDAO;

	@CacheEvict(value = "item", allEntries = true)
	public int addItem(ItemMain item) {
		int count = itemDAO.addItem(item);
		System.out.println("count:" + count + "  itemId:" + item.getId());
		int itemId = item.getId();
		List<ItemDefine> itemdefines = item.getItemDefine();
		int dcount = itemdefines.size();
		// dataType 1:文本 2:数字 3:日期
		// 检查dataType类型的数量

		int count1 = 0, count2 = 0, count3 = 0,count4 = 0;

		for (int i = 0; i < dcount; i++) {
			ItemDefine itemdefine = itemdefines.get(i);
			itemdefine.setItemId(itemId);

			switch (itemdefine.getDataType()) {
			case 1:
				count1++;
				itemdefine.setFieldName("c" + count1);
				break;
			case 2:
				count2++;
				itemdefine.setFieldName("n" + count2);
				break;
			case 3:
				count3++;
				itemdefine.setFieldName("d" + count3);
				break;
			case 4:
				count4++;
				itemdefine.setFieldName("p" + count3);
				break;
				
			default:
				break;

			}
		}		
		
		itemDAO.addItemDefine(itemdefines);

		return itemId;
	}
	
	public List<ItemMain> getItemLists(long userId)
	{
		List<ItemMain> itemlist = itemDAO.getItemMainList(userId);
		
		
		
		return itemlist;
	}
	
	/**
	 * s删除
	 * @param itemid
	 * @return
	 */
	public int deleteItem(long itemid)
	{
		itemDAO.deleteItem(itemid);
		return 1;
	}
	
	/**
	 * 获取item信息
	 * @param itemId
	 * @return
	 */
	public ItemMain getItem(long itemId)
	{
		 ItemMain itemMain = itemDAO.getItem(itemId);
		return itemMain;
		
	}
	
	/**
	 * 获取item属性列表
	 * @param itemId
	 * @return
	 */
	public List<ItemDefine> itemDefineList(long itemId)
	{
		return itemDAO.itemDefineList(itemId);
	}
	

}
