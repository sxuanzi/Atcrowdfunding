package com.xuan.atcrowdfunding.manager.service;

import java.util.Map;


import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.util.Page;

public interface UserService {

	User queryUserLogin(Map<String, Object> paramMap);
	
	/*Page queryPage(Integer pageno, Integer pageSize);*/
	
	int saveUser(User user);

	Page queryPage(Map<String, Object> paramMap);

	User getUserByUserByUid(Integer id);

	int updateUser(User user);

	int deleteUser(Integer id);

	Integer deleteBatchUser(Integer[] id);

}
