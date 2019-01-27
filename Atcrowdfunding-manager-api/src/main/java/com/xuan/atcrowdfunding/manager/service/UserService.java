package com.xuan.atcrowdfunding.manager.service;

import java.util.Map;


import com.xuan.atcrowdfunding.bean.User;

public interface UserService {

	User queryUserLogin(Map<String, Object> paramMap);

}
