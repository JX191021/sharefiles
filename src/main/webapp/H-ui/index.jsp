
<%--
Created by IntelliJ IDEA.
User: sky
Date: 2020/5/10
Time: 20:19
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
//    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<%--	<link rel="stylesheet" href="<%=path%>/H-ui/static/h-ui/css/H-ui.css">--%>
	<link rel="stylesheet" href="<%=path%>/H-ui/static/h-ui/css/H-ui.min.css">

<%--	<script type="text/javascript" src="<%=path%>/js/jqueryUtil.js"></script>--%>
<%--	<script type="text/javascript" src="<%=path%>/H-ui/static/h-ui/js/H-ui.js"></script>--%>

	<script type="text/javascript" src="<%=path%>/H-ui/static/h-ui/js/H-ui.min.js"></script>

	<style type="text/css">
.ui-sortable .panel-header{ cursor:move}
</style>
<title>用户主界面</title>
<meta name="keywords" content="关键词,5个左右,单个8汉字以内">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
</head>
<body ontouchstart>

<header class="navbar-wrapper">
	<div class="navbar navbar-black">
		<div class="container cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">H-ui前端框架</a>
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">简单 &middot; 免费 &middot; 适合中国网站</span>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
				<ul class="cl">
					<li class="current"><a href="/">首页</a></li>
					<li><a href="#">核心</a></li>
					<li><a href="#">扩展</a></li>
					<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">一级导航 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="#">二级导航</a></li>
							<li><a href="#">二级导航<i class="arrow Hui-iconfont">&#xe6d7;</i></a>
								<ul class="menu">
									<li><a href="javascript:;">三级菜单<i class="arrow Hui-iconfont">&#xe6d7;</i></a>
										<ul class="menu">
											<li><a href="javascript:;">四级菜单</a></li>
											<li><a href="javascript:;">四级菜单</a></li>
											<li><a href="javascript:;">四级菜单</a></li>
										</ul>
									</li>
									<li><a href="#">三级导航</a></li>
								</ul>
							</li>
							<li><a href="#">二级导航</a></li>
							<li class="disabled"><a href="javascript:;">二级菜单</a></li>
						</ul>
					</li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</nav>
			<nav class="navbar-userbar hidden-xs">
				
			</nav>
		</div>
	</div>
</header>


</body>
</html>
<!--H-ui前端框架提供前端技术支持 h-ui.net @2017-01-01 -->