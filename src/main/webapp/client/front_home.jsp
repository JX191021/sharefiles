<%--
  Created by IntelliJ IDEA.
  User: ALL BLUE
  Date: 2020/5/12
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">

    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->

</head>
<body class="layui-layout-body">
<%--<input type="hidden" id="userid" value="${sessionScope.user.id}">--%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><h2>文档共享平台</h2></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

<%--        <ul class="layui-nav layui-layout-right" id="unlogin">--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="<%=path%>/pages/front/jsp/front_login.jsp">登录</a>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="<%=path%>/pages/front/jsp/front_regist.jsp">注册</a>--%>
<%--            </li>--%>
<%--        </ul>--%>

        <ul class="layui-nav layui-layout-right" id="userlogin">
            <li class="layui-nav-item">
                <a id="wantupload">我要上传<span class="layui-badge-dot" ></span></a>
            </li>
<%--            <li class="layui-nav-item" lay-unselect="">--%>
<%--                <a href="javascript:;">--%>
<%--                    &lt;%&ndash;                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">&ndash;%&gt;--%>
<%--                    ${sessionScope.user.name}--%>
<%--                </a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="javascript:;">我的文档</a></dd>--%>
<%--                    <dd><a href="javascript:;">修改信息</a></dd>--%>
<%--                    <dd><a href="javascript:;">退出</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
        </ul>
    </div>
    <div class="querydiv">
        <div class="layui-inline">
            <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="请输入文档名称">
        </div>
        <button class="layui-btn" id="querybtn" data-type="reload">搜索</button>
    </div>


    <table class="layui-hide" id="test" lay-filter="test"></table>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="download">下载</a>
    </script>
</div>



<div id="uploaddiv" hidden>
    <form class="layui-form" action="" id="testForm" layer-filter="testForm">
        <div class="layui-form-item">
            <label class="layui-form-label">文档标题：</label>
            <div class="layui-input-block">
                <input type="text" name="fileTitle" id="adminname" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">下载积分：</label>
            <div class="layui-input-block">
                <input type="text" name="downintegral" id="downintegral" required  lay-verify="required" placeholder="请输入下载积分" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <%--            <label class="layui-form-label">请选择文档：</label>--%>
            <div class="layui-input-block">
                <div class="layui-upload">
                    <button type="button" class="layui-btn layui-btn-normal" id="uploadfile">选择文件</button>
                    <button type="button" class="layui-btn layui-btn-normal" id="btndemo">aaa</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" id="bottom_btn">
                <button class="layui-btn formbtn" id="confirmbtn" lay-submit lay-filter="insertconfirm">立刻上传</button>
                <button type="reset" id="reset" class="layui-btn layui-btn-primary formbtn">重置</button>
            </div>
        </div>
    </form>
</div>

<%--<div class="layui-upload">--%>
<%--    <button type="button" class="layui-btn layui-btn-normal" id="uploadfile1">选择文件</button>--%>
<%--    &lt;%&ndash;                    <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>&ndash;%&gt;--%>
<%--     <button type="button" class="layui-btn" id="test9">开始上传</button>--%>
<%--</div>--%>


<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.use('table', function(){
        // var element = layui.element;
        var table = layui.table;
        var $ = layui.jquery
        table.render({
            elem: '#test'
            ,url:'/DocShare0508/userControl/filePage'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: []//自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
            ,title: '用户数据表'
            ,cols: [[
                // {type: 'checkbox',fixed: 'left'}
                {field:'id', width: 80, title: '序号'}
                ,{field:'fileTitle', width: 130, title: '文档标题'}
                ,{field:'userId', width: 130, title: '上传人'}
                // ,{field:'rolename', title: '角色', templet: '<div>{{d.role.name}}</div>'}
                ,{field:'uploadTime', width: 130, title: '上传时间'}
                ,{field:'createDate', width: 130, title: '下载积分'}
                ,{field:'typeName', width: 130, title: '文档类型', templet: '<div>{{d.tbSuffix.typeName}}</div>'}
                ,{field:'createDate', width: 121, title: '下载次数'}
                ,{fixed: 'right',title:'操作', width: 180, toolbar: '#barDemo'}
            ]]
            ,page: {limit: 5,//指定每页显示的条数
                limits: [5, 10, 15, 20,
                    25, 30, 35, 40, 45, 50],},//每页条数的选择项
        });


        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)s
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'download'){
                layer.alert("table.on---点击下载")

            }
        });

        // layer.alert("table.on---点击选择文件")
        // layer.alert("渲染文件上传-----")


        // $("#btndemo").click(function () {
        //     layer.alert("点击选择文件aaaa000000")
        // })
        // $("#uploaddiv").on("click","#btndemo",function () {
        //     layer.alert("点击选择文件aaaa000000")
        // })
        var form = layui.form;
        // var element = layui.element;
        $("#wantupload").on("click",function () {
            // layer.alert("a---点击上传")
            layer.open({
                type: 1
                ,title: '文档上传'
                ,area: ['500px','360px']
                // ,shade: [0.8, '#314949'] //遮罩
                ,resize: false //不可拉伸
                ,content: $('#uploaddiv')//内容
                ,btn: 0

                //如果设定了yes回调，需进行手工关闭
            });
            // element.render('form','testForm');


            layui.use('form', function(){
                form.render();
                form.on('submit(insertconfirm)', function(data){

                    layer.alert("点击提交")
                    return false;
                });
            });
        });

        layui.use('upload', function() {

            var upload = layui.upload;

            upload.render({
                elem: '#uploadfile',
                url: '/DocShare0508/userControl/upload',
                auto: false,//选择文件后不自动上传
                bindAction: '#confirmbtn',
                accept: 'file',
                size: 102400, //限制文件大小，单位 KB
                // exts:'zip|rar|7z',
                //上传前的回调

                //操作成功的回调
                done: function (res, index, upload) {
                    var code = res.code === 0 ? 1 : 2;
                    layer.alert(res.msg, {icon: code}, function () {
                        parent.window.location.reload();
                    })
                },
                //上传错误回调
                error: function (index, upload) {
                    layer.alert('上传失败！' + index);
                }
            });
        });
        // layui.use('upload', function() {
        //     var $ = layui.jquery
        //         , upload = layui.upload;
        //     upload.render({
        //         elem: '#uplodfile'
        //         ,url: 'https://httpbin.org/post' //改成您自己的上传接口
        //         ,auto: false
        //         //,multiple: true
        //         ,bindAction: '#btndemo'
        //         ,done: function(res){
        //             layer.msg('上传成功');
        //             console.log(res)
        //         }
        //     });
        // });

    });



</script>

</body>
</html>
