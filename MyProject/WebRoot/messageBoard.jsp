<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="entity.User"%>
<%@ page import="util.Jdbc"%>
<%@ page import="java.sql.*"%>
<%
		String realName = null;
		realName = new String(request.getParameter("username").getBytes("iso8859-1"), "utf-8");
	%>
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

.keleyitable  td, th {
	border: 1px solid green;
	margin-top: 10px;
}

.btnB1 {
	font-size: 24px;
	color: #fff;
	background: url("images/btn.png") no-repeat center top;
	background-size: 100px 40px;
	width: 100px;
	height: 40px;
	border: none;
	margin-left: 14px;
	margin-top: 1500px;
}

._Bg {
	height: 1380px;
	background-image: url(images/bg.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

._rap {
	opacity: 0.9;
}

._wrap {
	width: 40%;
	padding: 10px;
	margin: 0px auto;
	border: 0px solid #ccc;
	background: #fff;
}

.info_guest {
	float: left;
	font-family: Tahoma;
	font-size: 12px;
	list-style-type: none;
	position: relative;
	width: 70px;
	padding: 1px;
	margin: 0px auto;
	border: 0px solid #ccc;
	word-break: normal;
	word-wrap: break-word;
	z-index: 2;
}

.main_bd {
	padding: 1px;
	border: 0px solid #ccc;
	margin-left: 70px;
}

.userinfo {
	padding: 1px;
	border: 0px solid #ccc;
	margin: 1px;
}

.op {
	/*删除*/
	padding: 1px;
	border: 0px solid #ccc;
	margin: 1px;
}

.cont {
	padding: 1px;
	border: 0px solid #ccc;
	margin: 1px;
	margin-buttom: 10px;
}

.reply_wrap {
	padding: 1px;
	border: 0px solid #ccc;
	margin-top: 20px;
}

.comment_wrap {
	padding: 1px;
	border: 0px solid #ccc;
	margin: 1px;
}

#postButton {
	padding: 0px;
	border: 1px solid #ccc;
	margin-top: 10px;
}

#writein {
	width: 40%;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
	margin-bottom: 10px;
	background: #fff;
}

._tip {
	width: 400px;
	height: 24px;
	padding: 5px;
	border: 0px solid #ccc;
	margin: 1px;
}

._texta {
	margin-left: 70px;
}

._utton {
	padding: 1px;
	border: 0px solid #ccc;
	margin-top: 5px;
	margin-left: 70px;
}

._list {
	padding: 1px;
	border-top: 1px solid #ccc;
	margin: 10px 0px;
}

.fl {
	float: left;
}

