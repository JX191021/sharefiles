<%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/5/10
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
//    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>共享系统前端</title>
    <link rel="shortcut icon" href="#"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link rel="stylesheet" href=<%=path+"/zui/dist/css/zui.min.css"%>>
    <link rel="stylesheet" href=<%=path+"/css/home.css"%>>
    <!-- ZUI Javascript 依赖 jQuery -->
    <script type="text/javascript" src=<%=path+"/zui/dist/lib/jquery/jquery.js"%>></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script type="text/javascript" src=<%=path+"/zui/dist/js/zui.min.js"%>></script>
</head>
<body>

<div class="container">
    <div class="panel">
        <div class="panel-heading">
            <a href=<%=path+"/client/login.jsp"%>>登录</a>&nbsp;&nbsp;&nbsp;
            <a href=<%=path+"/client/register.jsp"%>>注册</a>
        </div>
        <hr>
        <div class="panel-body">
            <div class="input-group">
                <div class="input-control search-box  has-icon-left has-icon-right search-example"
                     id="searchboxExample">
                    <input id="inputSearchExample3" type="search" class="form-control search-input"
                           placeholder="搜索">
                    <label for="inputSearchExample3" class="input-control-icon-left search-icon"><i
                            class="icon icon-search"></i></label>
                </div>
                <span class="input-group-btn">
                        <button class="btn btn-primary" type="button">搜索文档</button>
                    </span>
            </div>
        </div>
    </div>
</div>

</body>
</html>
