<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="entity.User"%>
<%@ page import="util.Jdbc" %>
<%@ page import="java.sql.*" %>
<%!String realName = null;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>旅游日志</title>
<style type="text/css">
.fixed_div {
	position: relative;
	left: 1150px;
	top: 175px;
	width: 600px;
	color: #FFFFFF;
}
</style>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/sinaFaceAndEffec.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" rel="script" src="js/jquery.min.js"></script>
<script type="text/javascript" rel="script" src="js/index.js"></script>
<script type="text/javascript" rel="script" src="js/script.js"></script>
<script type="text/javascript" rel="script" src="js/comment.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/sinaFaceAndEffec.js"></script>
<body>
   <%
      String realName = null;
	  realName  = new String(request.getParameter("username").getBytes("iso8859-1"),"utf-8");
    %>
	<div class="top">
		<div class="myself-wrap">
			<input class="mysearchbox" type="text" maxlength="100"> <input
				class="myselfbox" type="button" maxlength="100"
				value="     Sea   LiuJunLue">
			<div class="mywelcome">
				欢迎来到<%
				out.print("<td>" + realName + "</td>");
			%>的个人空间
			</div>
			<!-- 	<div>
				<embed src="music/secret.wav" style="FILTER:Xray" width=200
					height=45 type=audio/mpeg loop="true" autostart="false"
					controls="smallconsole" palette="red|black">
			</div>-->
		</div>
		<!------------------------导航栏------------------------>
		<div class="head">
			<div class="saying">有的心是用钢铁造的，沉黑无比。有的心是用冰雪造的，高洁酷寒。
				有的心是用丝绸造的，柔滑飘逸。有的心是用玻璃造的，晶莹脆薄。 有的心是用竹子造的，锋利多刺。有的心是用木头造的，安稳麻木。
				有的心是用红土造的，粗糙朴素。有的心是用黄连造的，苦楚不堪。 有的心是用尸骸造的，腐恶熏天。有的心是用眼镜蛇唾液造的，剧毒凶残。</div>
			<div class="portrait">
				<span></span><img src="images/portrait2.jpg">
			</div>
		</div>
	</div>
	<div class="content-nav">
		<ul class="nav">
			<li><a href="index.jsp"><img src="images/home.png"><br>首页</a></li>
			<li><a href="personal.jsp?username=<%=realName%>"><img src="images/info.png"><br>个人档案</a></li>
			<li><a href="landscape.jsp?username=<%=realName%>"><img src="images/view.png"><br>路上风景</a></li>
			<li><a href="comment.jsp?username=<%=realName%>"><img src="images/dairy.png"><br>说说日志</a></li>
			<li><a href="messageBoard.jsp?username=<%=realName%>"><img src="images/dia.png"><br>留言板</a></li>
		</ul>
	</div>
	<!------------------------个人档------------------------>
		<div class="mainbg1">
		<a name="m-info"></a>
		<div class="content-intro">
			<div class="intro-wrapper">
				<div class="content-title">个人档案</div>
				<div class="sidetop">
					<ul>
						<li onmousemove="showpic(this)" onmouseout="hidepic(this)">
							<hr>1996
							<ul>
								<img src="images/born.png">
								<p>出生</p>
							</ul>
						</li>
						<li onmousemove="showpic(this)" onmouseout="hidepic(this)">
							<hr>2003
							<ul>
								<img src="images/child.png">
								<p>小学</p>
							</ul>
						</li>
						<li onmousemove="showpic(this)" onmouseout="hidepic(this)">
							<hr>2009
							<ul>
								<img src="images/middle.png">
								<p>中学</p>
							</ul>
						</li>
						<li onmousemove="showpic(this)" onmouseout="hidepic(this)">
							<hr>2015
							<ul>
								<img src="images/university.png">
								<p>大学</p>
							</ul>
						</li>
						<li onmousemove="showpic(this)" onmouseout="hidepic(this)">
							<hr>2019
							<ul>
								<img src="images/work.png">
								<p>工作</p>
							</ul>
						</li>
					</ul>
				</div>
				<div class="sidebottom">
					<a class="fir-bu">基本信息</a> <a class="sec-bu">兴趣爱好</a>
					<table cellpadding="6">
						<tr>
							<td>姓名:</td>
							<td>刘俊略</td>
						</tr>
						<tr>
							<td></td>
							<td>别名:</td>
							<td>Angelo</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>出生日期:</td>
							<td>1996.02.27</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>出生地:</td>
							<td>广东潮州</td>
						</tr>
						<tr>
							<td class="sec-hob">学知识</td>
							<td class="sec-hob">看书 / 打代码</td>
							<td></td>
							<td></td>
							<td>星座:</td>
							<td>白羊座</td>
						</tr>
						<tr>
							<td></td>
							<td class="sec-hob">去旅游</td>
							<td class="sec-hob">马尔代夫</td>
							<td></td>
							<td></td>
							<td>血型:</td>
							<td>A型血</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="sec-hob">养动物</td>
							<td class="sec-hob">狗（萨摩）</td>
							<td></td>
							<td></td>
							<td>职业:</td>
							<td>Web前端</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td class="sec-hob">听音乐</td>
							<td class="sec-hob">流行音乐</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="sec-hob">做运动</td>
							<td class="sec-hob">各种运动</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="sec-hob">尝美食</td>
							<td class="sec-hob">不甜不辣</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="sec-hob">偏安静</td>
							<td class="sec-hob">睡觉 / 发呆</td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>
	<div class="totop">
		<a></a>
	</div>
</body>
</html>
