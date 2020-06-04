<%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/4/11
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    String path = request.getContextPath();
//    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登录</title>
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link rel="stylesheet" href=<%=path+"/zui/dist/css/zui.min.css"%>>
    <!-- ZUI Javascript 依赖 jQuery -->
    <script type="text/javascript" src=<%=path+"/zui/dist/lib/jquery/jquery.js"%>></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script type="text/javascript" src=<%=path+"/zui/dist/js/zui.min.js"%>></script>
<%--    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>--%>
<%--    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%--    <link rel="shortcut icon" href="#"/>--%>
    <link rel="stylesheet" href="<%=path%>/css/login.css">
    <script type="text/javascript" src="<%=path%>/js/login.js"></script>
</head>
<body onload="dj()">
<div class="container">
    <div class="loginDiv">
        <form action="" method="post" id="loginForm" class="form-horizontal">
            <fieldset>
                <legend><h2>用户登录</h2></legend>
            </fieldset>
            <div class="form-group">
                <div class="col-md-12 col-sm-12">
                    <input type="text" class="form-control" required placeholder="请输入用户名" title="请输入用户名" name="accout"
                           id="accout">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12 col-sm-12">
                    <input type="password" class="form-control" required placeholder="请输入密码" title="请输入密码" name="pwd"
                           id="pwd">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-7 col-sm-7">
                    <input type="text" class="form-control" placeholder="验证码（不区分大小写）" class="vcode" id="vcode">
                </div>
                <div class="col-md-5 col-sm-5">
                    <canvas id="canvas" onclick="dj()"></canvas>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12 col-sm-12">
                    <input type="button" value=" 登 录 " id="btnLogin" name="btnLogin" class="btn">
                    <input type="button" value=" 返 回 " id="backBtn" class="btn">
                </div>
            </div>
        </form>
        <div id="messageBox"></div>
    </div>
    <input type="hidden" value="${path}" id="path">
</div>

</body>
</html>
