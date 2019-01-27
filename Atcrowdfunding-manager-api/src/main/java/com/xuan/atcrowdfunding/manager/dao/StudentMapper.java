package com.xuan.atcrowdfunding.manager.dao;

import com.xuan.atcrowdfunding.bean.Student;
import java.util.List;

public interface StudentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    Student selectByPrimaryKey(Integer id);

    List<Student> selectAll();

    int updateByPrimaryKey(Student record);
}