<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/static/vue/vue.js"></script>
	<script src="${ctx}/static/js/indexStart.js"></script>
	<link href="${ctx}/static/css/login.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/carousel.css" />
</head>

<body>
	<div class="contenter">
		<div class="widthfix">
			<div class="topnav clearfix" id="topnav">
				<div class="logo">
					HAPPYNEWS
				</div>
				<div class="searchBox">
					<input type="text" class="search">
					<input type="button" class="btn-red" value="搜 索">
				</div>
				<div class="userInf" v-bind:class="{hide:registed}" id="unlog-userInf">
					<input type="button" value="登 录" class="btn-white" v-on:click="getH" id="loginbtn">
					<!-- login&&register -->
					<div class="login" id="login" v-bind:class="{seeme:seeme}">
						<div class="login-bc" id="login-bc">
							<div class="login-bar">
								<span v-on:click="gologin()"
									v-bind:class="{borderHighLight:actived,borderIndex:!actived}">
									登录
								</span>
								<span v-on:click="goregister()"
									v-bind:class="{borderHighLight:!actived,borderIndex:actived}">
									注册
								</span>
							</div>
							<div class="login-boxs clearfix" id="loginBoxs">
								<div class="login-box login-box-1">
									<p>用户名</p><input type="text"><br>
									<p>密码</p><input type="password">
								</div>
								<div id="loginbox" class="login-box login-box-2">
									<p>用户名</p><input type="text" ref="name" v-model="name" v-on:keyup="ntip()"><br>
									<span v-html="nametip"></span><br>
									<p>密码</p><input type="password" ref="password" v-model="password"
										v-on:keyup="ptip()"><br>
									<span v-html="pwdtip"></span>
								</div>
							</div>

							<div class="login-btns">
								<input type="button" value="确认" class="login-btns1"/>
								<input type="button" value="退出" class="login-btns2" v-on:click="closeForm()"/>
							</div>
						</div>

					</div>
				</div>
				<!-- login&&regist结束 -->
				<!-- 登录后的用户信息栏 -->
				<div class="userInf" v-bind:class="{hide:!registed}">
					<div class="icon"><img src="static/img/indexPhoto.png"></div>
					<span class="userInf-name clearfix">Buza<span></span></span>
				</div>
				<!-- 登录后的用户信息栏结束 -->
			</div>
		</div>
		<!-- 总导航栏 -->
		<div class="borderbottom">
			<div class="widthfix">
				<div class="menu">
					<ul class="type">
						<li>推荐</li>
						<li>热点</li>
						<li>英剧</li>
						<li>美剧</li>
						<li>韩剧</li>
						<li>日剧</li>
						<li>国产</li>
						<li>泰剧</li>
						<li>番剧</li>
						<li>游戏</li>
					</ul>
				</div>
			</div>
		</div>
		<!--总导航栏结束  -->
		<!-- 主要内容：左右两栏，左推荐，右热点 -->
		<div class="widthfix">
			<div class="content">
				<!-- 左侧栏 -->
				<div class="content-main">
					<!-- 轮播部分 -->
					<div class="carousel clearfix" id="carousel">
						<div id="carousel-panel" class="carousel-panel"></div>

						<ul id="carousel-opts" class="opts clearfix"></ul>
						<div id="carousel-text" class="carousel-text" onselectstart="return false">《神烦警探》翻拍</div>
					</div>
					<!-- 轮播部分结束 -->
					<!-- 推荐内容1/2/3 -->
					<div class="content-main-list">
						<!-- <c:forEach var="news" items="${newsList}">							
						</c:forEach> -->
						<div class="news-list">

						</div>
					</div>
				</div>
				<!-- 右侧栏 -->
				<div class="content-column">
					<div class="hot-media">

					</div>
					<div class="hot-news">

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/carousel.js"></script>
</body>

</html>