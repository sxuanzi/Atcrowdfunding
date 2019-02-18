package com.xuan.atcrowdfunding.manager.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.exception.LoginFailException;
import com.xuan.atcrowdfunding.manager.dao.UserMapper;
import com.xuan.atcrowdfunding.manager.service.UserService;
import com.xuan.atcrowdfunding.util.Const;
import com.xuan.atcrowdfunding.util.DateStringUtil;
import com.xuan.atcrowdfunding.util.MD5Util;
import com.xuan.atcrowdfunding.util.Page;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public User queryUserLogin(Map<String, Object> paramMap) {
		
		User user = userMapper.queryUserLogin(paramMap);
		
		if(user == null) {
			throw new LoginFailException("登陆失败");
		}
		return user;
	}

/*	@Override
	public Page queryPage(Integer pageno, Integer pageSize) {
		
		Page page = new Page(pageno, pageSize);
		
		List list = userMapper.queryList(page.getStartIndex(), pageSize);
		for (Object object : list) {
			System.out.println(object);
		}
		
		page.setDatas(list);
		System.out.println("index");

		Integer count = userMapper.queryCount();
		System.out.println(count);
		page.setTotalSize(count);
		
		return page;
	}*/

	@Override
	public int saveUser(User user) {
		
		user.setUserpswd(MD5Util.digest(Const.PASSWORD));
		
		user.setCreatetime(DateStringUtil.dateToString(new Date()));
		
		return userMapper.insert(user);
		
	}

	@Override
	public Page queryPage(Map<String, Object> paramMap) {
		Page page = new Page((Integer)paramMap.get("pageno"), (Integer)paramMap.get("pageSize"));
		paramMap.put("startIndex", page.getStartIndex());
		
		List list = userMapper.queryList(paramMap);
		
		page.setDatas(list);
		
		Integer count = userMapper.queryCount(paramMap);
		
		page.setTotalSize(count);
		
		return page;
	}

	@Override
	public User getUserByUserByUid(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public int deleteUser(Integer id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Integer deleteBatchUser(Integer[] id) {
		int totalCount = userMapper.deleteBatchUser(id);
		
		for (int i = 0; i < id.length; i++) {
			System.out.println("数据"+i+""+id[i]);
		}
		
		if(totalCount != id.length) {
			throw new RuntimeException();
		}
		return totalCount;
	}


}
