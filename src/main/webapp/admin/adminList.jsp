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
    <title>管理人员列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <style>
        .layui-table-view .layui-form-checkbox[lay-skin="primary"] i {
            top: 40%;
        }

        /*#searchReload {*/
        /*    height: 30px;*/
        /*    width: 100px;*/
        /*}*/

    </style>
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>

</head>
<body>
<div class="layui-container" style="margin-top: 15px">
    搜索名字：
    <div class="layui-inline">
        <input class="layui-input" style="height: 30px" id="searchAdminName" autocomplete="off">
    </div>
    角色：
    <div class="layui-inline">
        <select name="roleName" style="height: 30px" id="searchRoleName">
            <option value=""></option>
            <option value="2">普通管理员</option>
            <option value="1">超级管理员</option>
        </select>
    </div>
    <button class="layui-btn layui-btn-sm " id="searchBtn" data-type="reload">搜索</button>
    <table id="demo" lay-filter="test"></table>
</div>
<%--添加管理员表单--%>
<form action="" method="" class="layui-form" style="display: none" id="regForm">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <input type="text" name="adminName" lay-verify="required" placeholder="请输入名称" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="account" lay-verify="required" placeholder="请输入账号" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" id="pwd" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input type="password" name="repass" lay-verify="required|confirmPass" placeholder="请再次输入密码"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select name="roleId" lay-verify="required">
                <option value=""></option>
                <option value="2">普通管理员</option>
                <option value="1">超级管理员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确定</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<%--修改的表单--%>
<form action="" method="" class="layui-form" style="display: none" lay-filter="updateForm" id="updateForm">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <input type="text" name="adminName" id="username" lay-verify="required" placeholder="请输入名称"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select name="roleName" id="roleName" lay-verify="">
                <option value=""></option>
                <option value="2">普通管理员</option>
                <option value="1">超级管理员</option>
            </select>
        </div>
    </div>
</form>
<%--表头工具栏--%>
<script type="text/html" id="toolbar">
    <div class="demoTable layui-inline">
        <button class="layui-btn layui-btn-sm " lay-event="add">添加</button>
        <button class="layui-btn layui-btn-sm " lay-event="delete">删除</button>
    </div>
</script>
<%--表格行内工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="singleDelete">删除</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer
            , form = layui.form;
        //第一个实例
        var $table = table.render({
            toolbar: '#toolbar',
            method: "POST",
            elem: '#demo',
            even: true,
            url: '/sharefiles/adminControl/selectAdminPage', //数据接口
            id: 'adminTable',
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
                {field: 'adminId', title: 'adminId', hide: true, style: 'display:none;', sort: true},
                {field: 'adminName', title: '名称'},
                {field: 'account', title: '账号', sort: true},
                {field: 'password', title: '密码'},
                {title: '角色',templet: '<div>{{d.tabRole.roleName}}</div>'},
                {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
        });

        //====================监听表头工具栏事件=========================
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data //获取选中的数据
                , idList = [];
            data.forEach(function (name, value) {
                idList.push(name.adminId);
            });
            switch (obj.event) {
                case 'add':
                    layer.open({
                        title: ['新增管理员', 'font-size:20px;'],
                        type: 1,//基本层类型  类型：Number，默认：0  可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
                        skin: 'layui-layer-rim', //样式名称  skin不仅允许你传入layer内置的样式class名，还可以传入您自定义的class名
                        area: ['350px', '360px'], //宽高  类型：String/Array，默认：'auto'
                        shadeClose: true,//点击其他地方关闭
                        //类型：String/DOM/Array，默认：''
                        content: $("#regForm"),
                        cancel: function (index, layero) {
                            layer.close(index)
                        }
                    });
                    break;
                //==================批量删除==================
                case 'delete':
                    // alert(JSON.stringify(idList))
                    if (idList.length > 0) {
                        layer.confirm("确定删除？",//提示是否删除
                            {btn: ['确定', '取消'], title: "提示"},
                            function () {
                                $.ajax({
                                    url: "/sharefiles/adminControl/deleteAdmin",
                                    type: "POST",
                                    dataType: "json",
                                    data: {
                                        'idList':idList
                                    },
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
                // case 'update':
                //     layer.msg('编辑');
                //     break;
            }
            ;
        });
        //======================模糊搜索重载表格======================
        var $ = layui.$, active = {
            reload: function(){
                var adminName = $('#searchAdminName');
                var roleName = $('#searchRoleName');
                //执行重载
                $table.reload({
                    url: '/sharefiles/AdminSelectPageServlet', //数据接口
                    method: "post",
                    page: {
                        curr: 1//重新从第 1 页开始
                    }
                    ,where: {
                        adminName: adminName.val(),
                        roleId:roleName.val()
                    }
                }, 'data');
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //================监听行工具事件=======================
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'singleDelete') {
                layer.confirm('确定删除？', function (index) {
                    $.ajax({
                        url: "/sharefiles/ActionOnAdminServlet",
                        type: "POST",
                        dataType: "text",
                        data: {methodName: "deleteAdmin", adminId: data.adminId},
                        success: function (msg) {
                            alert(msg)
                            if (msg.trim() == "deleteSuccess") {
                                obj.del();
                                layer.close(index);
                                $table.reload();
                            }
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    title: "修改",
                    type: 1,
                    skin: 'layui-layer-rim',
                    area: ['350px', '360px'], //宽高  类型：String/Array，默认：'auto'
                    shadeClose: true,//点击其他地方关闭
                    //类型：String/DOM/Array，默认：''
                    content: $("#updateForm"),
                    btn: ['确定', '取消'],
                    //点击修改表单的确定按钮
                    success: function () {
                        form.val('updateForm', data);
                    },
                    yes: function (index) {
                        $.ajax({
                            url: "/sharefiles/ActionOnAdminServlet",
                            type: "POST",
                            dataType: "text",
                            data: {methodName: "updateAdmin", adminId: data.adminId, adminName: $("#username").val(),roleId:$("#roleName").val()},
                            success: function (msg) {
                                layer.close(layer.index);//关闭提示弹窗
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
    //========================新增管理员表单提交==============================
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form;
        var $ = layui.jquery;
        form.verify({
            confirmPass: function (value) {
                if ($('#pwd').val() !== value)
                    return '两次密码输入不一致！';
            }
        });
        form.on('submit(formDemo)', function (data) {
            $.ajax({
                url: "/sharefiles/adminControl/addAdmin",
                type: "POST",
                dataType: "text",
                data: data.field,
                success: function (msg) {
                    layer.msg(msg)
                }
            });
            layer.close(layer.index);
            return false;
        });
    });

</script>
</body>
</html>
