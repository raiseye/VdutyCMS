package com.vduty.cms.web.user.entity;
import java.util.ArrayList;
import java.util.List;;
public class RequestJsonResult {
	
	public RequestJsonResult(Integer code,String msg)
	{
		this.errcode = code;
		this.message = msg;
	}

	private Integer errcode;
	public Integer getErrcode() {
		return errcode;
	}
	public void setErrcode(Integer errcode) {
		this.errcode = errcode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private String message;
	
}
