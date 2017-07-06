package com.vduty.cms.web.admin.entity;


import java.util.Date;

/**
 * 
 * @author Administrator
 *
 */
public class Admin {
	
	private long adminId;
	private String name;
	private String password;
	private Date createTime;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public long getAdminId() {
		return adminId;
	}
	public void setAdminId(long adminId){
		this.adminId = adminId;
	}
	
	
	

}
