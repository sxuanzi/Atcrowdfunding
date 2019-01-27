package com.xuan.atcrowdfunding.manager.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.exception.LoginFailException;
import com.xuan.atcrowdfunding.manager.dao.UserMapper;
import com.xuan.atcrowdfunding.manager.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	//@Override
	public User queryUserLogin(Map<String, Object> paramMap) {
		
		User user = userMapper.queryUserLogin(paramMap);
		
		if(user == null) {
			throw new LoginFailException("登陆失败");
		}
		return user;
	}


}
