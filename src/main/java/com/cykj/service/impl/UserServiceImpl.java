package com.cykj.service.impl;

import com.cykj.javabean.TabFile;
import com.cykj.javabean.TabUser;
import com.cykj.mapper.FileMapper;
import com.cykj.mapper.UserMapper;
import com.cykj.service.UserService;
import com.cykj.service.log.OperateLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private FileMapper fileMapper;

    //用户登录
    @Override
    public TabUser login(String account) {
        TabUser tabUser=userMapper.login(account);
        return tabUser;
    }
    //上传文件
    @Override
    public Integer insertFile(TabFile tabFile) {
        int num=0;
        num = fileMapper.insertFile(tabFile);
        return num;
    }

    @Override
    public List<TabFile> selectFilePage(TabFile tabFile,int page,int limit) {
        List<TabFile> list = fileMapper.selectFilePage(tabFile,page,limit);
        return list;
    }

    @Override
    public Integer selectFileCount(TabFile tabFile) {
        int count = fileMapper.selectFileCount(tabFile);
        return count;
    }

}
