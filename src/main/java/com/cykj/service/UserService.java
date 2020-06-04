package com.cykj.service;

import com.cykj.javabean.TabFile;
import com.cykj.javabean.TabUser;

import java.util.List;

public interface UserService {
    //用户登录
    public TabUser login(String account);

    //上传文档，添加文档表
    public Integer insertFile(TabFile tabFile);

    //查询用户文件
    public List<TabFile> selectFilePage(TabFile tabFile,int page,int limit);

    //查询用户文件总数
    public Integer selectFileCount(TabFile tabFile);

}
