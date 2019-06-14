<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/7
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>PiliPili搜索结果</title>
    <meta charset="UTF-8">
    <title>我的文章</title>
    <script>var ctx = "${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/search.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>
</head>
<body>
<div class="news-topnav">
    <div class="widthfix">
                <span class="news-logo" onclick="javascript:window.location.href='${ctx}/index'">
                    <img src="static/img/CN_bilibiliB.png">
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
                    <span onclick="javascript:window.location.href='${ctx}/add'">写文章</span>
                    <span onclick="javascript:window.location.href='${ctx}/logout'">登出</span>
                </div>
            </span>
    </div>
</div>
<div class="main-body">
    <div class="widthfix">
        <div class="search-box">
            <form action="${ctx}/search" method="post">
                <input type="text" class="search" name="search">
                <input type="submit" class="btn-red" value="搜 索">
            </form>
        </div>
        <div class="news-list">
            <c:if test="${empty newsList}">
                <div class="empty-search">
                    <img src="${ctx}/static/img/none.jpg" style="height: 400px;width: 400px">
                </div>
            </c:if>
            <c:forEach var="article" items="${newsList}">
                <c:choose>
                    <c:when test="${article.img}">
                        <div class="news-pic"onclick="javascript:window.location.href='${ctx}/article/view/${article.id}'"><img src="${article.img}"/></div>
                        <div class="news-doc">
                            <div class="news-title"onclick="javascript:window.location.href='${ctx}/article/view/${article.id}'">${article.title}</div>
                            <div class="news-inf" id="news${article.id}">
                                <p class="news-author">${article.author.username}</p>
                                <p class="news-time">上传时间${article.createAt}</p>
                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="news-onlydoc">
                            <div class="news-title"onclick="javascript:window.location.href='${ctx}/article/view/${article.id}'">${article.title}</div>
                            <div class="news-inf">
                                <p class="news-author">${article.author.username}</p>
                                <p class="news-time">上传时间:${article.createAt}</p>
                                    <%--<p class="news-comments">评论数：${news.comments}</p>--%>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

    </div>
</div>
</body>
</html>
