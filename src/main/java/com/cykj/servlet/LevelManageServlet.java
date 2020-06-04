package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabLevel;
import com.cykj.mapper.AdminMapper;
import com.cykj.mapper.LevelMapper;
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

@WebServlet(name = "LevelManageServlet", urlPatterns = "/LevelManageServlet")
public class LevelManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//设置编码格式
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");//设置编码格式

        String config = "SqlMapConfig.xml";
        InputStream inputStream = Resources.getResourceAsStream(config);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        LevelMapper levelMapper = sqlSession.getMapper(LevelMapper.class);
        String method = request.getParameter("method");
        if (method.equals("selectLevel")){
            List<TabLevel> list = levelMapper.selectLevel();
            LayuiData layuiData = new LayuiData();
            layuiData.setCode(0);
            layuiData.setData(list);
            response.getWriter().println(JSON.toJSONString(layuiData, SerializerFeature.DisableCircularReferenceDetect));
            response.getWriter().flush();
        }
        if (method.equals("updateLevel")){
            TabLevel tabLevel = new TabLevel();
            tabLevel.setLevelId(Integer.parseInt(request.getParameter("levelId")));
            tabLevel.setLevelName(request.getParameter("levelName"));
            tabLevel.setUploadIntegral(Integer.parseInt(request.getParameter("uploadIntegral")));
            tabLevel.setDownloadIntegral(Integer.parseInt(request.getParameter("downloadIntegral")));
            int res = levelMapper.updateLevel(tabLevel);
            sqlSession.commit();
            if (res>0){
                response.getWriter().print("editSuccess");
            }else {
                response.getWriter().print("editFail");
            }
            sqlSession.close();
            response.getWriter().flush();
        }
        if (method.equals("addLevel")){
            TabLevel tabLevel = new TabLevel();
            tabLevel.setLevelName(request.getParameter("levelName"));
            tabLevel.setUploadIntegral(Integer.parseInt(request.getParameter("uploadIntegral")));
            tabLevel.setDownloadIntegral(Integer.parseInt(request.getParameter("downloadIntegral")));
            System.out.println(tabLevel);
            int res = levelMapper.addLevel(tabLevel);
            sqlSession.commit();
            if (res>0){
                response.getWriter().print("addSuccess");
            }else {
                response.getWriter().print("addFail");
            }
            sqlSession.close();
            response.getWriter().flush();
        }

        if (method.equals("deleteLevel")){
            String ids = request.getParameter("idList");
//            System.out.println("ids="+ids);
            List<String> list = JSON.parseArray(ids,String.class);
            int res = levelMapper.deleteLevel(list);
            sqlSession.commit();
            if (res>0){
                response.getWriter().print("deleteSuccess");
            }else {
                response.getWriter().print("deleteFail");
            }
            sqlSession.close();
            response.getWriter().flush();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
