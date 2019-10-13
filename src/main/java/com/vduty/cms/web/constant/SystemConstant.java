package com.vduty.cms.web.constant;

import com.vduty.cms.web.utils.PropertyUtils;

/**
 * 系统定义的常量
 * @author yeluxing
 *
 */
public final class SystemConstant {

	/**
	 *
	 */
	public static String SHISHUO_CMS_ROOT = PropertyUtils.getRoot();
	
	/**
	 * 
	 */
	public static final int MIN_PASSWORD_LENGTH = 8;
	public static final int MAX_PASSWORK_LENGTH = 12;
	
	/**
	 * Sessio
	 */
	public static final String SESSION_ADMIN = "SESSION_ADMIN";
	public static final String SESSION_USER = "SESSION_USER";
	
	public static final int USER_PAGE_SIZE = 10;
	public static final int ADMIN_PAGE_SIZE = 10;
	
	/**
	 * 自定义字段的字段数
	 */
	public static final int ITEM_DATA_FIELD_NUMBER_SIZE = 10;
	public static final int ITEM_DATA_FIELD_TEXT_SIZE = 10;
	public static final int ITEM_DATA_FIELD_DATE_SIZE = 3;
	public static final int ITEM_DATA_FIELD_PICTURE_SIZE = 10;
	
	
	
	/**
	 * 自定义字段的字段数完
	 */
	
	
}
