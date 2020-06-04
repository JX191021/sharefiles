<%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/4/11
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
//    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>用户注册</title>
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/zui/1.9.1/css/zui.min.css">
    <script type="text/javascript" src="<%=path%>/js/jqueryUtil.js"></script>
<%--    <!-- ZUI Javascript 依赖 jQuery -->--%>
<%--    <script src="http://cdnjs.cloudflare.com/ajax/libs/zui/1.9.1/lib/jquery/jquery.js"></script>--%>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/zui/1.9.1/js/zui.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/css/register.css">
    <script type="text/javascript" src="<%=path%>/js/register.js"></script>
</head>
<body>
<div class="container">
    <div class="regDiv">
        <form action="" id="regForm" class="form-horizontal form-condensed">
            <div class="form-group"style="text-align: center">
                    <h2>注册</h2><hr>
            </div>
            <div class="form-group">
                <label for="username" class="col-md-5 required has-success" >账号：</label>
                <div class="col-md-7 col-sm-10">
                    <input type="text" class="form-control" placeholder="请输入用户名" name="username" id="username">
                </div>
            </div>
<%--            <div class="help-block">这是帮助性提示文本。</div>--%>
            <div class="form-group">
                <label for="pwd" class="col-md-5 required" >密码：</label>
                <div class="col-md-7 col-sm-10">
                    <input type="password" class="form-control" placeholder="请输入密码" name="pwd" id="pwd">
                </div>
            </div>
            <div class="form-group">
                <label for="conPwd" class="col-md-5 required">确认密码：</label>
                <div class="col-md-7">
                    <input type="password" class="form-control" placeholder="请再次输入密码" id="conPwd" name="conPwd">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-5">性别：</label>
                <div class="col-md-3">
                    <label class="radio-inline" >
                        <input type="radio" name="sex" checked="checked">男
                    </label>
                </div>
                <div class="col-md-4">
                    <label class="radio-inline" >
                        <input type="radio" name="sex">女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-5" for="education">学历：</label>
                    <div class="col-md-7">
                        <select class="form-control" id="education">
                            <option selected="selected"></option>
                            <option value="初中">初中</option>
                            <option value="高中">高中</option>
                            <option value="大学">大学</option>
                        </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-5" for="occupation">职业：</label>
                <div class="col-md-7">
                    <select class="form-control" id="occupation">
                        <option selected="selected"></option>
                        <option value="程序员">程序员</option>
                        <option value="农民工">农民工</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-md-5">手机号：</label>
                <div class="col-md-7 col-sm-10">
                    <input type="text" class="form-control" placeholder="请输入11位手机号" name="phoneNum" id="phoneNum">
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-md-5">邮箱：</label>
                <div class="col-md-7 col-sm-10">
                    <input type="text" class="form-control" placeholder="请输入正确的邮箱地址" name="emailAddr" id="emailAddr">
                </div>
            </div>
            <div class="form-group" style="text-align: center">
                <div class="col-md-12">
                    <input type="button" class="button" value="注册" id="regBtn">
                    <input type="button" class="button" value="返回" id="backBtn">
                </div>
            </div>
<%--            <table class="regInfoTable">--%>
<%--                <th>--%>
<%--                <td colspan="3"><h2>用户注册</h2></td>--%>
<%--                </th>--%>
<%--                <tr>--%>
<%--                    <td ><label>用户名：</label></td>--%>
<%--                    <td colspan="2"><input type="text" placeholder="请输入用户名" name="username" id="username"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td > <label>密码：</label></td>--%>
<%--                    <td colspan="2"><input type="password" placeholder="请输入密码" name="pwd" id="pwd"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>确认密码：</td>--%>
<%--                    <td colspan="2"><input type="password" value="" placeholder="请再次输入密码" name="conPwd" id ="conPwd"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>性别：</td>--%>
<%--                    <td colspan="2">--%>
<%--                        <input name="sex" type="radio" checked="checked"/>男--%>
<%--                        <input name="sex" type="radio" />女--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>学历：</td>--%>
<%--                    <td colspan="2">--%>
<%--                        <select id="education">--%>
<%--                            <option selected="selected"></option>--%>
<%--                            <option value="初中">初中</option>--%>
<%--                            <option value="高中">高中</option>--%>
<%--                            <option value="大学">大学</option>--%>
<%--                        </select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>职业：</td>--%>
<%--                    <td colspan="2">--%>
<%--                        <select id="occupation">--%>
<%--                            <option selected="selected"></option>--%>
<%--                            <option value="程序员">程序员</option>--%>
<%--                            <option value="农民工">农民工</option>--%>
<%--                        </select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td > <label>手机号：</label></td>--%>
<%--                    <td colspan="2"><input type="text" name="phoneNum" placeholder="请输入手机号" id="phoneNum"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td > <label>Email：</label></td>--%>
<%--                    <td colspan="2"><input type="text" name="emailAddr" placeholder="请输入电子邮箱" id="emailAddr"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td colspan="3"style="text-align: center">--%>
<%--                        <input type="button" class="button" value="注册" id="regBtn">--%>
<%--                        <input type="button" class="button" value="返回" id="backBtn">--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>
        </form>
        <div id="messageBox"></div>
    </div>
</div>
</body>
</html>
