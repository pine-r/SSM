package com.ssm.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.demo.pojo.User;

public interface UserManagerMapper {
	
	public User findUserById(int id) throws Exception;
	
	public User findUserByLogin(@Param("account")String account,@Param("password")String password) throws Exception;

	public List<User> queryUser(@Param("user")User user,@Param("startrow")int startrow,@Param("length")int length) throws Exception;
	
	public int queryUserCount(@Param("user")User user) throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public void deleteUser(int id) throws Exception;
	
	public void updateUser(User user) throws Exception;
}
