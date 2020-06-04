<%@ page import="com.cykj.javabean.TabAdmin" %><%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/5/13
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
TabAdmin admin = (TabAdmin)request.getSession().getAttribute("admin");%>
<html>
<head>
    <title>后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jqueryUtil.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <span><%=admin.getAdminName()%></span>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/sharefiles/adminControl/quitSystem">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class='layui-nav layui-nav-tree' lay-filter="menu" id="menu" ></ul>
        </div>
    </div>

    <div class="layui-body" >
        <!-- 内容主体区域 -->
        <div>
            <iframe name="content" frameborder="0" src="" style="width: 100%;height: 100%">

            </iframe>
        </div>
    </div>

    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        ©2020 Baidu (京)-经营性-2017-0020京公网安备11000002000001号京ICP证030173号
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        $.ajax({
            type:"POST",
            url:"/sharefiles/adminControl/queryMenu",
            dataType:"json",
            success:function (data) {
                var menu ="\n";
                for(var key in data){
                    menu+="<li class='layui-nav-item '>\n" +
                        "                        <a href='javascript:;' >"+key+"</a>\n" +
                        "                        <dl class='layui-nav-child'>"
                    for (var i = 0;i<data[key].length;i++){
                        menu+="<dd><a href="+data[key][i].menuPath+" target='content'>"+data[key][i].menuName+"</a></dd>\n"
                    }
                    menu+="  </dl>\n" +
                        "                </li>"

                }
                $("#menu").append(menu);
                $(".layui-nav-bar").attr("class", "zorder:999;");
                element.render('nav','menu');
            }
        });

    });

</script>
<%--<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>--%>
</body>
</html>
