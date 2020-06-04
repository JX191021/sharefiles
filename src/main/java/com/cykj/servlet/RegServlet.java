package com.cykj.servlet;


import com.cykj.javabean.TabUser;
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
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet(name = "RegServlet",urlPatterns = "/RegServlet")
public class RegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//设置编码格式
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");//设置编码格式

        //===================获取前端发送值================
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String education = request.getParameter("education");
        String occupation = request.getParameter("occupation");
        String phoneNum = request.getParameter("phoneNum");
        String emailAddr = request.getParameter("emailAddr");

        TabUser tabUser = new TabUser();
        tabUser.setName(userName);
        tabUser.setPassword(password);
        tabUser.setSex(sex);
        tabUser.setEducation(education);
        tabUser.setOccupation(occupation);
        tabUser.setPhone(phoneNum);
        tabUser.setEmail(emailAddr);
        String config = "SqlMapConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(config);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int num = sqlSession.getMapper(UserMapper.class).add(tabUser);
        sqlSession.commit();
        if (num>0){
            response.getWriter().print("注册成功");
            response.getWriter().flush();
        }else{
            response.getWriter().print("注册失败");
            response.getWriter().flush();
        }
        sqlSession.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("client/register.jsp").forward(request,response);
    }
}
