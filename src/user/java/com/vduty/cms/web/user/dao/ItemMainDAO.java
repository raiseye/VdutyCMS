package com.vduty.cms.web.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.user.entity.User;

/**
 * 
 * @author luther
 *
 */
@Repository
public interface ItemMainDAO {
	
	/**
	 * 获取item
	 * @param user  
	 * @return
	 */
	public ItemMain getItem(long  itemId);
	
	
	/**
	 * 添加item
	 * @param user  
	 * @return
	 */
	public int addItem(ItemMain item);
	
	/**
	 * 删除
	 * @param itemid
	 * @return
	 */
	public int deleteItem(long id);
	
	/**
	 * 添加item属性
	 * @param itemProperties
	 * @return
	 */
	public int addItemDefine(List<ItemDefine> itemDefine);
	
	/**
	 * 获取item信息
	 * @param itemId
	 * @return
	 */
//	public ItemMain itemInfo(int itemId);
	
	/**
	 * 获取Item属性列表
	 * @param itemId
	 * @return
	 */
	public List<ItemDefine> itemDefineList(long itemId);
	
	/**
	 * 通过userid
	 * 获取item列表
	 * @param userId
	 * @return
	 */
	public List<ItemMain> getItemMainList(long userId);

	
}
