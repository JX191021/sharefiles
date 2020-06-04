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
    <title>等级管理</title>
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
    <table id="level" lay-filter="levelTable"></table>
</div>
<form class="layui-form" style="display: none" lay-filter="updateForm" id="updateForm">
    <div class="layui-form-item">
        <label class="layui-form-label">等级名称</label>
        <div class="layui-input-inline">
            <input type="text" name="levelName" id="levelName" lay-verify="required" placeholder="请输入名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上传奖励</label>
        <div class="layui-input-inline">
            <input type="text" name="uploadIntegral" id="uploadIntegral" lay-verify="required" placeholder="请输入名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">下载奖励</label>
        <div class="layui-input-inline">
            <input type="text" name="downloadIntegral" id="downloadIntegral" lay-verify="required" placeholder="请输入名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
</form>
<%--表头工具栏--%>
<script type="text/html" id="toolbarDemo">
    <div class="demoTable layui-inline">
        <button class="layui-btn layui-btn-sm " lay-event="add">添加</button>
        <button class="layui-btn layui-btn-sm " lay-event="delete">删除</button>
    </div>
</script>
<%--表格行内工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
            elem: '#level',
            even: true,
            url: '/sharefiles/LevelManageServlet?method=selectLevel', //数据接口
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
                {field: 'levelId', title: 'ID', hide: true, style: 'display:none;', sort: true},
                {field: 'levelName', title: '等级名称'},
                {field: 'uploadIntegral', title: '上传奖励'},
                {field: 'downloadIntegral', title: '下载奖励'},
                {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
        });

        //====================监听表头工具栏事件=========================
        table.on('toolbar(levelTable)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data //获取选中的数据
                , idList = [];
            data.forEach(function (name, value) {
                idList.push(name.userId);
            })
            switch (obj.event) {
                //==================批量删除==================
                case 'delete':
                    alert(idList)
                    if (idList.length > 0) {
                        layer.confirm("确定删除？",//提示是否删除
                            {btn: ['确定', '取消'], title: "提示"},
                            function () {
                                $.ajax({
                                    url: "/sharefiles/LevelManageServlet",
                                    type: "POST",
                                    dataType: "text",
                                    data: {method: "deleteLevel", idList: JSON.stringify(idList)},
                                    success: function (msg) {
                                        alert(msg);
                                        layer.close(layer.index);//关闭提示弹窗
                                        $table.reload();
                                    }
                                })
                            });
                    } else {
                        layer.alert('请选择删除项');
                    }
                    break;
                case 'add':
                    layer.open({
                        title: "添加",
                        type: 1,
                        skin: 'layui-layer-rim',
                        area: ['350px', '360px'], //宽高  类型：String/Array，默认：'auto'
                        shadeClose: true,//点击其他地方关闭
                        //类型：String/DOM/Array，默认：''
                        content: $("#updateForm"),
                        btn: ['确定', '取消'],
                        //点击修改表单的确定按钮
                        yes: function (index) {
                            $.ajax({
                                url: "/sharefiles/LevelManageServlet",
                                type: "POST",
                                dataType: "text",
                                data: {method: "addLevel",levelName: $('#levelName').val()
                                    ,uploadIntegral: $('#uploadIntegral').val(),downloadIntegral: $('#downloadIntegral').val()},
                                success: function (msg) {
                                    layer.close(index);//关闭修改弹窗
                                    layer.msg(msg);
                                    $table.reload();
                                }
                            });
                        },
                        btn2: function (index) {
                            layer.close(index)
                        }
                    });

                    break;
            };
        });
        //================监听行工具事件=======================
        table.on('tool(levelTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                    layer.open({
                        title: "修改",
                        type: 1,
                        skin: 'layui-layer-rim',
                        area: ['350px', '360px'], //宽高  类型：String/Array，默认：'auto'
                        shadeClose: true,//点击其他地方关闭
                        //类型：String/DOM/Array，默认：''
                        content: $("#updateForm"),
                        btn: ['确定', '取消'],
                        success: function () {
                            form.val('updateForm', data);
                        },
                        //点击修改表单的确定按钮
                        yes: function (index) {
                            $.ajax({
                                url: "/sharefiles/LevelManageServlet",
                                type: "POST",
                                dataType: "text",
                                data: {method: "updateLevel", levelId: data.levelId, levelName: $('#levelName').val()
                                    ,uploadIntegral: $('#uploadIntegral').val(),downloadIntegral: $('#downloadIntegral').val()},
                                success: function (msg) {
                                    layer.close(index);//关闭修改弹窗
                                    layer.msg(msg);
                                    $table.reload();
                                }
                            });
                        },
                        btn2: function (index) {
                            layer.close(index)
                        }
                    });

            }
        });
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        var $ = layui.jquery;
        // var dateStr = "";
        laydate.render({
            elem: '#date'
            ,range: '~',
            // done: function(value, date, endDate){
            //     // alert(value); //得到日期生成的值，如：2017-08-18
            //     // dateStr=value;
            // }
        });

    })

</script>
</body>
</html>
