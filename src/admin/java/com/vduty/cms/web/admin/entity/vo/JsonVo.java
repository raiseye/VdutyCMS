package com.vduty.cms.web.admin.entity.vo;

import java.util.HashMap;

import org.codehaus.jackson.map.annotate.JsonSerialize;

/**
 * ����Json��װ
 * @author lee
 */
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class JsonVo<T> {
	
	/**
	 * ���
	 */
	private boolean result;
	
	/**
	 * �ɹ�����Ϣ
	 */
	private String msg;
	
	/**
	 * ����ÿ������������Ϣ
	 */
	private HashMap<String, String> errors = new HashMap<String, String>();
	
	/**
	 * ���ص�����
	 */
	private T t;
	
	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public HashMap<String, String> getErrors() {
		return errors;
	}

	public void setErrors(HashMap<String, String> errors) {
		this.errors = errors;
	}

	public T getT() {
		return t;
	}

}
