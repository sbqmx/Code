<html lang="zh-ch">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<title>网址大全</title>
	<link href="CSS/index.css" rel="stylesheet" type="text/css">
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<body onload="getD()">
<h2>Hello World!</h2>
<a href="http://www.wrox.com/WileyCDA/WroxTitle/Professional-Java-for-Web-Applications.productCd-1118656466,descCd-DOWNLOAD.html">Professional Java Web Application代码下载地址</a>
<a href="wazzup">HelloServlet</a>
<a href="checkboxes">MultiValueParameterServlet</a>
<a href="contextParameters">ContextParameterServlet</a>
<a href="servletParameters">ServletParameterServlet</a>
<a href="shop">Shopping-Cart项目</a>
<a href="tickets">客户支持项目</a>
<a href="profile">UserProfile项目</a><i>——练习EL表达式</i>
<div id="demo1">
	<ul>
		<li><a href="http://www.zcool.com.cn" target="_blank">站酷</a></li>
		<li><a href="http://www.baidu.com" target="_blank">百度</a></li>
	</ul>
</div>
<div id="demo2">
	<form action="/Code/greeting" method="get">
		<span>姓名</span><input type="text" id="name" name="name"><br>
		<span>昵称</span><input type="text" id="nicheng" name="nicheng"><br>
		<button type="submit">提交</button>
	</form>
</div>
<div id="demo3">
	<button onclick="msg(this.innerHTML)">点击测试</button>
	<p id="stoor"></p>
	<p id="date"></p>
</div>
<div id="demo4">
	<p id="img-alt">鼠标悬停在图片上时此处显示图片说明，且页面背景更换为该图</p>
	<img alt="眼睛" src="IMG/cf3d8dcdfca9737248e655181a280e79.png" onmouseover="showImgAlt(this)" onmouseleave="recover()">
	<img alt="小猫" src="IMG/a79dac4c194e29223c746f9fc3c23f78.png" onmouseover="showImgAlt(this)" onmouseleave="recover()">
	<img alt="女孩" src="IMG/82b78044588e744dae537953de534dd5.png" onmouseover="showImgAlt(this)" onmouseleave="recover()">
</div>
</body>
<script type="text/javascript" src="JS/index.js"></script>
</html>
