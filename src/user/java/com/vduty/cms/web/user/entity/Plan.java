package com.vduty.cms.web.user.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "item_main")
public class Plan {

	/**
	 * 
	 */
	public Plan()
	{
		
	}
	
	private long id;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDoTime() {
		return doTime;
	}
	public void setDoTime(Date doTime) {
		this.doTime = doTime;
	}
	public int getRepeatType() {
		return repeatType;
	}
	public void setRepeatType(int repeatType) {
		this.repeatType = repeatType;
	}
	public int getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(int alarmType) {
		this.alarmType = alarmType;
	}
	public String getRepeatWeaks() {
		return repeatWeaks;
	}
	public void setRepeatWeaks(String repeatWeaks) {
		this.repeatWeaks = repeatWeaks;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	private String title;
	private Date doTime;
	/**
	 * 重复类型
	 * 1每天
	 * 2每周
	 * 3每月这天
	 * 4每年这一天
	 * 0不重复
	 */
	private int repeatType;
	/**
	 * 提醒类型
	 */
	private int alarmType;
	/**
	 *重复的某天 ，repeatType为3时，多天用逗号隔开，0~6
	 */
	private String repeatWeaks;
	/**
	 * 启用状态
	 */
	private int status;
	
	private Date createDatetime;
	
	private long userId;
	public Date getCreateDatetime() {
		return createDatetime;
	}
	public void setCreateDatetime(Date createDatetime) {
		this.createDatetime = createDatetime;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	
	
}
