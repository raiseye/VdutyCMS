package com.vduty.cms.web.user.dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.ResultSetMetaData;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.user.entity.User;

/**
 * 
 * @author luther
 *
 */
@Repository
public interface ItemDataDAO {
	
	/**
	 * 获取item
	 * @param user  
	 * @return
	 */
	//public ResultSet getItemData(long  itemDataId);
	
	
	/**
	 * 添加item
	 * @param user  
	 * @return
	 */
	public long addItemData(String addsql);
	
	public List<Map> getItemData(String sql);

	
	
	
	/**
	 * 删除
	 * @param itemid
	 * @return
	 */
	//public int deleteItem(long id);
	
	
	
	
	/**
	 * 获取Item列表
	 * @param itemId
	 * @return
	 */
	//public ResultSet itemDataList(long itemMainId);
	
	

	
}
