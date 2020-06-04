package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabUser;
import com.cykj.mapper.AdminMapper;
import com.cykj.mapper.UserMapper;
import com.cykj.utils.LayuiData;
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

@WebServlet(name = "UserSelectPageServlet", urlPatterns = "/UserSelectPageServlet")
public class UserSelectPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//设置编码格式
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");//设置编码格式

        String config = "SqlMapConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(config);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        String page = request.getParameter("page");
        String limit  = request.getParameter("limit");
        String userName = request.getParameter("userName");
        String dateStr = request.getParameter("dateStr");
        String startDay = "";
        String endDay = "";
        if (dateStr !=null &&dateStr !=""){
            String [] arr = dateStr.split("~");
            startDay=arr[0];
            endDay = arr[1];
        }
//        String [] arr = dateStr.split("~");
//        System.out.println("开始："+arr[0]);
//        System.out.println("结束"+arr[1]);
        TabUser user = new TabUser();
        user.setName(userName);
        int start = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
//        System.out.println("start="+start);
//        System.out.println("limit="+limit);
        List<TabUser> list = userMapper.selectList(user,startDay,endDay,start,Integer.parseInt(limit));
        System.out.println("userList="+list);
        int count = userMapper.selectListCount(user,startDay,endDay);
        System.out.println("userCount="+count);
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setData(list);
        layuiData.setCount(count);
        response.getWriter().println(JSON.toJSONString(layuiData, SerializerFeature.DisableCircularReferenceDetect));
        response.getWriter().flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
