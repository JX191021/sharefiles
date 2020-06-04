package com.cykj.test;

import com.alibaba.druid.pool.DruidDataSource;
import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabMenu;
import com.cykj.javabean.TabRole;
import com.cykj.javabean.TabUser;
import com.cykj.mapper.AdminMapper;
import com.cykj.mapper.RoleMapper;
import com.cykj.mapper.UserMapper;
import com.cykj.service.AdminService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.applet.AppletContext;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class test {

    @Value("#{const.pagesize}")
    private static  int pageSize;

    @Autowired
    private static AdminService adminService;

    public static void main(String[] args) {
        System.out.println(adminService);
        List<TabMenu> list = adminService.queryFirstMenu(1);
        System.out.println(list);


//        TabAdmin tabAdmin = null;
//        String xml_file = "ApplicationContent.xml";
//        ApplicationContext conf = new ClassPathXmlApplicationContext(xml_file);
//        tabAdmin = (TabAdmin)conf.getBean("admin");
//        System.out.println("测试"+tabAdmin);
//        System.out.println(pageSize);
//
//        DruidDataSource ds = (DruidDataSource)conf.getBean("dataSource");
//        System.out.println("ds="+ds);
        //全局主配置文件
//        String config = "SqlMapConfig.xml";
//        try {
//            InputStream inputStream = Resources.getResourceAsStream(config);
//            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//            SqlSession sqlSession = sqlSessionFactory.openSession();

            //================用户登录=====================
//            TabUser loginTabUser =sqlSession.getMapper(UserMapper.class).login("101");
//            if (loginTabUser!=null){
//                System.out.println(loginTabUser);
//            }else {
//                System.out.println("获取失败");
//            }

            //===============添加用户=====================
//            TabUser tabUser = new TabUser();
//            tabUser.setAccount("104");
//            tabUser.setName("利器");
//            tabUser.setPassword("123");
//            int res = sqlSession.insert("userSpace.insert",tabUser);
//            sqlSession.commit();
//            if (res>0){
//                System.out.println("添加成功");
//            }else {
//                System.out.println("添加失败");
//            }
//            sqlSession.close();

            //==============查询所有用户===============
//            List<TabUser> list = sqlSession.getMapper(UserMapper.class).selectList();
//            System.out.println("list："+list);

            //===============添加管理员==================
//            AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
//            TabAdmin tabAdmin = new TabAdmin();
//            tabAdmin.setAdminId("1");
//            tabAdmin.setAdminName("管理员");
//            int num = adminMapper.updateAdmin(tabAdmin);
//            tabAdmin.setAccount("admin15");
//            tabAdmin.setPassword("123");
//            tabAdmin.setAdminName("管理员16");
//            int num = adminMapper.add(tabAdmin);
//            sqlSession.commit();
//            if (num>0){
//                System.out.println("tabAdmin="+tabAdmin);
//            }else {
//                System.out.println("失败");
//            }
//            sqlSession.close();

            //=============管理员登录查询=============
//            TabAdmin tabAdmin = sqlSession.getMapper(AdminMapper.class).login("admin");
//            if (tabAdmin != null){
//                System.out.println(tabAdmin);
//            }else{
//                System.out.println("失败");
//            }
//
            //=============查询管理员================
//            List<TabAdmin> list = sqlSession.getMapper(AdminMapper.class).selectList(new TabAdmin(),0,5);
//            System.out.println(list);
//            int count = sqlSession.getMapper(AdminMapper.class).selectListCount(new TabAdmin());
//            System.out.println(count);
//            List<TabUser> list = sqlSession.getMapper(UserMapper.class).selectList(new TabUser(),"2019-03-18 13:04:07","2020-5-20 13:04:07",0,5);
//            System.out.println(list);
//            between '2019-03-05 13:04:07' and '2019-03-08 13:04:07';
//            int count = sqlSession.getMapper(UserMapper.class).selectListCount("","2019-04-05 13:04:07","2020-5-20 13:04:07");
//            System.out.println(count);
            //=============用户表批量删除===============
//            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//            String idList = "4,24";
//            String [] ids = idList.split(",");
//            int n = userMapper.delete(ids);
//            sqlSession.commit();
//            if (n>0){
//                System.out.println("删除成功");
//            }else {
//                System.out.println("删除失败");
//            }
//            sqlSession.close();
            //============查询菜单=================
//            TabRole tabRole = sqlSession.getMapper(RoleMapper.class).queryFirstMenuByRole(1);
//            System.out.println("111="+tabRole.getMenuList());
//            List<TabMenu> secList = sqlSession.getMapper(RoleMapper.class).querySecMenuByRole(tabRole.getMenuList());
//
//            Map<String,List<TabMenu>> map = new LinkedHashMap<String, List<TabMenu>>();
//            for (int i=0;i<tabRole.getMenuList().size();i++){
//                for (int j=0;j<secList.size();j++){
//                    if (secList.get(j).getUpId()==tabRole.getMenuList().get(i).getMenuId()){
//                        List<TabMenu> list =null;
//                        if (map.get(tabRole.getMenuList().get(i).getMenuName())==null){
//                            list = new ArrayList<TabMenu>();
//                        }else {
//                            list = map.get(tabRole.getMenuList().get(i).getMenuName());
//                        }
//                        list.add(secList.get(j));
//                        map.put(tabRole.getMenuList().get(i).getMenuName(),list);
//                    }
//                }
//            }
//            System.out.println(map);


//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}
