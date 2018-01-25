<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="entity.User"%>
<%@ page import="util.Jdbc"%>
<%@ page import="java.sql.*"%>
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

._tip {
	width: 554px;
	height: 20px;
	padding: 10px;
	border: 0px solid #ccc;
	margin: 10px;
	background: #fff;
}

._bg {
	background-image: url(images/bg.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	height: 1380px;
}

.shuoshuo {
	width: 872px;
	height: auto;
	margin: auto;
	background: #ffffff;
	opacity: 0.95;
}

._photoBox {
	width: 50px;
	height: 76px;
	border: 1px solid #ccc;
	line-height: 80px;
	background: #ffffff;
}

._otherBox {
	width: 48px;
	height: 16px;
	padding: 1px;
	border: 1px solid #ccc;
	line-height: 22px;
	background: #ffffff;
}

._textarea {
	height: 80px;
	width: 420px; placeholder ="说点什么吧。";
	background-color: #ffffff;
}

.text {
	width: 855px;
	height: 80px;
	padding: 10px;
	border: 1px;
	margin: 0px;
	margin-left: auto;
	margin-right: auto;
}

._wordBox {
	width: 852px;
	height: 210px;
	padding: 0px;
	border: 10px solid #fff;
	border-top: 12px solid #fff;
	margin: 1px;
	background: #ffffff;
}

._button {
	width: 576px;
	height: 22px;
	padding: 1px;
	border: 0px solid #ccc;
	margin-top: 5px;
	margin-left: 10px;
	line-height: 82px;
	background: #ffffff;
}

._comment {
	width: 456px;
	height: 19px;
	padding: 1px;
	border: 0px solid #ccc;
	margin-top: 20px;
	margin-left: 116px;
	background: #fff;
}

.textarea {
	width: 460px;
	padding: 1px;
	border: 1px solid #ccc;
	margin-left: 1px;
	background: #fff;
}

.l {
	width: 445px;
	padding: 1px;
	border: 0px solid #ccc;
	margin: 10px 110px;
	background: #fff;
}

.bd {
	width: 440px;
}

.list {
	padding: 1px;
	border: 0px solid #ccc;
	margin: 0px;
}

.reply-list {
	width: 440px;
	padding-top: 5px;
	padding-bottom: 5px;
	border-top: 1px solid #ccc;
	border-left: 10px solid #fff;
	border-right: 10px solid #fff;
	margin: 10px;
	margin-left: 116px;
	background: #fff;
}

.fl {
	float: left;
}

.fr {
	float: right;
}

li {
	display: list-item;
	float: left;
	list-style: none;
	text-align: left;
	margin-top: 40px;
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
<script type="text/javascript">
	function setFocus() {
		document.getElementById('content').focus()
	}
	function formReset() {
		document.getElementById('content').reset()
	}
</script>
<%
    String realName = null;
	realName  = new String(request.getParameter("username").getBytes("iso8859-1"),"utf-8");
%>
<body class="_bg">
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
	<div class="">
		<div>
			<div class="shuoshuo">
				<form action="show3.do" method="post">
					<div class="_tip">
						<!-- 设置说说标签 -->
						<ui>
						<li onclick="setFocus()">我的昵称</li>
						<textarea class="textarea fl" name="name" id="name" rows="2" cols="30" style="height:20px;width:200px"
							onpropertychange="if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5"
							placeholder="请输入您的昵称。" background-color: #f6f6f6></textarea>
						</ui>
					</div>

					<div class="text">
						<!-- 设置文本域-->
						<textarea class="_textarea fl" name="memo" id="memo" rows="6" cols="80"
							onpropertychange="if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5"
							placeholder="说点什么吧。" background-color: #f6f6f6></textarea>
						<ui class="">
						<li class="_photoBox"><a href="javascript:void(0);"><img
								width="52" height="82" alt="照片" src="images/camera.jpg"></a></li>
						<li class="_photoBox"><a href="javascript:void(0);"><img
								width="52" height="82" alt="其他" src="images/other.jpg"></a></li>
						<li class="_photoBox"><a href="javascript:void(0);"><img
								width="52" height="82" alt="趣味表情" src="images/fun.jpg"></a></li>
						</ui>
					</div>
					<div class="_button">
						<ui class="fl">
						<li class="_otherBox"><a href="#"><img alt="插入表情" src="images/mod.jpg"></a></li>
						<li class="_otherBox"><a href="#"><img alt="提到好友" src="images/@.jpg"></a></li>
						<li class="_otherBox"><a href="#"><img alt="插入话题" src="images/topic.jpg"></a></li>
						</ui>
						<input class="fr" type="submit" value="发表" line-height:80px />
				</form>
			</div>




			<!-- --------说说内容-------- -->
			<div>
				<%
					String name,memo,time,reply,replyTime,thumb;
					Connection conn = Jdbc.connect();
					Statement smt = conn.createStatement();
					ResultSet rs;
					String sql;
					sql = "select * from comment";
					rs = smt.executeQuery(sql);
					while (rs.next()) {
					    name = rs.getString(1);
						memo = rs.getString(2);
						time = rs.getString(3);
						reply = rs.getString(5);
						replyTime = rs.getString(6);
                        thumb = rs.getString(7);
                        if(thumb==null)
                        {
                        thumb=String.valueOf("0");
                        }
						out.print("<li class='_wordBox'>");
						out.print("<div class=' fl'>");
						out.print("<!--用户头像-->");
						out.print("<a onclick='return false;' profileuin='1120674415'>");
						out.print("<span ></span>");
						out.print("<img height='100' alt='逝(1120674415)' src='images/portrait2.jpg'></a>");
						out.print("</div>");
						out.print("<div class='l'>");
						out.print("<!--主要的块-->");
						out.print("<div class=''>");
						out.print("<div ></div>");
						out.print("</div>");
						out.print("<div class='bd'>");
						out.print("<!--主要的文本域-->");
						out.print("<!--用户名-->");
						out.print("<a onclick='return false;' data-uin='1120674415' profileuin='1120674415' profilepft='1'>"
								+ name + "&nbsp;</a>");
						out.print("<!--说说-->");
						out.print("<pre style='display:inline;''>" + memo + "");
						out.print("<!--表情-->");
						out.print("<img src='http://qzonestyle.gtimg.cn/qzone/em/e112.gif'>");
						out.print("</pre>");
						out.print("<span></span>");
						out.print("</div>");
						out.print("<div class='fr'>");
						out.print("<a href='thumbUpAction.jsp?usertime="+time+"'>赞("+Integer.parseInt(thumb)+")</a>");
						out.print("<a id='' onclick='' href='' target='_blank'>评论</a>");
						out.print("</div>");
						out.print("</div>");
						out.print("<div class='_comment'>");
						out.print("<!--评论区 -->");
						out.print("<form action='show5.do' method='post'>");
						out.print("<textarea class='textarea fl' id='reply' name='reply' rows='2' cols='80'"
								+ "onpropertychange='if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5'"
								+ "placeholder='评论点什么吧。' background-color: #f6f6f6></textarea>");
						out.print("<div class='fr'>");
						out.print("<a onclick='return false;' href='javascript:void(0)''>");
						out.print("<i ></i></a>");
						out.print("<input  type='submit' value='发表'>");
						out.print("</div>");
						out.print("<br>");
						out.print("<label for='' style='color:gray'>"+time+"</label>");
						out.print("</form>");
						out.print("</div>");
						out.print("<!--评论内容-->");
						if(reply!=null)
						{
						out.print("<div class='list'>");
						out.print("<ul>");
						out.print("<li class='reply-list'>");
						out.print("<div class=''>");
						out.print("<div class='single-reply'>");
						out.print("<div >");
						out.print("<a target='_blank'> <img alt='' src='images/portrait2.jpg' style='width:20px; height:20px;'> </a>");
						out.print("</div>");
						out.print("<div class=''>");
						out.print("<a class='' href='' target='_blank' link=''>评论者的名字</a>&nbsp;:"+reply);
						out.print("<br>");
						out.print("<div class='op'>");
						out.print("<a class='reply' href='javascript:;'> <b class='fr'>回复</b></a>");
						out.print("</div>");
						out.print("</div>");
						out.print("<br>");
						out.print("</div>");
						out.print("<label for='' style='color:gray'>"+replyTime+"</label>");
						out.print("</div>");
						out.print("</li>");
						out.print("</ul>");
						out.print("</div>");
						out.print("</li>");
						}
					}
				%>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
