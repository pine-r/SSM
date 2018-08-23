package com.ssm.demo.mapper;

import com.ssm.demo.pojo.UserDetaile;

public interface UserDetailMapper {
	
	public void insertUserDetail(UserDetaile userDetaile) throws Exception;
	
	public void deleteUserDetail(int id) throws Exception;
	
	public void updateUserDetail(UserDetaile userDetaile) throws Exception;
}
