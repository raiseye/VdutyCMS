package com.vduty.cms.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import com.vduty.cms.web.dao.UserDAO;
import com.vduty.cms.web.entity.User;
import com.vduty.cms.web.utils.MD5Utils;
//解决方法是①首先查看@Autowired标记的字段对应的接口的实现类是否标记@Service、@Repository
//等交给Spring的IOC容器管理；②查看对应的类型是否一致或满足里氏代换原则，
//如@Autowired标记字段属性对应的接口的实现类是否实现了这个接口。
@Service
public class UserMgrService {

	@Autowired
	private UserDAO userDAO;

	@CacheEvict(value = "user", allEntries = true)
	public User addUser(String name, String password) {
		User user = new User();//
		user.setName(name);
		user.setPassword(MD5Utils.encrypt(password));
		user.setCreate_time(new Date());
		userDAO.addUser(user);
		return user;
	}

	/**
	 *
	 * @param name
	 * @return
	 */
	public User getUserByName(String name) {
		if (userDAO == null)
			System.out.println("%%%%%%%%%%%%%");
		User user = new User() ;
		System.out.print(userDAO);
		try {
			 user = userDAO.getUserByName(name);
		} catch (Exception e) {
			System.out.print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+e.getMessage());
		}
		return user;
	}

	

	/**
	 * 
	 * 
	 * @param offset
	 * @param rows
	 * @return List<User>
	 */
	public List<User> getAllList(long offset, long rows) {
		return userDAO.getAllList(offset, rows);
	}

	/**
	 * 
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return userDAO.getAllListCount();
	}

	/**
	 * 
	 * @param userId
	 * @return
	 */
	public int delUserById(long userId) {
		return userDAO.delUser(userId);
	}

	/**
	 * 
	 * @param userId
	 * @return
	 */
	public int updateUserPwdById(long userId, String pwd) {
		return userDAO.updateUserPwdById(userId, pwd);
	}

	/*
	 * test service no database
	 */
	public String test(String test) {
		return test;
	}

}