.fr {
	float: right;
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
	function getfocus() {
		document.getElementById('_ta').focus()
	}
	function Getfocus() {
		document.getElementById('_lyz').focus()
	}
</script>
<script>
	function Ok_OnClick(event) {
		if (document.getElementsByName("textName")[0].value == "") {
			alert("请输入内容");
			return;
		} //getElementById  
		var table;
		var tableList = document.getElementsByTagName("TABLE");
		for (var i = 0; i < tableList.length; i++) {
			if (tableList[i].name == "tableName") {
				table = tableList[i]
				break;
			}
		}
		var value = document.getElementsByName("textName")[0].value;
		var index = table.rows.length;
		table.insertRow(index);
		table.rows(index).insertCell(0);
		table.rows(index).cells(0).innerText = value;
		document.getElementsByName("textName")[0].value = "";
	}
</script>   
<body class="_Bg">

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
		 	 <div>
				<embed src="music/secret.wav" style="FILTER:Xray" width=200
					height=45 type=audio/mpeg loop="true" autostart="false"
					controls="smallconsole" palette="red|black">
			</div> 
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
			<li><a href="personal.jsp?username=<%=realName%>"><img
					src="images/info.png"><br>个人档案</a></li>
			<li><a href="landscape.jsp?username=<%=realName%>"><img
					src="images/view.png"><br>路上风景</a></li>
			<li><a href="comment.jsp?username=<%=realName%>"><img
					src="images/dairy.png"><br>说说日志</a></li>
			<li><a href="messageBoard.jsp?username=<%=realName%>"><img
					src="images/dia.png"><br>留言板</a></li>
		</ul>
	</div>
	<!------------------------留言板------------------------>
	<div class="_rap">
		<div id="writein">
			<form action="show1.do" method="post">
				<div class="_tip">
					<p class="fl">
						<img id="" onclick="Getfocus()" style="width:24px; height:24px"
							alt="" src="images/dia.png">&nbsp;&nbsp;
					</p>
					<p>
						&nbsp;&nbsp;留言者:<input name="name" id="name" type="text" />
					</p>
				</div>
				<p class="_texta">
					<textarea cols="60" rows="5" name="memo" id="memo"
						placeholder="说点什么吧。";></textarea>
				</p>
				<input type="hidden" name="sub" value="true" /> <input
					type="hidden" name="lastaction" /> <input type="hidden"
					name="checknumc" />
				<div class="_utton">
					<p>
						<input class="button" type="submit" value="提交" /> <input
							class="button" type="reset" value="重写" />
					</p>
				</div>
			</form>
		</div>

		<div>
			<ui> 
			
			
			<%
				String name, memo, time,reply,replyTime;
				Connection conn = Jdbc.connect();
				Statement smt = conn.createStatement();
				ResultSet rs;
				String sql;
				sql = "select * from messa";
				rs = smt.executeQuery(sql);
				while (rs.next()) {
					name = rs.getString(1);
					memo = rs.getString(2);
					time = rs.getString(3);
					reply = rs.getString(5);
					replyTime = rs.getString(6);
					out.print("<li style='margin-bottom:10px;'>");
					out.print("<div class='_wrap'>");
					out.print("<!--留言者--------------------------------------------->");
					out.print("<div class='info_guest'>");
					out.print("<p class=''>");
					out.print("<a name='' title='逝' target='_blank' link=''>");
					out.print("<span class=''>&nbsp;</span>");
					out.print("<img id='' style='width:50px; height:50px' alt='' src='images/portrait2.jpg'>");
					out.print("</a>");
					out.print("</p>");
					out.print("</div>");
					out.print("<!--主要的块-------------------------------------------->");
					out.print("<div class='mainBox'>");
					out.print("<div class='main_bd'>");
					out.print("<p class='tit'>");
					out.print("<span class='userinfo'>");
					out.print("<span class='username' rel=''>");
					out.print("<a >"+name+"</a>");
					out.print("</span></span></p>");
					out.print("<div class='op fr'>");
					out.print("<p class='op_batch_processing'>");
					out.print("<a title='删除留言' class='c_tx' id='' href='deleteMessage.jsp?usertime="+time+"'>删除留言</a>");
					out.print("</p></div>");
					out.print("<div class='cont' id=''>");
					out.print("<table style='width:100%;word-break: break-all;'>");
					out.print("<tbody>");
					out.print("<tr><td>");
					out.print("<p>"+memo+"</p><wbr>");
					out.print("</td>");
					out.print("</tr></tbody></table>");
					out.print("<p class='reply_wrap'>");
					out.print("<span class='' style='color:gray'>"+time+"&nbsp;</span>");
					out.print(
							"<a title='回复' class='' onclick='getfocus()' value='reply' uin='' commentid=''>回复</a>");
					out.print("</p>");
					out.print("</div>");
					out.print("<!--回复区----------------------------------------------->");
					out.print("<div class='comment_wrap'>");
					out.print("<form action='show4.do' method='post'>");
					out.print("<div class='omment' id='' style='width: 376px;'>");
					out.print("<ol id='' style='display:none;'></ol>");
					out.print("<div class='comment_post' id='' style=''>");
					out.print("	<p class='comment_textarea fl'>");
					out.print("<span>");
					out.print(
							"<textarea class='textarea textinput' id='reply' name='reply' rows='2' cols='60' placeholder='说点什么吧。';></textarea>");
					out.print("</span></p>");
					out.print("<p class='comment_option'>");
					out.print("<span class='comment_sub'>");
					out.print("<input  type='submit' value='确定'>");
					out.print("</span></p>");
					out.print("</div></div></form></div>");
					out.print("<!------------------------------------------------------------->");
					if (reply!=null)
					{
					out.print("<div class='_list'>");
					out.print("<ul>");
					out.print("<li class='_reply-list' >");
					out.print("<div class=''><div class=''><div class=''>");
					out.print("<a href='' target=''>");
					out.print(
							"<img style='width:24px; height:24px ; padding:10px;' alt='' src='images/portrait2.jpg' link=''>");
					out.print("</a></div>");
					out.print("<div class=''>");
					out.print("<a class='' href='' target='_blank' link=''>评论者的名字</a>&nbsp;:&nbsp;&nbsp;"+reply);
					out.print("<div class=''>");
					out.print("<a class='reply' href='javascript:;' >");
					out.print("<a title='删除回复' class='fr' href='deleteReply.jsp?userreplyTime="+replyTime+"' onclick='getfocus()' value='reply' uin='' commentid=''>删除回复</a>");
					out.print("<br>");
					out.print("<span class='' style='background:white; color:gray'>"+replyTime+"&nbsp;</span>");
					out.print("</a></div></div></div></div>");
					out.print("</li></ul>");
					out.print("</div></div></div></div>");
					out.print("</li>");
					}
				}
			%>
			
			</ui>
		</div>
	</div>
    <div class="tobottom">
		<a></a>
	</div>
</body>
</html>
