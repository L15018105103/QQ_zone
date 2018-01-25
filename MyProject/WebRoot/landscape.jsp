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
	<!------------------------路上 风景------------------------>
	<div class="mainbg2">
		<a name=" m-life"></a>
		<div class="content-life">
			<div class="intro-wrapper">
				<div class="content-title" >路上风景</div>
				<div class="lifetime">
					<ul id="tag">
						<li>
							<hr>2004<br> <span>常州</span>
						</li>
						<li>
							<hr>2008<br> <span>苏州</span>
						</li>

						<li>
							<hr>2011<br> <span>淮安</span>
						</li>
						<li>
							<hr>2013<br> <span>青岛</span>
						</li>
						<li>
							<hr>2015<br> <span>巴黎</span>
						</li>
					</ul>
					<div id="tagContent">
						<div class="lifecon1">
							<p>
								-- 向往的城市--<br> 常州，又称龙城，地处长江之南、太湖之滨，是一座有3200多年左右历史的文化名城，
								境内风景名胜、历史古迹较多。
							</p>
							<ul class="life-pic">
								<img src="images/cz1.png">
								<br> 主题公园:教育、游乐、环艺、演艺、商业
								<li>中华恐龙园</li>
							</ul>
							<ul class="life-pic">
								<img src="images/cz2.png"> 宝塔、照壁、观音、天王、罗汉、玉佛
								<li>天宁寺</li>
							</ul>
							<ul class="life-pic">
								<img src="images/cz3.png"> 子城河、内城河、外城河
								<li>淹城</li>
							</ul>
							<ul class="life-pic">
								<img src="images/cz4.png"> 动漫艺术、游戏文化
								<li>环球动漫嬉戏谷</li>
							</ul>
							<ul class="life-pic">
								<img src="images/cz5.png"> 牌楼、堤坝、公园、动物园、山庄
								<li>天目湖</li>
							</ul>
							<ul class="life-pic">
								<img src="images/cz6.png"> 静湖、小鸟天堂、古官道、吴越第一峰
								<li>南山竹海</li>
							</ul>
							<p>
								-- 喜爱这边的美食 --<br> 砂锅鱼头，加蟹小笼包、大麻糕、虾饼、芝麻糖、蟹壳黄、常州银丝面、酒酿元宵、
								马蹄酥、三鲜馄饨、萝卜干
							</p>

						</div>
						<div class="lifecon2">
							<p>
								-- 景色优美的城市 --<br> 苏州，古称吴，又称姑苏、平江，始建于公元前514年，历史悠久，人文荟萃，
								是昆剧和苏剧的故乡，有“上有天堂，下有苏杭”之称。
							</p>
							<ul class="life-pic">
								<img src="images/sz1.png"> 剑池、虎丘塔、断梁殿、真娘墓
								<li>虎丘</li>
							</ul>
							<ul class="life-pic">
								<img src="images/sz2.png"> 见山楼、听雨轩、小飞虹
								<li>拙政园</li>
							</ul>
							<ul class="life-pic">
								<img src="images/sz3.png"> 老街、玉涵堂、通贵桥、古戏台、商会博物馆
								<li>山塘街</li>
							</ul>
							<ul class="life-pic">
								<img src="images/sz6.png"> 水上世界、欢乐世界
								<li>苏州乐园</li>
							</ul>
							<ul class="life-pic">
								<img src="images/sz4.png"> 水城门、瓮 城、绞关石、吴门桥、瑞光塔
								<li>盘门</li>
							</ul>
							<ul class="life-pic">
								<img src="images/sz5.png"> 沈万三故居、富安桥、双桥、沈厅、怪楼
								<li>周庄</li>
							</ul>
							<p>
								-- 喜爱苏州的古色古香 --<br> 左边是园，右边是园。是塔是桥，是寺是河，是诗是画，是石径是帆船是假山。
								有客自海上来，有客自异乡来。
							</p>
						</div>

						<div class="lifecon3">
							<p>
								-- 古朴的城市 --<br> 淮安，地处长江三角洲地区，是古淮河与京杭大运河交点，历史悠久、人杰地灵，
								是总理周恩来同志的故乡。
							</p>
							<ul class="life-pic">
								<img src="images/ha1.png"> 主馆、周恩来铜像、仿西花厅
								<li>周恩来纪念馆</li>
							</ul>
							<ul class="life-pic">
								<img src="images/ha2.png"> 文化、军事、盐商、中医、美食、佛学文化
								<li>河下古镇</li>
							</ul>
							<ul class="life-pic">
								<img src="images/ha3.png"> 正门、客厅、吴氏家谱、著作
								<li>吴承恩故居</li>
							</ul>
							<ul class="life-pic">
								<img src="images/ha4.png"> 胯下桥、韩侯钓台、漂母祠、韩候祠
								<li>韩信故里</li>
							</ul>
							<ul class="life-pic">
								<img src="images/ha5.png"> 禹王台、跃龙池、碧云桥、月季园
								<li>楚秀园</li>
							</ul>
							<ul class="life-pic">
								<img src="images/ha6.png"> 景惠寺、招隐寺、山子湖
								<li>钵池山公园</li>
							</ul>
							<p>
								-- 喜爱淮安的掼蛋 --<br> 饭前饭后，同学聚会，亲朋好友，只要是闲暇时光，总不忘摆好桌子凳子，四人一桌，
								掼蛋走起。
							</p>
						</div>

						<div class="lifecon4">
							<p>
								-- 美丽的城市 --<br> 青岛，又称岛城，地处山东半岛东南部沿海，是一座历史文化名城，拥有一个国家级新区。
							</p>
							<ul class="life-pic">
								<img src="images/qd1.png"> 十二景：巨峰、明霞洞、蔚竹庵...
								<li>崂山</li>
							</ul>
							<ul class="life-pic">
								<img src="images/qd2.png"> 见山楼、听雨轩、小飞虹
								<li>极地海洋世界</li>
							</ul>
							<ul class="life-pic">
								<img src="images/qd3.png"> 回澜阁、小青岛、海水浴场、海关大楼、海上皇宫
								<li>栈桥</li>
							</ul>
							<ul class="life-pic">
								<img src="images/qd4.png"> 滨海木栈道、景观长廊、凉亭、水车、渔船
								<li>金沙滩</li>
							</ul>
							<ul class="life-pic">
								<img src="images/qd5.png"> 水城门、瓮 城、绞关石、吴门桥、瑞光塔
								<li>盘门</li>
							</ul>
							<ul class="life-pic">
								<img src="images/qd6.png"> 塔冠、塔碟、塔外
								<li>电视观光塔</li>
							</ul>
							<p>
								-- 喜爱青岛的海 --<br>
								远远地便能看见海，有清爽的海风、低吟的海浪，脚下松软的沙子被人们踩踏出无数行者的脚印，
								潮起潮落又一并被海水带走，沙滩上被冲刷得不留一点痕迹。
							</p>
						</div>

						<div class="lifecon5">
							<p>
								-- 最想去的旅游城市 --<br>
								巴黎（Paris），法国的首都，是欧洲第二大城市，誉为时尚之都，世界花都,浪漫之都，艺术之都。
							</p>
							<ul class="life-pic">
								<img src="images/bl1.png"> 巴黎的标志之一，俗称“铁娘子”。
								<li>埃菲尔铁塔</li>
							</ul>
							<ul class="life-pic">
								<img src="images/bl2.png"> 出征、胜利、和平、抵抗
								<li>凯旋门</li>
							</ul>
							<ul class="life-pic">
								<img src="images/bl3.png"> 世界四大博物馆之首，藏有各国艺术珍品
								<li>卢浮宫</li>
							</ul>
							<ul class="life-pic">
								<img src="images/bl4.png"> 哥特式建筑，宗教、文化、建筑艺术
								<li>巴黎圣母院</li>
							</ul>
							<ul class="life-pic">
								<img src="images/bl5.png"> 法国北部大河，全长780公里
								<li>塞纳河畔</li>
							</ul>
							<ul class="life-pic">
								<img src="images/bl6.png"> 世界五大宫殿之一，豪华富丽
								<li>凡尔赛宫</li>
							</ul>
							<p>
								-- 喜爱巴黎的梦幻 --<br> 巴黎不仅仅是个地方，它已经成了一种精神状态。无论你是谁，都可以在这个既怀旧又前卫，
								既宁静又喧嚣，既国际化又本土化的城市找到自己需要的那一剂量心灵解药，到过巴黎的， 一定不会再稀罕天堂
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="totop">
		<a></a>
	</div>
</body>
</html>
