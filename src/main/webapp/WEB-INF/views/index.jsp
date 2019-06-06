<%--
  Created by IntelliJ IDEA.
  Author:buza
  Date: 2019/5/25
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>霹哩霹哩(╯‵□′)╯︵┻━┻打人！pilipili</title>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/login.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/hotNews.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/carousel.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/newsList.css"/>
    <link href="${ctx}/static/css/iconfont.css" rel="stylesheet" type="text/css" />
    <script>
        var ctx="${ctx}"
    </script>
    <script></script>
    <script src="${ctx}/static/vue/vue.js"></script>
    <script src="${ctx}/static/js/indexStart.js"></script>
    <script src="${ctx}/static/js/dateFormat.js"></script>
</head>

<body>
<div class="contenter">
    <div class="widthfix">
        <div class="topnav clearfix" id="topnav">
            <div class="logo" onclick="javascript:window.location.href='${ctx}/admin/dataDictionary'">
                <img src="${ctx}/static/img/pilipili.png">
            </div>
            <div class="searchBox">
                <input type="text" class="search">
                <input type="button" class="btn-red" value="搜 索" onclick="javascript:window.location.href='${ctx}/myArticle'">
            </div>
            <shiro:hasRole name="admin">
                <a href="${ctx}/admin/index" class="admin-page">管理员界面</a>
            </shiro:hasRole>
            <div class="userInf"  id="unlog-userInf clearfix">
                <input type="button" value="登 录" class="btn-white" v-on:click="getH" id="loginbtn"v-bind:class="{hide:registed}">
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
                            <form method="POST" id="login-form" v-bind:class='{hide:!actived}' action="${ctx}/login" onsubmit="check()">
                                <div class="login-box login-box-1">
                                    <span class="logtip" id="logtip"></span>
                                    <p>用户名</p><input type="text" name="username" id="username"><br>
                                    <p>密码</p><input type="password" name="password" id="password"><br>
                                    <input type="checkbox" name="rememberMe" id="rememberMe" style="width: 20px"><label for="rememberMe">记住我</label>
                                </div>
                                <div class="login-btns">
                                    <input type="button" value="返回" class="login-btns2" v-on:click="closeForm()" />
                                    <input type="submit" value="确认" class="login-btns1"/>
                                </div>
                            </form>
                            <form method="POST" id="register-form" v-bind:class='{hide:actived}' action="${ctx}/register">
                                <div id="loginbox" class="login-box login-box-2">
                                    <p>用户名</p><input type="text" ref="name" v-model="name" v-on:keyup="ntip()" name="username" class="register-name"><br>
                                    <span>
                                        <img src='${ctx}/static/img/right.png' v-bind:class="{wrong:namewrong}" class="nametip"/>
                                        <span v-html="nametip"></span>
                                    </span><br>
                                    <p>性别</p>
                                    <input type="radio" name="gender" value="男" id="male" class="log-radio"><label for="male">男</label>
                                    <input type="radio" name="gender" value="女" id="female" class="log-radio"><label for="female">女</label>
                                    <input type="radio" name="gender" value="保密" id="secret" class="log-radio"><label for="secret">保密</label><br>
                                    <p>学历</p>
                                    <select name="education">
                                        <option value ="无">无</option>
                                        <option value ="小学">小学</option>
                                        <option value ="初中">初中</option>
                                        <option value="高中">高中</option>
                                        <option value="大学及以上">大学及以上</option>
                                    </select><br>
                                    <p>密码</p><input type="password" ref="password" v-model="password"
                                                    v-on:keyup="ptip()" name="password" class="register-pwd"><br>
                                    <span>
                                        <img src='${ctx}/static/img/right.png' v-bind:class="{wrong:pwdwrong}" class="nametip"/>
                                        <span v-html="pwdtip"></span>
                                    </span><br>
                                </div>
                                <div class="login-btns">
                                    <input type="button" value="退出" class="login-btns2" v-on:click="closeForm()" />
                                    <input type="submit" value="确认" class="login-btns1"/>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!-- login&&regist结束 -->
            <!-- 登录后的用户信息栏 -->

            <div class="userInf" v-bind:class="{hide:!registed}">
                <div class="icon" style="background-image: url('${ctx}/static/img/indexPhoto.png')"></div>
                <span class="userInf-name clearfix">${user.username}<span></span></span>
                <div class="userInf-drop-down">
                    <span class="userInf-drop-down-name">${user.username}</span>
                    <span onclick="javascript:window.location.href='${ctx}/myInf'">个人中心</span>
                    <span onclick="javascript:window.location.href='${ctx}/add'">写文章</span>
                    <span onclick="javascript:window.location.href='${ctx}/logout'">登出</span>
                </div>
            </div>
            <!-- 登录后的用户信息栏结束 -->
        </div>
    </div>
    <!-- 总导航栏 -->
    <div class="borderbottom">
        <div class="widthfix">
            <div class="menu">
                <ul class="type">
                    <li class="bottom-red">首页</li>
                    <c:forEach items="${typeList}" var="type">
                        <li>${type.name}</li>
                    </c:forEach>
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
                    <c:forEach var="news" items="${newsList}">
                        <div class="news-list" id="news${news.id}" onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                            <c:choose>
                                <c:when test="${news.img}">
                                    <div class="news-pic"><img src="${news.img}"/></div>
                                    <div class="news-doc">
                                        <div class="news-title">${news.title}</div>
                                        <div class="news-inf" id="news${news.id}">
                                            <p class="news-author">${news.author.username}</p>
                                            <p class = "news-time">上传时间${news.createAt}</p>
                                            <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="news-onlydoc">
                                        <div class="news-title">${news.title}</div>
                                        <div class="news-inf">
                                            <p class="news-author">${news.author.username}</p>
                                            <script>var time = getgetDateDiff("${news.createAt}")</script>
                                            <p class="news-time">上传时间<script>document.write(time)</script></p>
                                            <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 右侧栏 -->
            <div class="content-column">
                <!-- 热门新闻榜单栏 -->
                <div class="hot-news">
                    <!-- title -->
                    <div class="hot-news-title">
                        <h2>精选资讯</h2>
                    </div>
                    <!-- title end -->
                    <!-- hot news list -->
                    <ul class="hot-news-list">

                    </ul>
                    <!-- hot news list end -->
                    <!-- 热门新闻榜单栏结束 -->
                </div>
            </div>
            <!-- 右侧栏结束 -->
        </div>
    </div>
</div>


</body>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/carousel.js"></script>
<script src="${ctx}/static/js/hotNews.js"></script>
<script src="${ctx}/static/js/newsList.js"></script>
<script src="${ctx}/static/js/login.js"></script>
</body>
<script>
    if("${loginFail}"){
        vm.registed = false
        vm.seeme = true
        document.getElementById("logtip").innerText="${loginFail}"
    }
    if("${user.username}"){
        vm.registed = true
    }
</script>
</html>
