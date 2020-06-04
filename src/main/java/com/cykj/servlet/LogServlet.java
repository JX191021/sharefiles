package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cykj.javabean.TabLog;
import com.cykj.mapper.LogMapper;
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

@WebServlet(name = "LogServlet",urlPatterns = "/LogServlet")
public class LogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");//设置编码格式
        String config = "SqlMapConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(config);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        if (request.getParameter("methodName").equals("selectPage")){
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");

            List<TabLog> list = sqlSession.getMapper(LogMapper.class).queryLogByPage(Integer.parseInt(page),Integer.parseInt(limit));
            int count = sqlSession.getMapper(LogMapper.class).queryLogCount();

            LayuiData layuiData = new LayuiData();
            layuiData.setCode(0);
            layuiData.setData(list);
            layuiData.setCount(count);
            response.getWriter().println(JSON.toJSONString(layuiData, SerializerFeature.DisableCircularReferenceDetect));
            response.getWriter().flush();
        }
        if (request.getParameter("methodName").equals("deleteLog")){
            String ids = request.getParameter("idList");
            List<String> list = JSON.parseArray(ids,String.class);
            int res = sqlSession.getMapper(LogMapper.class).deleteLog(list);
            sqlSession.commit();
            sqlSession.close();
            if (res>0){
                response.getWriter().print("删除成功");
            }else {
                response.getWriter().print("删除失败");
            }
            response.getWriter().flush();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
