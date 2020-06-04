package com.cykj.mapper;

import com.cykj.javabean.TabFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileMapper {
    //上传文件添加数据库
    public Integer insertFile(TabFile tabFile);

    //查询用户文件
    public List<TabFile> selectFilePage(@Param("tabFile") TabFile tabFile, @Param("page") int page, @Param("limit") int limit);

    //查询用户文件总数
    public Integer selectFileCount(@Param("tabFile") TabFile tabFile);

    //查询用户文件
    public List<TabFile> selectAllFile(@Param("page") int page, @Param("limit") int limit);

    //查询用户文件总数
    public Integer selectAllFileCount();

    public Integer auditFile(int fileId);
}
