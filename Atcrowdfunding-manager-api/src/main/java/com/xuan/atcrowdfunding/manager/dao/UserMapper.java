package com.xuan.atcrowdfunding.manager.dao;

import com.xuan.atcrowdfunding.bean.User;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

	User queryUserLogin(Map<String, Object> paramMap);
	
/*	List queryList(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize);
	
	Integer queryCount();*/

	List queryList(Map<String, Object> paramMap);

	Integer queryCount(Map<String, Object> paramMap);

	int deleteBatchUser(Integer[] id);
}