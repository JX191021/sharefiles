package com.cykj.servlet;

import com.cykj.javabean.TabAdmin;
import com.cykj.mapper.AdminMapper;
import com.cykj.service.AdminService;
import com.cykj.service.impl.AdminServiceImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//设置编码格式
        response.setContentType("text/text;charset=utf-8");//设置编码格式
        response.setCharacterEncoding("UTF-8");//设置编码格式
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");

        String xml_file = "ApplicationContent.xml";
        ApplicationContext conf = new ClassPathXmlApplicationContext(xml_file);

        AdminService adminService = (AdminService)conf.getBean("adminService");
        TabAdmin tabAdmin = adminService.login(username);
        System.out.println(tabAdmin);
        if (tabAdmin != null) {
            if (tabAdmin.getPassword().equals(pwd)) {
                request.getSession().setAttribute("admin",tabAdmin);
                response.getWriter().print("登录成功");
                response.getWriter().flush();
            } else {
                response.getWriter().print("密码有误，请重新输入！");
                response.getWriter().flush();
            }
        } else {
            response.getWriter().print("账号不存在！");
            response.getWriter().flush();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
