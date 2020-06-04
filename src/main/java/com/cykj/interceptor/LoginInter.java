package com.cykj.interceptor;

import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabUser;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInter implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        TabUser user = (TabUser) request.getSession().getAttribute("user");
        TabAdmin admin= (TabAdmin) request.getSession().getAttribute("admin");
        if (user != null || admin!=null) {
            //用户已登录
            return true;
        } else {
            //用户未登录
            if (request.getHeader("x-requested-with") != null
                    && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                //处理ajax请求
                System.out.println("ajax调用");
                response.setHeader("sessionstatus", "timeout");
                response.setStatus(403);
//                response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
            } else {
//                if (user == null){
//                    response.sendRedirect(request.getContextPath() + "/client/login.jsp");
//                }else if (admin==null){
                    response.sendRedirect(request.getContextPath() + "/admin/login.jsp");

//                }
            }


            return false;
        }
    }
}
