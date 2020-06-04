<%@ page import="com.cykj.javabean.TabAdmin" %><%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/5/12
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    TabAdmin admin = (TabAdmin) request.getSession().getAttribute("admin");
%>
<html>
<head>
    <title>文档审核</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <%--    <link rel="stylesheet" href="<%=path%>/css/adminLogin.css">--%>
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
</head>
<body>

<div class="layui-container">
    <div class="layui-col-md10 layui-col-md-offset1">
        <div class="layui-card">
            <div class="layui-card-header">
                文档审核
<%--                <div class="layui-col-md4 layui-col-md-offset8 ">--%>
<%--                    <div class="layui-btn-container">--%>
<%--                        <button type="button" class="layui-btn layui-btn-normal " id="test3">上传文件</button>--%>
<%--                        <button type="button" class="layui-btn layui-btn-normal " id="test4">下载文件</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <div class="layui-card-body">
                <table id="fileTable" lay-filter="fileTable"></table>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="barDemo">
    <!-- 这里同样支持 laytpl 语法，如： -->
    {{#  if(d.auditState =="待审核"){ }}
    <a class="layui-btn layui-btn-xs" lay-event="audit">审核</a>
    {{#  } }}
    {{#  if(d.auditState =="审核通过"){ }}
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    {{#  } }}
</script>
<script>
    var $table;
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.jquery;

        //第一个实例
        var $table=table.render({
            elem: '#fileTable'
            ,height: 312
            ,url: '/sharefiles/adminControl/queryAllFile' //数据接口
            ,page: {
                limit:5,
                limits:[5,10,15]
            }
            ,cols: [[ //表头
                {title: '序号', type: 'numbers',width:80, sort: true, fixed: 'left'}
                ,{field: 'fileId', title: 'ID',hide:true, width:80}
                ,{field: 'userId', title: '用户ID', sort: true}
                ,{field: 'fileName', title: '文件名', sort: true}
                ,{field: 'filePath', title: '文件路径'}
                ,{field: 'fileSize', title: '文件大小'}
                ,{field: 'auditState', title: '状态',  sort: true}
                ,{field: 'uploadTime', title: '上传时间', sort: true}
                ,{fixed: 'right', title:'操作', align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
        });

        table.on('tool(fileTable)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent === 'audit') { //查看
                $.ajax({
                    url: "/sharefiles/adminControl/auditFile",
                    type: "POST",
                    dataType: "json",
                    data: {
                        fileId: data.fileId,
                        userId: data.userId
                    },
                    success: function (res) {
                        // alert(res+"\n"+typeof res+"\n"+res.msg+"\n"+typeof res.msg);

                        layer.msg(res.msg);
                        // layer.close(layer.index);//关闭提示弹窗
                        $table.reload();
                    }
                });
            }
        });
    });
    // layui.use('element', function(){
    //     var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
    //
    //     //监听导航点击
    //     element.on('nav(demo)', function(elem){
    //         layer.msg(elem.text());
    //     });
    // });

    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        //指定允许上传的文件类型
        upload.render({
            elem: '#test3'
            , url: '/sharefiles/userControl/upload' //改成您自己的上传接口
            , accept: 'file' //普通文件
            , done: function (res) {
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
