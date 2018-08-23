package com.ssm.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.demo.mapper.UserDetailMapper;
import com.ssm.demo.mapper.UserManagerMapper;
import com.ssm.demo.pojo.User;
import com.ssm.demo.vo.Page;


@Service
public class UserManagerService {
	
	@Resource
	private UserManagerMapper userManagerMapper;
	
	@Resource
	private UserDetailMapper userDetailMapper;
	
	/**
	 * 用户登录
	 * @param accounts
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public User UserLogin(String accounts,String password) throws Exception{
		
		User user = userManagerMapper.findUserByLogin(accounts, password);		
		return user;
	}
	
	/**
	 * 根据条件查询用户
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public Page<User> QueryUser(User user,Page<User> page) throws Exception{
		int pageMAXRow = page.getPageRowNum();
		int startrow = (page.getCurrentPage()-1)*page.getPageRowNum();
		
		List<User> userList = userManagerMapper.queryUser(user,startrow,page.getPageRowNum());
		page.setObjList(userList);
		
		int allRowNum = userManagerMapper.queryUserCount(user);
		int allPageNum = allRowNum%pageMAXRow==0?allRowNum/pageMAXRow:allRowNum/pageMAXRow+1;
		page.setAllPageNum(allPageNum);
		
		return page;
	}
	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public User QueryUserById(int id) throws Exception{
		
		User user = userManagerMapper.findUserById(id);
		return user;
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @throws Exception 
	 */
	public void UpdateUserInfo(User user) throws Exception{
		userDetailMapper.updateUserDetail(user.getUserDetaile());
	}
	
}
