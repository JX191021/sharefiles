package com.cykj.service;

import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabFile;
import com.cykj.javabean.TabMenu;
import com.cykj.javabean.TabRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AdminService {

    public TabAdmin login(String adminName);

    public TabRole queryFirstMenuByRole(int roleId);

    public List<TabMenu> querySecMenuByRole(List<TabMenu> list);

    //管理员分页查询
    public List<TabAdmin> selectList(@Param("admin")TabAdmin tabAdmin, @Param("start")int start, @Param("limit")int limit);
    public int selectListCount(@Param("admin")TabAdmin tabAdmin);


    //添加管理员
    public int add(TabAdmin tabAdmin);

    //删除管理员
    public int deleteAdmin(@Param("adminId") int ids);

    //修改管理员
    public int updateAdmin(TabAdmin tabAdmin);

    //批量删除管理员
    public int batchDeleteAdmin(List<String> list);

    //查询用户文件
    public List<TabFile> selectFilePage( int page, int limit);

    //查询用户文件总数
    public Integer selectFileCount();

    public Integer auditFile(int fileId);

    public Integer searchIntegral(int userId);

    public Integer addIntegral(int userId,int userIntegral);

    public List<TabMenu> queryFirstMenu(int roleId);

    public List<TabMenu> querySecMenu(List<TabMenu> list);

}
