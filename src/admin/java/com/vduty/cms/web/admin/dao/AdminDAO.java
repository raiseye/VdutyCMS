package com.vduty.cms.web.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.vduty.cms.web.admin.entity.Admin;

/**
 * 
 * @author luther
 *
 */
@Repository
public interface AdminDAO {
	
	/**
	 * 
	 * @param admin  
	 * @return
	 */
	public int addAdmin(Admin admin);
	
	/**
	 * ͨ
	 * @param name
	 * @return
	 */
	public Admin getAdminByName(@Param("name") String name);
	
	/**
	 * 
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Admin>
	 * 
	 */
	public List<Admin> getAllList(@Param("offset") long offset,
			@Param("rows") long rows);

	/**
	 * 
	 * 
	 * @return Integer
	 * 
	 */
	public int getAllListCount();
	
	/**
	 *
	 * 
	 * @param adminId
	 * @return Integer
	 * 
	 */
	public int delAdmin(@Param("id") long adminId);
	
	public int updateAdminPwdById(@Param("id") long adminId, @Param("pwd") String pwd);
	
	public int savaWebRunLog(@Param("log") String log);
	
	
}
