package com.cykj.mapper;

import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabMenu;
import com.cykj.javabean.TabRole;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AdminMapper {
    //管理员登录查询
    public TabAdmin login(String account);

    //查询一级菜单
    public TabRole queryFirstMenuByRole(int roleId);

    //查询二级菜单
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



}
