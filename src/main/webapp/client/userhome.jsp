<%@ page import="com.cykj.javabean.TabAdmin" %>
<%@ page import="com.cykj.javabean.TabUser" %><%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/5/12
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    TabUser user = (TabUser) request.getSession().getAttribute("user");
%>
<html>
<head>
    <title>用户主界面</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <%--    <link rel="stylesheet" href="<%=path%>/css/adminLogin.css">--%>
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
    <style>
        .layui-card-header{
            height: 50px;
        }
    </style>
</head>
<body>
<ul class="layui-nav">
    <div class="layui-row layui-col-md-offset1">
        <div class="layui-col-md2">
            <div class="grid-demo grid-demo-bg1">
                <li class="layui-nav-item ">
                    <a href="javascript:;">个人中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" id="">上传文件</a></dd>
                        <dd><a href="">下载文件</a></dd>
                    </dl>
                </li>
            </div>
        </div>
        <div class="layui-col-md2 layui-col-md-offset7">
            <div class="grid-demo">
                欢迎您，<%=user.getName()%>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">查看信息</a></dd>
                        <dd><a href="javascript:;">修改信息</a></dd>
                        <dd><a href="javascript:;">退了</a></dd>
                    </dl>
                </li>
            </div>
        </div>
    </div>
</ul>

<div class="layui-container">
    <div class="layui-col-md10 layui-col-md-offset1">
        <div class="layui-card">
            <div class="layui-card-header">
                <div class="layui-inline layui-col-md9">
                    <input class="layui-input" style="height: 30px" id="fileName" autocomplete="off">
                </div>
                <button class="layui-btn layui-btn-sm layui-btn-normal " id="searchBtn" data-type="reload">搜索</button><br>
<%--                <div class="layui-col-md4 layui-col-md-offset8 ">--%>
<%--                    <div class="layui-btn-container">--%>
                        <button type="button" class="layui-btn layui-btn-normal " id="test3">上传文件</button>
                        <button type="button" class="layui-btn layui-btn-normal " id="test4">下载文件</button><br>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <div class="layui-card-body">
                <table id="fileTable" lay-filter="fileTable"></table>
            </div>
        </div>
    </div>
</div>
<script>
    var $table;
    layui.use('table', function(){
        var $ = layui.jquery;
        var table = layui.table;
        //第一个实例
        $table=table.render({
            elem: '#fileTable'
            ,height: 312
            ,url: '/sharefiles/userControl/queryFileByUser' //数据接口
            ,page: {
                limit:5,
                limits:[5,10,15]
            }
            ,cols: [[ //表头
                {title: '序号', type: 'numbers',width:80, sort: true, fixed: 'left'}
                ,{field: 'fileId', title: 'ID',hide:true, width:80}
                ,{field: 'fileName', title: '文件名', sort: true}
                ,{field: 'filePath', title: '文件路径'}
                ,{field: 'fileSize', title: '文件大小'}
                ,{field: 'auditState', title: '状态',  sort: true}
                ,{field: 'uploadTime', title: '上传时间', sort: true}
            ]]
        });
        //======================模糊搜索重载表格======================
        var $ = layui.$, active = {
            reload: function(){
                var fileName = $('#fileName');
                //执行重载
                $table.reload({
                    url: '/sharefiles/userControl/queryFileByUser', //数据接口
                    method: "post",
                    page: {
                        curr: 1//重新从第 1 页开始
                    }
                    ,where: {
                        fileName: fileName.val(),
                    }
                }, 'data');
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        // $('#test4').click(function () {
        //     location.href="front_home.jsp"
        // })
    });
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            layer.msg(elem.text());
        });
    });

    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        //指定允许上传的文件类型
        upload.render({
            elem: '#test3'
            , url: '/sharefiles/userControl/upload' //改成您自己的上传接口
            , accept: 'file' //普通文件
            , done: function (res) {
                // alert(res+"\n"+typeof res+"\n"+res.msg+"\n"+typeof res.msg);

                layer.msg(res.msg);
                $table.reload();
            }
        });
    });



</script>
<script>

</script>
</body>
</html>
