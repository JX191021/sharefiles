package com.cykj.mapper;

import com.cykj.javabean.TabLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogMapper {
    Integer inertLog(TabLog tabLog);

    List<TabLog> queryLogByPage(@Param("page")int page,@Param("limit")int limit);

    Integer queryLogCount();

    Integer deleteLog(List<String> list);
}
