<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%@ page import="entity.User"%>
<%!String realName = "Hello";%>
<%!String name = null;%>
<%!String password = null;%>
<%!String id = null;%>
<%!String nickname = null;%>
<%!String birthday = null;%>
<%!String place = null;%>
<%!String blood = null;%>
<%!String profession = null;%>
<%!String constellation = null;%>
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
	<!--<object style="border:0px" type="text/x-scriptlet" data="head.html" width=100% height=500px> </object>-->
	<div>
		<%
			ArrayList<User> lists = (ArrayList) request.getAttribute("userList");
			if (lists.size() == 0) {
				out.print("无查询记录");
			} else {
				for (int i = 0; i < lists.size(); i++) {
					User u = lists.get(i);
				    password = u.getPassword();
				    name = u.getName();
				    id = u.getId();
				    nickname = u.getNickName();
				    birthday = u.getBirthday();
				    place = u.getPlace();
				    constellation = u.getConstellation();
				    blood = u.getBlood();
				    profession = u.getProfession();
					String point = id;
					if (id.equalsIgnoreCase(point)) {
						realName = name;
					}
				}
			}
		%>
	</div>
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
		  	<!-- <div>
				<embed src="music/secret.wav" style="FILTER:Xray" width=200
					height=45 type=audio/mpeg loop="true" autostart="false"
					controls="smallconsole" palette="red|black">
			</div>  -->
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
			<li><a href="show.do"><img src="images/home.png"><br>首页</a></li>
			<li><a href="javascript:window.scrollTo( 0, 320 );"><img
					src="images/info.png"><br>个人档案</a></li>
			<li><a href="javascript:window.scrollTo( 0, 920 );"><img
					src="images/view.png"><br>路上风景</a></li>
			<li><a href="comment.jsp?username=<%=realName%>"><img
					src="images/dairy.png"><br>说说日志</a></li>
			<li><a href="messageBoard.jsp?username=<%=realName%>"><img
					src="images/dia.png"><br>留言板</a></li>
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
							<td><%out.print(name); %></td>
						</tr>
						<tr>
							<td></td>
							<td>别名:</td>
							<td><%out.print(nickname); %></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>出生日期:</td>
							<td><%out.print(birthday); %></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>出生地:</td>
							<td><%out.print(place); %></td>
						</tr>
						<tr>
							<td class="sec-hob">学知识</td>
							<td class="sec-hob">看书 / 打代码</td>
							<td></td>
							<td></td>
							<td>星座:</td>
							<td><%out.print(constellation); %></td>
						</tr>
						<tr>
							<td></td>
							<td class="sec-hob">去旅游</td>
							<td class="sec-hob">马尔代夫</td>
							<td></td>
							<td></td>
							<td>血型:</td>
							<td><%out.print(blood); %></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="sec-hob">养动物</td>
							<td class="sec-hob">狗（萨摩）</td>
							<td></td>
							<td></td>
							<td>职业:</td>
							<td><%out.print(profession); %></td>
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
	<!------------------------点点滴滴------------------------>
	<div class="mainbg3">
		<a name="m-diary"></a>
		<div class="content-diary">
			<div class="diary-wrapper">
				<div class="content-title">点点滴滴</div>
				<div class="diary-main">
					<div class="diary-year">
						<div class="years">
							<a href="#">2017年<i></i></a>
						</div>
						<div class="diary-list">
							<ul>
								<li class="cls highlight">
									<p class="date">3月18日</p>
									<p class="intro">灯塔城市项目正式启动！</p>
									<p class="version">&nbsp;</p> <!--空格位 -->
									<div class="more">
										<p>经过2轮的层层筛选，终于迎来了团建的日子，很开心！</p>
									</div>
									<div id="info-show">
										<ul></ul>
								    </div>
                                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
									<br><br><br><br>
									<div id="content" style="width: 600px; height: auto;margin-left:230px;margin-top:4px;">
										<div class="wrap">
											<div class="comment">
												<div class="head-face">
													<img src="images/portrait3.jpg" />
													<p>Angelo</p>
												</div>
												<div class="content">
													<div class="cont-box">
														<textarea id="comment" class="text" placeholder="Please enter the message..." style="background:white;width:540px;height:80px;"></textarea>
													</div>
													<div class="tools-box">
														<div class="operator-box-btn">
															<span class="face-icon">☺</span><span class="img-icon">▧</span>
														</div>
														<div class="submit-btn">
															<input type="button" onClick="out();javascript:ClearTextArea()" value="提交评论" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> 
								</li>
								<li class="cls">
									<p class="date">3月5日</p>
									<p class="intro">广金一日游</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>终于见识了下什么叫别人家的饭堂，广金的好高档！</p>
										<p>下次还会再来的~</p>
									</div>
								</li>
								<li class="cls highlight">
									<p class="date">2月23日</p>
									<p class="intro">趣味</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>很想知道大海为什么是蓝色的，今天算是见识到了神一般的回复</p>
										<p>因为大海有鱼，鱼会吐泡泡“blue,blue,blue...”</p>
									</div>
								</li>
								<li class="cls">
									<p class="date">2月07日</p>
									<p class="intro">卡土窑</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>第一次卡土窑，满满的童年味道哈哈哈</p>
										<p>这个过程，特别得享受。</p>
									</div>
								</li>
								<li class="cls  highlight">
									<p class="date">01月31日</p>
									<p class="intro">初中毕业五周年</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>很庆幸赶上了！</p>
										<p>既然有五年，那么自然就应该会有十年、十五年。。。</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="diary-year">
						<div class="years">
							<a href="#">2016年<i></i></a>
						</div>
						<div class="diary-list">
							<ul>
								<li class="cls">
									<p class="date">12月17日</p>
									<p class="intro">冬至晚会</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>冬至佳节，乡会团聚，甚是温馨。</p>
									</div>
								</li>
								<li class="cls  highlight">
									<p class="date">12月16日</p>
									<p class="intro">志愿献血</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>正值献血热潮，身为大学生，我也去蹭蹭！</p>
									</div>
								</li>
								<li class="cls">
									<p class="date">11月30日</p>
									<p class="intro">袁隆平爷爷光临本校</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>热烈得欢迎欢迎哈！</p>
										<p>身为华农学子，满满的自豪感！</p>
									</div>
								</li>

								<li class="cls  highlight">
									<p class="date">11月25日</p>
									<p class="intro">总在不经意的年生。回首彼岸，纵然发现光景绵长。</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>何如薄幸锦衣郎，比翼连枝当日愿。</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="diary-year">
						<div class="years">
							<a href="#">2015年<i></i></a>
						</div>
						<div class="diary-list">
							<ul>
								<li class="cls">
									<p class="date">11月27日</p>
									<p class="intro">校运会体操表演</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>今天，很荣幸地身为表演的一员，成功地完成了校运会开幕式表演！</p>
									</div>
								</li>
								<li class="cls highlight">
									<p class="date">11月08日</p>
									<p class="intro">院运会</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>班长的陪跑</p>
										<p>感谢我们的班长的陪跑，那飒爽的英姿穿梭于每一场比赛！</p>
									</div>
								</li>
								<li class="cls">
									<p class="date">10月07日</p>
									<p class="intro">沙面</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>沙面一日游，古朴的一座小小岛！</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="diary-year">
						<div class="years">
							<a href="#">2015年以前<i></i></a>
						</div>
						<div class="diary-list">
							<ul>
								<li class="cls">
									<p class="date">&nbsp;</p>
									<p class="intro">俱往矣，数风流人物，还看今朝。</p>
									<p class="version">&nbsp;</p>
									<div class="more">
										<p>记忆总是散落的，没有记录，还真是记不住的，日子太长， 往前的只能简单记忆回想了。</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!------------------------ 一些话 ------------------------>
	<div class="mainbg4">
		<a name="m-word"></a>
		<div class="content-words">
			<div class="words-wrapper">
				<div class="content-title">一些话</div>
				<ul id="demo">
					<li>
						<ul class="d1">
							<div class="d1-tit d1-1">
								我<br>想<br>说<br>的<br>话
							</div>
							<div class="d1-con">
								<p>我是个web前端新手，一个新的不能再新的新手。没经验，没技术，没创新，没动力。自我嫌恶，又安于现状，不甘平庸
									，又害怕行动。</p>
								<p>做前端，没那么难，其实就是学，不停的学。</p>
								<p>现在技术更新很快，所以眼光要放远，要随时让自己处于虚心学习的状态。
									不要学会div+css,就觉得很了不起，就不想学其它的技术了，懂div+css的人太多了。现在网上各种教程资料，
									所以多学点东西，提升自我价值，没错的。</p>
								<p>有的人觉得自己学好了，已经很厉害了。html+css够扎实？javascrip能灵活运用？使用jQuery一路到头？DOM，AJAX,JSON,DHTML，有接触？后台一些基本语言，了解？Web前端是永无止境的，没有人能真正的学到头。不要怕累，不要怕伤眼，不要怕动脑，知识是死的，方式是活的，已经爬到食物链的顶端，还有什么是解决不了的吗？相信自己。</p>
								<p>其实，还是看你自己。</p>
								<p>害怕这样的一种状态。早上起不来，早饭吃不好，麻木的上班，渴望下班，下班后就是脱离任何思想，看电视玩手机，还要熬夜玩，各种拖延症。第二天又是这样，循环不断。我们现在还年轻，有很多的精力，我们需要更多的投资自己。</p>
								<p>别在最该奋斗的日子，选择了安逸和享受。</p>
							</div>
						</ul> <!--<div><a href="http://www.mycodes.net">标题1</a></div>-->
					</li>
					<li>
						<ul class="d2">
							<div class="d1-tit d2-2">
								激<br>励<br>你<br>自<br>己
							</div>
							<div class="d2-con">
								<p>放下你的浮躁，放下你的懒惰，放下你的三分钟热度，闭上你什么都想聊两句的嘴巴，静下心来好好做你该做的事。你的努力是唯一能让你站稳脚跟的依靠。</p>
								<p>做你想做的，趁阳光正好。去追逐梦想，趁还年轻。不浪费时间，不挥霍时光，不沉迷过去，不恐惧未来。努力从来不会白费，今日播下的种子，正在你看不见、想不到的某处悄悄地发芽。</p>
								<p>你想要好的成绩，但是你不去学习；你想要富裕的生活，但是你不去拼搏奋斗；你想要健康的身体，但是你没能坚持锻炼；你想要称心如意的生活，但是你从未真正的改变过自己。你尽力了，才有资格说自己运气不好。</p>
								<p>水再浑浊，只要长久沉淀，依然会分外清澄；人再愚钝，只要足够努力，一样能改写命运，不要愤懑起点太低，那只是我们站立的原点。人生是一场漫长竞赛，有些人笑在开始，有些人却赢在最后。</p>
								<p>世界上最难的事，莫过于在热闹之中按兵不动，在诱惑面前不忘初心，别偏激，按兵不动不是让你停滞不前，不忘初心也并非不可以放眼未来，冷静，不是迟钝，沉默，不代表妥协。</p>

							</div>
						</ul> <!--<div><a href="2">标题2</a></
                    div>-->
					</li>
					<li>
						<ul class="d3">
							<div class="d1-tit d3-3">
								推<br>荐<br>的<br>书<br>籍
							</div>
							<div class="d3-con">
								<p>入门：</p>
								《深入浅出JavaScript》-- Christion Heilmann<br> 《JavaScript
								DOM编程艺术》-- Jeremy Keith<br> 《JavaScript DOM高级程序设计》--
								Jeffrey Sambells<br>
								<p>进阶：</p>
								《ppk谈JavaScript》-- Peter-PaulKoch<br> 《精通JavaScript》--
								JohnResig<br> 《JavaScript高级程序设计》-- Nicholas C.Zakas<br>
								<p>高级：</p>
								《JavaScript语言精粹》-- Douglas Crockford<br> 《JavaScript设计模式》--
								Rossharmes<br> 《Secrets of the JavaScript Ninja》--
								JohnResig<br> 《高性能JavaScript》-- NicholasC.Zakas
							</div>
						</ul> <!--<div><a href="3">标题3</a></div>-->
					</li>
					<li>
						<ul class="d4">
							<div class="d1-tit">
								要<br>靠<br>你<br>自<br>己
							</div>
							<div class="d4-con">
								<img class="mind1" src="images/mind-1.png"> <img
									class="mind2" src="images/mind-2.png">
								<p>
									Do what you can, with what you have, where you are.<br>
									Life always has two sides, choose yours.
								</p>
							</div>

						</ul> <!--<div><a href="3">标题4</a></div>-->
					</li>
				</ul>
			</div>

		</div>
	</div>
	<div class="totop">
		<a></a>
	</div>
</body>
</html>