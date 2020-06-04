package com.cykj.controller;

import com.cykj.javabean.*;
import com.cykj.service.AdminService;
import com.cykj.utils.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller//注解，表明这个类是一个控制类
@RequestMapping("adminControl")
public class AdminController {

    @Autowired
    private AdminService adminService;

    //管理员登录
    @PostMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response, String account, String password) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        String reMsg="";
        TabAdmin admin = adminService.login(account);
        if (admin!=null){
            if (admin.getPassword().equals(password)){
                request.getSession().setAttribute("admin",admin);
                reMsg="1";
            }else {
                reMsg="2";
            }
        }else {
            reMsg="3";
        }
        return  reMsg;
    }
    //查询菜单
    @PostMapping(value = "/queryMenu")
    @ResponseBody
    public Map queryMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TabAdmin tabAdmin = (TabAdmin) request.getSession().getAttribute("admin");
        TabRole tabRole = adminService.queryFirstMenuByRole(tabAdmin.getRoleId());
        List<TabMenu> secList = adminService.querySecMenuByRole(tabRole.getMenuList());
        Map<String,List<TabMenu>> map = new LinkedHashMap<>();
        for (int i=0;i<tabRole.getMenuList().size();i++){
            for (int j=0;j<secList.size();j++){
                if (secList.get(j).getUpId()==tabRole.getMenuList().get(i).getMenuId()){
                    List<TabMenu> list =null;
                    if (map.get(tabRole.getMenuList().get(i).getMenuName())==null){
                        list = new ArrayList<>();
                    }else {
                        list = map.get(tabRole.getMenuList().get(i).getMenuName());
                    }
                    list.add(secList.get(j));
                    map.put(tabRole.getMenuList().get(i).getMenuName(),list);
                }
            }
        }
        return  map;
    }
    //管理员列表
    @RequestMapping(value = "/selectAdminPage")
    @ResponseBody
    public Object selectAdminPage(HttpServletRequest request, HttpServletResponse response, String page, String limit,String adminName,String roleId) throws IOException {

        int start = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
        TabAdmin admin = new TabAdmin();
        admin.setAdminName(adminName);
        if (roleId!=null && roleId!=""){
            admin.setRoleId(Integer.parseInt(roleId));
        }
        List<TabAdmin> list = adminService.selectList(admin,start,Integer.parseInt(limit));
        int count = adminService.selectListCount(admin);
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setData(list);
        layuiData.setCount(count);

        return  layuiData;
    }
    //查询所有文档
    @RequestMapping(value = "/queryAllFile")
    @ResponseBody
    public Object queryFileByUser(HttpServletRequest request, HttpServletResponse response, String page, String limit) throws IOException {

        int start = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
        List<TabFile> list = adminService.selectFilePage(start,Integer.parseInt(limit));
        int count = adminService.selectFileCount();
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setData(list);
        layuiData.setCount(count);

        return  layuiData;
    }
    //审核文档
    @RequestMapping(value = "/auditFile",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Object auditFile(HttpServletRequest request, HttpServletResponse response, TabFile tabFile) throws IOException {

        int count = adminService.auditFile(tabFile.getFileId());
        LayuiData layuiData = new LayuiData();
        if (count>0){
            Integer integral = adminService.searchIntegral(tabFile.getUserId());
            System.out.println("查询用户积分："+integral);
            Integer num = adminService.addIntegral(tabFile.getUserId(),integral+5);
            if (num>0){
                layuiData.setMsg("审核成功");
            }else {
                layuiData.setMsg("修改用户积分失败");
            }

        }else {
            layuiData.setMsg("审核失败");
        }

        return  layuiData;
    }
    //新增管理员
    @RequestMapping(value = "/addAdmin",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addAdmin(HttpServletRequest request, HttpServletResponse response,TabAdmin tabAdmin) throws IOException {
        System.out.println(tabAdmin.toString());
        int res = adminService.add(tabAdmin);
        String reMsg = "";
        if (res>0){
            reMsg="添加成功";
        }else{
            reMsg="添加失败";
        }
        return  reMsg;
    }
    //删除管理员
    @RequestMapping(value = "/deleteAdmin",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deleteAdmin(HttpServletRequest request, HttpServletResponse response,@RequestParam("idList[]") List<String> idList) throws IOException {
        System.out.println(idList);

        String reMsg = "";

        return  reMsg;
    }
    //退出系统
    @RequestMapping(value = "/quitSystem")
    @ResponseBody
    public void quitSystem(HttpServletRequest request, HttpServletResponse response,TabAdmin tabAdmin) throws IOException {
        request.getSession().removeAttribute("admin");
        response.sendRedirect(request.getContextPath() +"/admin/login.jsp");
//        request.getRequestDispatcher("admin/login.jsp");

    }

    //查询菜单
    @RequestMapping(value = "/queryFirstMenu")
    @ResponseBody
    public Object queryFirstMenu(HttpServletRequest request, HttpServletResponse response,Integer roleId) throws IOException {
        List<TabMenu> firList = adminService.queryFirstMenu(roleId);
        List<TabMenu> secList = adminService.querySecMenu(firList);
//        System.out.println("firList:"+firList);
//        System.out.println("secList:"+secList);
        for (int i=0;i<firList.size();i++){
            List<TabMenu> list= new ArrayList<>();
            for (int j=0;j<secList.size();j++){
                if (secList.get(j).getUpId()==firList.get(i).getMenuId()){
                    list.add(secList.get(j));
                    firList.get(i).setChildren(list);
                }
            }
        }
//        System.out.println("firList2:"+firList);
        return  firList;
    }

//    @GetMapping("jumoPage/{path}")
//    public String a(@PathVariable String path){
//        return path;
//    }
}
