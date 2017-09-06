package com.vduty.cms.web.user.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.ResultSetMetaData;
import com.vduty.cms.web.user.dao.ItemDataDAO;
import com.vduty.cms.web.user.dao.ItemMainDAO;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.utils.MD5Utils;

//解决方法是①首先查看@Autowired标记的字段对应的接口的实现类是否标记@Service、@Repository
//等交给Spring的IOC容器管理；②查看对应的类型是否一致或满足里氏代换原则，
//如@Autowired标记字段属性对应的接口的实现类是否实现了这个接口。
@Service
public class ItemDataService {

	@Autowired
	private ItemDataDAO itemDAO;

	@CacheEvict(value = "item", allEntries = true)
	public long addItem(String addsql) {
		long itemid = itemDAO.addItemData(addsql);
		return itemid;
	}
	
	public List<Map> getItemData(String sql)
	{
		return itemDAO.getItemData(sql);
	}
	

	
}
