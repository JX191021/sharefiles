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
    <title>用户列表</title>
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
    用户名：
    <div class="layui-inline">
        <input class="layui-input" style="height: 30px" id="searchAdminName" autocomplete="off">
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">日期范围</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="date" placeholder=" - ">
        </div>
    </div>
    <button class="layui-btn layui-btn-sm " id="searchBtn" data-type="reload">搜索</button>
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
    {{#  if(d.userState =="启用"){ }}
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="update">禁用</a>
    {{#  } }}

    {{#  if(d.userState =="禁用"){ }}
    <a class="layui-btn layui-btn-xs " lay-event="update">启用</a>
    {{#  } }}
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
            url: '/sharefiles/UserSelectPageServlet', //数据接口
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
                {field: 'userId', title: 'ID', hide: true, style: 'display:none;', sort: true},
                {field: 'name', title: '用户名'},
                {field: 'phone', title: '手机号', width: '15%'},
                {field: 'userIntegral', title: '积分'},
                {field: 'regTime', title: '注册时间',width: '18%'},
                {field: 'userState', title: '状态'},
                {field: 'education', title: '学历'},
                {field: 'occupation', title: '工作'},
                {title: '等级', templet: '<div>{{d.tabLevel.levelName}}</div>'},
                {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
        });

        //====================监听表头工具栏事件=========================
        table.on('toolbar(test)', function (obj) {
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
                                    url: "/sharefiles/ActionOnUserServlet",
                                    type: "POST",
                                    dataType: "text",
                                    data: {method: "deleteUser", idList: JSON.stringify(idList)},
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
            }
            ;
        });
        //======================模糊搜索重载表格======================
        var $ = layui.$, active = {
            reload: function () {
                var userName = $('#searchAdminName').val();
                var dateStr = $('#date').val();
                //执行重载
                $table.reload({
                    url: '/sharefiles/UserSelectPageServlet', //数据接口
                    method: "post",
                    page: {
                        curr: 1//重新从第 1 页开始
                    }
                    , where: {
                        userName: userName,
                        dateStr: dateStr
                    }
                }, 'data');
            }
        };

        $('#searchBtn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //================监听行工具事件=======================
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'update') {
                layer.confirm('确定修改用户状态？', function (index) {
                    layer.close(index);//关闭提示层
                    $.ajax({
                        url: "/sharefiles/ActionOnUserServlet",
                        type: "POST",
                        dataType: "text",
                        data: {method: "updateState", userId: data.userId, state: data.userState},
                        success: function (msg) {
                            layer.msg(msg)
                            $table.reload();
                        }
                    });
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
