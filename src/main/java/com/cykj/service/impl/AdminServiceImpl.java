package com.cykj.service.impl;

import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabFile;
import com.cykj.javabean.TabMenu;
import com.cykj.javabean.TabRole;
import com.cykj.mapper.AdminMapper;
import com.cykj.mapper.FileMapper;
import com.cykj.mapper.RoleMapper;
import com.cykj.mapper.UserMapper;
import com.cykj.service.AdminService;
import com.cykj.service.log.OperateLog;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private FileMapper fileMapper;

    //    @OperateLog(methodName = "login1111",operationType= OperateLog.OperationTypeEnum.UNKNOW)
    @Override
    public TabAdmin login(String account){
        TabAdmin tabAdmin=adminMapper.login(account);
        return tabAdmin;
    }

    @Override
    public TabRole queryFirstMenuByRole(int roleId) {
        TabRole tabRole = roleMapper.queryFirstMenuByRole(roleId);
        return tabRole;
    }

    @Override
    public List<TabMenu> querySecMenuByRole(List<TabMenu> list) {
        List<TabMenu> secList = roleMapper.querySecMenuByRole(list);
        return secList;
    }

    @Override
    public List<TabAdmin> selectList(TabAdmin tabAdmin, int start, int limit) {
        List<TabAdmin> list = adminMapper.selectList(tabAdmin,start,limit);
        return list;
    }

    @Override
    public int selectListCount(TabAdmin tabAdmin) {
        int count = adminMapper.selectListCount(tabAdmin);
        return count;
    }


    @Override
    public int add(TabAdmin tabAdmin) {
        int res = adminMapper.add(tabAdmin);
        return res;
    }

    @Override
    public int deleteAdmin(int ids) {
        int res = adminMapper.deleteAdmin(ids);
        return res;
    }

    @Override
    public int updateAdmin(TabAdmin tabAdmin) {
        int res = adminMapper.updateAdmin(tabAdmin);
        return res;
    }

    @Override
    public int batchDeleteAdmin(List<String> list) {
        int res = adminMapper.batchDeleteAdmin(list);
        return res;
    }

    @Override
    public List<TabFile> selectFilePage(int page, int limit) {
        List<TabFile> list = fileMapper.selectAllFile(page,limit);
        return list;
    }

    @Override
    public Integer selectFileCount() {
        int count = fileMapper.selectAllFileCount();
        return count;
    }

    @Override
    public Integer auditFile(int fileId) {
        int count = fileMapper.auditFile(fileId);
        return count;
    }

    @Override
    public Integer searchIntegral(int userId) {
        return userMapper.searchIntegral(userId);
    }

    @Override
    public Integer addIntegral(int userId,int userIntegral) {
        return userMapper.addIntegral(userId,userIntegral);
    }

    @Override
    public List<TabMenu> queryFirstMenu(int roleId) {

        return roleMapper.queryFirstMenu(roleId);
    }

    @Override
    public List<TabMenu> querySecMenu(List<TabMenu> list) {
        return roleMapper.querySecMenu(list);
    }


}
