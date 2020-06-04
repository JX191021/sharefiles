package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.cykj.mapper.AdminMapper;
import com.cykj.mapper.UserMapper;
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
import java.util.List;

@WebServlet(name = "ActionOnUserServlet",urlPatterns = "/ActionOnUserServlet")
public class ActionOnUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");//设置编码格式

        String userId = request.getParameter("userId");
//        String adminName = request.getParameter("adminName");
        String method = request.getParameter("method");
        String config = "SqlMapConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(config);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        //删除用户
        if (method.equals("deleteUser")){
            String ids = request.getParameter("idList");
            List<String> list = JSON.parseArray(ids,String.class);
            int res = sqlSession.getMapper(UserMapper.class).deleteUser(list);
            sqlSession.commit();
            if (res>0){
                response.getWriter().print("deleteSuccess");
            }else{
                response.getWriter().print("deleteFail");
            }
            sqlSession.close();
            response.getWriter().flush();
        }
        //修改用户状态
        if (method.equals("updateState")){
            String state = request.getParameter("state");
            System.out.println("userId="+userId+"/state="+state);
            int res = sqlSession.getMapper(UserMapper.class).updateState(userId,state);
            sqlSession.commit();
            if (res>0){
                response.getWriter().print("updateSuccess");
            }else {
                response.getWriter().print("updateFail");
            }
            sqlSession.close();
            response.getWriter().flush();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
