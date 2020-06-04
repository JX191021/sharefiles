<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Layui</title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <%--        <link rel="stylesheet" href="<%=path+"/layui/css/layui.css"%>"  media="all">--%>
    <%--        <link rel="stylesheet" href=<%=path+"/css/layui.css"%>  media="all">--%>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">


    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--        <div class="demo-tree" id="test7"></div>--%>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>开启节点操作图标</legend>
</fieldset>

<div class="demo-tree demo-tree-box" id="test9" style="width: 200px; height: 300px; overflow: scroll;"></div>

<%--        <script src="<%=path+"/layui/layui.js"%>" charset="utf-8"></script>--%>
<%--        <script src=<%=path+"/js/layui.js"%>></script>--%>
<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['tree', 'util'], function(){
        var tree = layui.tree
            ,layer = layui.layer
            ,util = layui.util
            //模拟数据1
            ,data1 = [{
                title: '江西'
                ,id: 1
                ,children: [{
                    title: '南昌'
                    ,id: 1000
                    ,children: [{
                        title: '青山湖区'
                        ,id: 10001
                    },{
                        title: '高新区'
                        ,id: 10002
                    }]
                },{
                    title: '九江'
                    ,id: 1001
                },{
                    title: '赣州'
                    ,id: 1002
                }]
            },{
                title: '广西'
                ,id: 2
                ,children: [{
                    title: '南宁'
                    ,id: 2000
                },{
                    title: '桂林'
                    ,id: 2001
                }]
            },{
                title: '陕西'
                ,id: 3
                ,children: [{
                    title: '西安'
                    ,id: 3000
                },{
                    title: '延安'
                    ,id: 3001
                }]
            }]


        //开启节点操作图标
        tree.render({
            elem: '#test9'
            ,data: data1
            ,edit: ['add', 'update', 'del'] //操作节点的图标
            ,click: function(obj){
                layer.msg(JSON.stringify(obj.data));
            }
        });


        //按钮事件
        util.event('lay-demo', {
            getChecked: function(othis){
                var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据

                layer.alert(JSON.stringify(checkedData), {shade:0});
                console.log(checkedData);
            }
            ,setChecked: function(){
                tree.setChecked('demoId1', [12, 16]); //勾选指定节点
            }
            ,reload: function(){
                //重载实例
                tree.reload('demoId1', {

                });

            }
        });




    });
</script>

</body>
</html>