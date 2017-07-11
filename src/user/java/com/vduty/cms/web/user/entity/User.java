package com.vduty.cms.web.user.entity;
import java.util.Date;
public class User {

	private int  userId     ;   
	public int getId() {
		return userId;
	}
	public void setId(int id) {
		this.userId = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTrue_name() {
		return true_name; 
	}
	public void setTrue_name(String true_name) {
		this.true_name = true_name;
	}
	public String getLast_loginip() {
		return last_loginip;
	}
	public void setLast_loginip(String last_loginip) {
		this.last_loginip = last_loginip;
	}
	public Date getLast_logintime() {
		return last_logintime;
	}
	public void setLast_logintime(Date last_logintime) {
		this.last_logintime = last_logintime;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public Date getCreate_time() {
		return createTime;
	}
	public void setCreate_time(Date create_time) {
		this.createTime = create_time;
	}
	private  String  name  ;   
	private String salt ;   
	private String password  ;   
	private  String  mobile     ; 
	private  String true_name   ;  
	private String  last_loginip ; 
	private  Date last_logintime ; 
	private Date update_time  ; 
	private Date createTime   ; 
	
	
	
}
