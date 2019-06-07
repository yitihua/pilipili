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

            </span>
    </div>
</div>
<div class="main-body">
    <div class="widthfix">
        <div class="search-box">
            <input type="text" class="search">
            <input type="button" class="btn-red" value="搜 索">
        </div>
        <div class="news-list">
            <c:forEach var="article" items="newsList">
                <c:choose>
                    <c:when test="${article.img}">
                        <div class="news-pic"><img src="${article.img}"/></div>
                        <div class="news-doc">
                            <div class="news-title">${article.title}</div>
                            <div class="news-inf" id="news${article.id}">
                                <p class="news-author">${article.author.username}</p>
                                <p class="news-time">上传时间${article.createAt}</p>
                                    <%--<p class = "news-comments">评论数：${news.comments}</p>--%>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="news-onlydoc">
                            <div class="news-title">${article.title}</div>
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
