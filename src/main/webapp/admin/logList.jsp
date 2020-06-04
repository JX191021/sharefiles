<%--
  Created by IntelliJ IDEA.
  User: sky
  Date: 2020/5/13
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>日志列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <style>
        .layui-table-view .layui-form-checkbox[lay-skin="primary"] i {
            top: 40%;
        }
    </style>
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>

</head>
<body>
<div class="layui-container" style="margin-top: 15px">
    <table id="demo" lay-filter="test"></table>
</div>

<%--表头工具栏--%>
<script type="text/html" id="toolbarDemo">
    <div class="demoTable layui-inline">
        <button class="layui-btn layui-btn-sm " lay-event="delete">删除</button>
    </div>
</script>
<%--表格行内工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs " lay-event="delete">删除</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer
            , form = layui.form;
        //第一个实例
        var $table = table.render({
            toolbar: '#toolbarDemo',
            method: "POST",
            elem: '#demo',
            even: true,
            url: '/sharefiles/LogServlet?methodName=selectPage', //数据接口
            page: {
                limit: 5,//指定每页显示的条数
                limits: [5, 10, 15, 20,
                    25, 30, 35, 40, 45, 50],
            },//每页条数的选择项
            // true //开启分页
            cols: [[
                //添加复选框
                {type: 'checkbox', fixed: 'left'},
                //表头字段名（类属性），标题      排序
                {title: '序号', type: 'numbers'},
                {field: 'logId', title: 'ID', hide: true, style: 'display:none;'},
                {field: 'operator', title: '操作人'},
                {field: 'operationItem', title: '操作事项'},
                {field: 'operationTime', title: '操作时间'},
                {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
        });

        //====================监听表头工具栏事件=========================
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data //获取选中的数据
                , idList = [];
            data.forEach(function (name, value) {
                idList.push(name.logId);
            })
            switch (obj.event) {
                //==================批量删除==================
                case 'delete':
                    if (idList.length > 0) {
                        layer.confirm("确定删除？",//提示是否删除
                            {btn: ['确定', '取消'], title: "提示"},
                            function () {
                                layer.close(layer.index);//关闭提示弹窗
                                $.ajax({
                                    url: "/sharefiles/LogServlet",
                                    type: "POST",
                                    dataType: "text",
                                    data: {methodName: "deleteLog", idList: JSON.stringify(idList)},
                                    success: function (msg) {
                                        alert(msg);
                                        $table.reload();
                                    }
                                })
                            });
                    } else {
                        layer.alert('请选择删除项');
                    }
                    break;
            }
            ;
        });


        //================监听行工具事件=======================
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定删除？', function (index) {
                    layer.close(index);//关闭提示层
                    var idList = [data.logId];
                    idList.push()
                    $.ajax({
                        url: "/sharefiles/LogServlet",
                        type: "POST",
                        dataType: "text",
                        data: {methodName: "deleteLog", idList: JSON.stringify(idList)},
                        success: function (msg) {
                            layer.msg(msg)
                            $table.reload();
                        }
                    });
                });
            }
        });
    });



</script>
</body>
</html>
