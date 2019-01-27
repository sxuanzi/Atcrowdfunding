package com.xuan.atcrowdfunding.manager.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuan.atcrowdfunding.manager.dao.TestDao;
import com.xuan.atcrowdfunding.manager.service.TestService;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDao testDao;
	
	public void insert() {
		Map map = new HashMap<String, String>();
		map.put("name", "zhang3");
		testDao.insert(map);
	}

}
