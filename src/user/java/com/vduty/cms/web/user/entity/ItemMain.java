package com.vduty.cms.web.user.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "item_main")
public class ItemMain {

	/**
	 * 
	 */
	public ItemMain()
	{
		
	}
	/**
	 * 
	 * {"id":"0","title":"sdsfs","querySql":"","createTime":"2000-01-01","userId":"1","itemDefine":[{"id":"0","fieldName":"","fieldMeaning":"efe","dataType":"数字","unit":"cm"},{"id":"0","fieldName":"","fieldMeaning":"efeww","dataType":"数字","unit":"cm"},{"id":"0","fieldName":"","fieldMeaning":"eww","dataType":"数字","unit":"cm"}]}
	 * 
	 * @param title
	 * @param querySql
	 * @param createTime
	 * @param userId
	 * @param itemdefines
	 */
//	public ItemMain(String title,String querySql, Date createTime, int userId,List<ItemDefine> itemdefines)
//	{
//		this.title = title;
//		this.querySql = querySql;
//		this.createTime = createTime;
//		this.userId = userId;
//		
//		this.itemDefine = itemdefines;
//	}
	
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	private String title;

	private String querySql;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "query_sql")
	public String getQuerySql() {
		return querySql;
	}

	public void setQuerySql(String querySql) {
		this.querySql = querySql;
	}

	@Column(name = "create_time")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	

	private String createTime;

	private int userId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	private List<ItemDefine> itemDefine = new ArrayList<ItemDefine>();

	public List<ItemDefine> getItemDefine() {
		return itemDefine;
	}

	public void setItemDefine(List<ItemDefine> itemDefine) {
		this.itemDefine = itemDefine;
	}

}
