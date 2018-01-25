<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<!------------------------留言板------------------------>
	<div class="_rap">
		<div id="writein">
			<form action="show6.do" method="post">
				<div id="enterImage">
				<img src="style/images/fwindow.png" />
			</div>
			<div id="iconImage">
				<a id="iconClose" title="iconClose">iconClose</a>
			</div>
			<!-- <div id="buttonImage">
				<img src="style/images/ensure.png" id="buttonSure" /> <img
					src="style/images/cancel.png" id="buttonCancel" />
			</div> -->
			<div id="enterLabel">
				<label>系统时钟:</label><br>
				<br> <label>内存块数(<9999):</label><br>
				<br> <label>内存块的大小(<999):</label><br>
				<br> <label>硬盘大小:</label><br>
				<br> <label>每个作业分配的页面数:</label><br>
				<br> <label>每个进程分配的时间片:</label><br>
				<br> <label>页表缓冲:</label>
			</div>
			<div id="enterInput">
				<input id="clock" name="clock"  type="text"/><br>
				<br> <input id="blockNumber" name="blockNumber" type="text"/><br>
				<br> <input id="blockSize" name="blockSize" value="4" type="text"/><br>
				<br> <input id="hardDisk" name="hardDisk" value="10" type="text"/><br>
				<br> <input id="pageCount" name="pageCount" value="2" type="text"/><br>
				<br> <input id="timeSlice" name="timeSlice" value="1" type="text"/><br>
				<br> <input id="pageBuffer" name="pageBuffer" value="5" type="text"/>
			</div>
			<div id="buttonImage">
				<p>
					<input  type="submit" value="确定" /> 
					<input  type="reset" value="重写" />
				</p>
			</div>
			</form>
		</div>
	</div>
    <div class="tobottom">
		<a></a>
	</div>
</body>
</html>
