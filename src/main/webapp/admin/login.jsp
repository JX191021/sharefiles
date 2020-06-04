<%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/5/12
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>管理员登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/adminLogin.css">
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
</head>
<body >
    <div class="layui-container">
        <div class="loginDiv">
            <form class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-input-block">

                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <h2>管理员登录</h2>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="account" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password"  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="<%=path%>/js/adminLogin.js"></script>

</body>
</html>
