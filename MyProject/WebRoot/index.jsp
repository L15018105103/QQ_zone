<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<base href="<%=basePath%>">
<title>用户登录</title>
<style type="text/css">
.fixed_div {
	position: fixed;
	left: 450px;
	bottom: 180px;
	width: 600px;
	color: #FFFFFF;
}
</style>
</head>
<body background="image/firstPage.png">
	<div class="fixed_div">
		<form action="show.do" method="post">
			<label for="id">账 号：</label> <input type="text" id="id" name="id"
				size="35" /> <a href="registerPage.html"
				style="margin-left: 10px; text-decoration: none;color:lightblue">
				注册新账号</a><br> <br> <label for="password">密 码：</label> <input
				type="password" id="password" name="password" size="35" /> <a
				href="returnPassWord.html"
				style="margin-left: 10px; text-decoration: none;color:lightblue">
				取回密码</a><br> <br> <input type="submit" value="登录"
				style="margin-left:348px;width:100px" />
		</form>
	</div>
</body>
</html>