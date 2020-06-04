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
    <title>菜单管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>菜单管理</legend>
</fieldset>
<form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
    <div class="layui-form-item">
        <label class="layui-form-label">选择角色：</label>
        <div class="layui-input-inline">
            <select name="city" lay-filter="demo" lay-verify="required">
                <option value=""></option>
                <option value="1">超级管理员</option>
                <option value="2">普通管理员</option>
            </select>
        </div>
    </div>
</form>

<div class="layui-container">
    <div id="test9" class="demo-tree demo-tree-box" style="width: 250px; height: 380px; overflow: scroll;"></div>
</div>

<script>
    layui.use(['tree', 'util','form'], function(){
        var tree = layui.tree
            ,layer = layui.layer
            ,util = layui.util
            ,form = layui.form
            ,$ = layui.jquery
        form.on('select(demo)', function (data) {
            // alert(data.value); // 获取选中的值
            $.post({
                url: "/sharefiles/adminControl/queryFirstMenu",
                data:{roleId:data.value},
                dataType: "json",
                success: function (res) {
                    //开启节点操作图标
                    tree.render({
                        elem: '#test9'
                        ,data: res
                        ,showCheckbox: true
                        ,edit: ['add', 'update', 'del'] //操作节点的图标
                        ,click: function(obj){
                            layer.msg(JSON.stringify(obj.data));
                        }
                    });
                }
            })
        });

    });

</script>

</body>
</html>
