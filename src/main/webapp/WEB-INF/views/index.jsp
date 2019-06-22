<%--
  Created by IntelliJ IDEA.
  Author:buza
  Date: 2019/5/25
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/carousel.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/newsList.css"/>
    <link href="${ctx}/static/css/iconfont.css" rel="stylesheet" type="text/css"/>
    <script>
        var ctx = "${ctx}"
    </script>
    <script></script>
    <script src="${ctx}/static/vue/vue.js"></script>
    <script src="${ctx}/static/js/dateFormat.js"></script>
</head>

<body>
<div class="contenter">
    <div class="widthfix">
        <div class="topnav clearfix" id="topnav">
            <div class="logo">
                <img src="${ctx}/static/img/pilipili.png">
            </div>
            <div class="searchBox">
                <form action="${ctx}/search" method="post">
                    <input type="text" class="search" name="search">
                    <input type="submit" class="btn-red" value="搜 索">
                </form>
            </div>
            <shiro:hasRole name="admin">
                <a href="${ctx}/admin/index" class="admin-page"><svg class="icon" aria-hidden="true"><use xlink:href="#i-RectangleCopy1"></use></svg>管理员界面</a>
            </shiro:hasRole>
            <div class="userInf" id="unlog-userInf clearfix">
                <input type="button" value="登 录" class="btn-white" v-on:click="getH" id="loginbtn"
                       v-bind:class="{hide:registed}">
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
                            <form method="POST" id="login-form" v-bind:class='{hide:!actived}' action="${ctx}/login"
                                  onsubmit="check()">
                                <div class="login-box login-box-1">
                                    <input type="hidden" name="nextUrl" value="${ctx}/index">
                                    <span class="logtip" id="logtip"></span>
                                    <p>用户名</p><input type="text" name="username" id="username"><br>
                                    <p>密码</p><input type="password" name="password" id="password"><br>
                                    <input type="checkbox" name="rememberMe" id="rememberMe" style="width: 20px"><label
                                        for="rememberMe">记住我</label>
                                </div>
                                <div class="login-btns">
                                    <input type="button" value="返回" class="login-btns2" v-on:click="closeForm()"/>
                                    <input type="submit" value="确认" class="login-btns1"/>
                                </div>
                            </form>
                            <form method="POST" id="register-form" v-bind:class='{hide:actived}'
                                  action="${ctx}/register">
                                <div id="loginbox" class="login-box login-box-2">
                                    <input type="hidden" name="nextUrl" value="${ctx}/index">
                                    <p>用户名</p><input type="text" ref="name" v-model="name"
                                                     name="username" class="register-name"><br>
                                    <span>
                                        <img src='${ctx}/static/img/right.png' v-bind:class="{hide:namewrong}"
                                             class="nametip"/>
                                        <span v-html="nametip"></span>
                                    </span><br>
                                    <p>性别</p>
                                    <input type="radio" name="gender" value="男" id="male" class="log-radio"><label
                                        for="male">男</label>
                                    <input type="radio" name="gender" value="女" id="female" class="log-radio"><label
                                        for="female">女</label>
                                    <input type="radio" name="gender" value="保密" id="secret" class="log-radio" checked="checked"><label
                                        for="secret">保密</label><br>
                                    <p>学历</p>
                                    <select name="education">
                                        <option value="无">无</option>
                                        <option value="小学">小学</option>
                                        <option value="初中">初中</option>
                                        <option value="高中">高中</option>
                                        <option value="大学及以上">大学及以上</option>
                                    </select><br>
                                    <p>密码</p><input type="password" ref="password" v-model="password"
                                                    name="password" class="register-pwd"><br>
                                    <span>
                                        <img src='${ctx}/static/img/right.png' v-bind:class="{hide:pwdwrong}"
                                             class="nametip"/>
                                        <span v-html="pwdtip"></span>
                                    </span><br>
                                </div>
                                <div class="login-btns">
                                    <input type="button" value="退出" class="login-btns2" v-on:click="closeForm()"/>
                                    <input type="submit" value="确认" class="login-btns1" disabled="disabled" id="submit-btn"/>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!-- login&&regist结束 -->
            <!-- 登录后的用户信息栏 -->

            <div class="userInf" v-bind:class="{hide:!registed}">
                <c:choose>
                    <c:when test="${user.avatar!=''&&user.avatar!=null}">
                        <div class="avatar" style="background-image: url('${ctx}/upload/${user.avatar}')"></div>
                    </c:when>
                    <c:otherwise>
                        <div class="avatar" style="background-image: url('${ctx}/static/img/indexPhoto.jpg')"></div>
                    </c:otherwise>
                </c:choose>
                <span class="userInf-name clearfix">${user.username}</span>
                <div class="userInf-drop-down">
                    <span class="userInf-drop-down-name">${user.username}</span>
                    <span onclick="javascript:window.location.href='${ctx}/myInf'">个人中心</span>
                    <shiro:hasRole name="admin">
                        <span onclick="javascript:window.location.href='${ctx}/add'">写文章</span>
                    </shiro:hasRole>
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
                <ul class="type" id="navigation-bar">
                    <li class="bottom-red" id="index">首页</li>
                    <c:forEach items="${typeList}" var="type">
                        <li class="type-name" id="${type.engName}">${type.name}</li>
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
                <%--获取当前页面--%>

                <div class="content-main-list" id="index-news-list">
                    <div id="index-page" v-bind:class="{hide:gohide.index}" class="news-list">
                        <c:forEach var="news" items="${newsList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="animationList" v-bind:class="{hide:gohide.animation}" class="news-list">
                        <c:forEach var="news" items="${animationList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <%--musicListdanceListgameListtechListdigitalListlifeListfoodList --%>
                    <div id="film-page" v-bind:class="{hide:gohide.film}" class="news-list">
                        <c:forEach var="news" items="${filmList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="music-page" v-bind:class="{hide:gohide.music}" class="news-list">
                        <c:forEach var="news" items="${musicList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="dance-page" v-bind:class="{hide:gohide.dance}" class="news-list">
                        <c:forEach var="news" items="${danceList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="game-page" v-bind:class="{hide:gohide.game}" class="news-list">
                        <c:forEach var="news" items="${gameList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="tech-page" v-bind:class="{hide:gohide.tech}" class="news-list">
                        <c:forEach var="news" items="${techList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="digital-page" v-bind:class="{hide:gohide.digital}" class="news-list">
                        <c:forEach var="news" items="${digitalList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="life-page" v-bind:class="{hide:gohide.life}" class="news-list">
                        <c:forEach var="news" items="${lifeList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="food-page" v-bind:class="{hide:gohide.food}" class="news-list">
                        <c:forEach var="news" items="${foodList}">
                            <div class="news-list" id="news${news.id}"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${news.id}'">
                                <c:choose>
                                    <c:when test="${news.img!=''&&news.img!=null}">
                                        <div class="news-pic"><img src="${ctx}/upload/${news.img}"/></div>
                                        <div class="news-doc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf" id="news${news.id}">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="news-onlydoc">
                                            <div class="news-title">${news.title}</div>
                                            <div class="news-inf">
                                                <p class="news-author">${news.author.username}</p>
                                                <p class="news-time">上传时间:<span class="time">${news.createAt}</span></p>
                                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
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
<div class="gotop"><a href="#topnav"><svg class="icon" aria-hidden="true"><use xlink:href="#i-jiantou_shang"></use></svg></a></div>
</body>
<script src="${ctx}/static/js/hotNews.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/carousel.js"></script>
<script src="${ctx}/static/js/login.js"></script>
<script src="${ctx}/static/js/dateFormat.js"></script>
<script src="//at.alicdn.com/t/font_1255575_pgrdqcuywxc.js"></script>
</body>
<script>
    if ("${loginFail}") {
        vm.registed = false
        vm.seeme = true
        document.getElementById("logtip").innerText = "${loginFail}"
    }
    if ("${user.username}") {
        vm.registed = true
    }
</script>
</html>
