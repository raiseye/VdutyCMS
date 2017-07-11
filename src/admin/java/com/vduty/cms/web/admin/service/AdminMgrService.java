package com.vduty.cms.web.admin.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import com.vduty.cms.web.admin.dao.AdminDAO;
import com.vduty.cms.web.admin.entity.Admin;
import com.vduty.cms.web.admin.entity.vo.PageVo;
import com.vduty.cms.web.constant.SystemConstant;
import com.vduty.cms.web.user.dao.UserDAO;
import com.vduty.cms.web.utils.MD5Utils;

@Service
public class AdminMgrService {

	
	
	@Autowired
	private AdminDAO adminDAO;

	@CacheEvict(value = "admin", allEntries = true)
	public Admin addAdmin(String name, String password) {
		Admin admin = new Admin();
		admin.setName(name);
		admin.setPassword(MD5Utils.encrypt(password));
		admin.setCreateTime(new Date());
		adminDAO.addAdmin(admin);
		return admin;
	}

	/**
	 *
	 * @param name
	 * @return
	 */
	public Admin getAdminByName(String name) {
		if (adminDAO == null)
			System.out.println("%%%%%%%%%%%%%");
		Admin admin = new Admin() ;
		System.out.print(adminDAO);
		try {
			 admin = adminDAO.getAdminByName(name);
		} catch (Exception e) {
			System.out.print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+e.getMessage());
		}
		return admin;
	}

	/**
	 * 
	 * 
	 * @param Integer
	 * @return PageVo<Admin>
	 */
	public PageVo<Admin> getAllListPage(int pageNum) {
		PageVo<Admin> pageVo = new PageVo<Admin>(pageNum);
		pageVo.setRows(SystemConstant.ADMIN_PAGE_SIZE);
		List<Admin> list = getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}

	/**
	 * 
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Admin>
	 */
	public List<Admin> getAllList(long offset, long rows) {
		return adminDAO.getAllList(offset, rows);
	}

	/**
	 * 
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return adminDAO.getAllListCount();
	}

	/**
	 * 
	 * @param adminId
	 * @return
	 */
	public int delAdminById(long adminId) {
		return adminDAO.delAdmin(adminId);
	}

	/**
	 * 
	 * @param adminId
	 * @return
	 */
	public int updateAdminPwdById(long adminId, String pwd) {
		return adminDAO.updateAdminPwdById(adminId, pwd);
	}

	/*
	 * test service no database
	 */
	public String test(String test) {
		return test;
	}

}
