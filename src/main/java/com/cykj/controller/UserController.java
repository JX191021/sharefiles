package com.cykj.controller;

import com.alibaba.fastjson.JSON;
import com.cykj.javabean.TabAdmin;
import com.cykj.javabean.TabFile;
import com.cykj.javabean.TabUser;
import com.cykj.service.AdminService;
import com.cykj.service.UserService;
import com.cykj.service.log.OperateLog;
import com.cykj.utils.FileSizeUtil;
import com.cykj.utils.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller//注解，表明这个类是一个控制类
@RequestMapping("userControl")
public class UserController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    @OperateLog(methodName = "登录",operationType= OperateLog.OperationTypeEnum.LOGIN)
    public String login(HttpServletRequest request, HttpServletResponse response, String account, String pwd) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String reMsg="";
        TabUser user = userService.login(account);
        if (user!=null){
            if (user.getPassword().equals(pwd)){
                request.getSession().setAttribute("user",user);
                reMsg="登录成功";
            }else {
                reMsg="密码错误";
            }
        }else {
            reMsg="账号不存在";
        }
        return  reMsg;
    }

    @RequestMapping(value = "/upload",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Object upload(HttpServletRequest request, HttpServletResponse response, MultipartFile file, String fileName) {
//        System.out.println("fileName=" + fileName);
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
            System.out.println("文件名："+originalName);
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            Date date = new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid = UUID.randomUUID() + "";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = simpleDateFormat.format(date);
            String savePath = request.getSession().getServletContext().getRealPath("/upload/");
            //要保存的文件路径和名称
            String projectPath = savePath + dateStr + File.separator + uuid + "." + prefix;

            System.out.println("要保存的文件路径和名称：" + projectPath);
            File files = new File(projectPath);
            //打印查看上传路径
            if (!files.getParentFile().exists()) {//判断目录是否存在
                System.out.println("files11111=" + files.getPath());
                files.getParentFile().mkdirs();
            }
            System.out.println("文件保存路径："+ files.getParentFile());
            file.transferTo(files); // 将接收的文件保存到指定文件中

            LayuiData layuiData=new LayuiData();
            layuiData.setCode(0);
            layuiData.setMsg("上传成功");
            TabUser user = (TabUser) request.getSession().getAttribute("user");
            TabFile tabFile = new TabFile();
            tabFile.setUserId(user.getUserId());
            tabFile.setAuditState("待审核");
            tabFile.setFileName(originalName);
            tabFile.setFilePath(savePath+dateStr);
            tabFile.setFileSize(FileSizeUtil.GetFileSize(files));
            System.out.println(tabFile.toString());
            userService.insertFile(tabFile);
            return layuiData;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/queryFileByUser",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Object queryFileByUser(HttpServletRequest request, HttpServletResponse response, String page, String limit,String fileName) throws IOException {

        int start = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
        TabFile tabFile = new TabFile();
        TabUser user = (TabUser) request.getSession().getAttribute("user");
        tabFile.setUserId(user.getUserId());
        tabFile.setFileName(fileName);
        List<TabFile> list = userService.selectFilePage(tabFile,start,Integer.parseInt(limit));
        int count = userService.selectFileCount(tabFile);
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setData(list);
        layuiData.setCount(count);

        return  layuiData;
    }


}
