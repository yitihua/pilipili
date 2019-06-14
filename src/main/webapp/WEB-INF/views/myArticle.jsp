<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/2
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的文章</title>
    <script>var ctx = "${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/myArticle.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/page.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>
</head>
<body>
<div class="contenter">
    <div class="news-topnav">
        <div class="widthfix">
                <span class="news-logo" onclick="javascript:window.location.href='${ctx}/index'">
                    <img src="${ctx}/static/img/CN_bilibiliB.png">
                </span>
            <span class="icon">
                <c:choose>
                    <c:when test="${user.avatar!=''&&user.avatar!=null}">
                        <img src="${ctx}/upload/${user.avatar}">
                    </c:when>
                    <c:otherwise>
                        <img src="${ctx}/static/img/indexPhoto.jpg">
                    </c:otherwise>
                </c:choose>
                <div class="userInf-drop-down">
                    <span class="userInf-drop-down-name">${user.username}</span>
                    <span onclick="javascript:window.location.href='${ctx}/myInf'">个人中心</span>
                    <shiro:hasRole name="admin">
                        <span onclick="javascript:window.location.href='${ctx}/add'">写文章</span>
                    </shiro:hasRole>
                    <span onclick="javascript:window.location.href='${ctx}/logout'">登出</span>
                </div>
            </span>
        </div>
    </div>
    <div class="main-body">
        <div class="widthfix">
            <div class="side-menu" id="side-menu">
                <div class="menu-avatar">
                    <div class="menu-myAvatar">
                        <c:choose>
                            <c:when test="${user.avatar!=''&&user.avatar!=null}">
                                <img src="${ctx}/upload/${user.avatar}">
                            </c:when>
                            <c:otherwise>
                                <img src="${ctx}/static/img/indexPhoto.jpg">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="menu-myName">${user.username}</div>
                </div>
                <ul class="menu-body menu-body-nomal" onselectstart="return flase">
                    <li onclick="javascript:window.location.href='${ctx}/myInf'">
                        个人信息
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/myComment'">
                        我的评论
                    </li>
                </ul>
                <shiro:hasRole name="admin">
                    <ul class="menu-body menu-body-author" onselectstart="return flase">
                        <li onclick="javascript:window.location.href='${ctx}/myArticle'" class="bc-highlight">
                            文章管理
                        </li>

                    </ul>
                </shiro:hasRole>
            </div>
            <div class="main-content" id="myarticle-area">
                <div>
                    <form action="#" method="post" class="article-search">
                        <input type="text" name="search" class="article-search-text">
                        <input type="submit" value="查找" class="article-search-btn">
                    </form>
                    <span class="article-add-btn" onclick="javascript:window.location.href='${ctx}/add'">
                        <img src="static/img/addnav.png"/>
                        新增
                    </span>
                </div>
                <ul class="article-list">
                    <li class="article-empty-nav" v-bind:class="{hide:noArticle}">
                        <img src="static/img/none.jpg" style="width: 300px">
                    </li>
                    <c:forEach items="${newsPage.content}" var="article">
                        <li class="article-nav">
                            <div class="article-title"
                                 onclick="javascript:window.location.href='${ctx}/article/view/${article.id}'">
                                <a>${article.title}</a>
                            </div>
                            <div class="atricle-inf">
                                <span class="time-btn time">
                                        ${article.createAt}
                                </span>
                                <span class="span-btn remove-btn"
                                      onclick="javascript:window.location.href='${ctx}/myArticle/delete/${article.id}'">
                                        删除
                                </span>
                                <span class="span-btn eidt-btn"
                                      onclick="javascript:window.location.href='${ctx}/edit/${article.id}'">
                                        编辑
                                </span>

                            </div>
                        </li>
                    </c:forEach>
                    <tags:pagination page="${newsPage}" paginationSize="${PAGE_SIZE}"/>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/sideMenu.js"></script>
<script src="${ctx}/static/js/myArticle.js"></script>
<script src="${ctx}/static/js/dateFormat.js"></script>
<script>
    if (${articleList}) myArticleVM.noArticle = false;
</script>
</html>
