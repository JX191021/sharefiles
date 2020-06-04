package com.cykj.mapper;

import com.cykj.javabean.TabUser;
import javafx.scene.control.Tab;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //用户登录
    public TabUser login(String account);
    //用户注册
    public int add(TabUser tabUser );
    //查询用户
    public List<TabUser> selectList(@Param("user")TabUser user, @Param("startDay")String startDay, @Param("endDay")String endDay, @Param("start")int start, @Param("limit")int limit);
    //查询用户总数
    public Integer selectListCount(@Param("user")TabUser user,@Param("startDay")String startDay,@Param("endDay")String endDay);
    //批量删除用户
    public int deleteUser(List<String> list);
    //修改状态
    public int updateState(@Param("userId")String userId,@Param("userState")String userState);

    public Integer searchIntegral(int userId);

    public Integer addIntegral(@Param("userId") int userId, @Param("userIntegral") int userIntegral);
}
