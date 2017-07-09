package com.vduty.cms.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.vduty.cms.web.entity.User;

/**
 * 
 * @author luther
 *
 */
@Repository
public interface UserDAO {
	
	/**
	 * 
	 * @param user  
	 * @return
	 */
	public int addUser(User user);
	
	/**
	 * ͨ
	 * @param name
	 * @return
	 */
	public User  getUserByName(@Param("name") String name);
	
	/**
	 * 
	 * 
	 * @param offset
	 * @param rows
	 * @return List<User>
	 * 
	 */
	public List<User> getAllList(@Param("offset") long offset,
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
	 * @param userId
	 * @return Integer
	 * 
	 */
	public int delUser(@Param("id") long userId);
	
	public int updateUserPwdById(@Param("id") long userId, @Param("pwd") String pwd);
	
}
