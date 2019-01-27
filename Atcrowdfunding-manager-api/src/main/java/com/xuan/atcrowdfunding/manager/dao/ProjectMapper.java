package com.xuan.atcrowdfunding.manager.dao;

import com.xuan.atcrowdfunding.bean.Project;
import java.util.List;

public interface ProjectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Project record);

    Project selectByPrimaryKey(Integer id);

    List<Project> selectAll();

    int updateByPrimaryKey(Project record);
}