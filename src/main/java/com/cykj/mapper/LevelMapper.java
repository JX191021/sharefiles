package com.cykj.mapper;

import com.cykj.javabean.TabLevel;

import java.util.List;

public interface LevelMapper {
    //等级管理
    public List<TabLevel> selectLevel();

    //修改等级
    public Integer updateLevel(TabLevel tabLevel);

    public Integer addLevel(TabLevel tabLevel);

    public Integer deleteLevel(List<String> list);
}
