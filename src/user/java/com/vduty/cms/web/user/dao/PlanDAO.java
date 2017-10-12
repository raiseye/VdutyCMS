<<<<<<< HEAD
package com.vduty.cms.web.user.dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.ResultSetMetaData;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.user.entity.Plan;
import com.vduty.cms.web.user.entity.User;

/**
 * 计划任务
 * @author luther
 *
 */
@Repository
public interface PlanDAO {
	
	
	/**
	 * 添加plan
	 * @param user  
	 * @return
	 */
	public long addPlan(Plan plan);
	
	public List<Plan> getPlans(Map<String,Long> map);
    
	public Plan planInfo(long planId);
	
	public int deletePlan(long planId);
		

	
}
=======
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
public interface PlanDAO {
	
	/**
	 * 获取plan
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
	public int deleteItemData(long id);
	
	
	
	
	/**
	 * 获取Item列表
	 * @param itemId
	 * @return
	 */
	//public ResultSet itemDataList(long itemMainId);
	
	

	
}
>>>>>>> aa6de6b9f8debe7effdf29fe2946c797a986608a
