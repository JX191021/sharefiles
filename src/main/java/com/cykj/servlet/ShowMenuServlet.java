package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabMenu;
import com.cykj.javabean.TabRole;
import com.cykj.mapper.AdminMapper;
import com.cykj.mapper.RoleMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowMenuServlet",urlPatterns = "/ShowMenuServlet")
public class ShowMenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");

        String config = "SqlMapConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(config);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        TabRole tabRole = sqlSession.getMapper(RoleMapper.class).queryFirstMenuByRole(1);
        List<TabMenu> secList = sqlSession.getMapper(RoleMapper.class).querySecMenuByRole(tabRole.getMenuList());
        Map<String,List<TabMenu>> map = new LinkedHashMap<String, List<TabMenu>>();
        for (int i=0;i<tabRole.getMenuList().size();i++){
            for (int j=0;j<secList.size();j++){
                if (secList.get(j).getUpId()==tabRole.getMenuList().get(i).getMenuId()){
                    List<TabMenu> list =null;
                    if (map.get(tabRole.getMenuList().get(i).getMenuName())==null){
                        list = new ArrayList<TabMenu>();
                    }else {
                        list = map.get(tabRole.getMenuList().get(i).getMenuName());
                    }
                    list.add(secList.get(j));
                    map.put(tabRole.getMenuList().get(i).getMenuName(),list);
                }
            }
        }
        response.getWriter().print(JSON.toJSONString(map));
        response.getWriter().flush();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
