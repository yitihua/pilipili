<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/2
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>霹哩霹哩(╯‵□′)╯︵┻━┻打人！pilipili</title>
    <script>var ctx=${ctx}</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/myArticle.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>
</head>
<body>
<div class="contenter">
    <div class="news-topnav">
        <div class="widthfix">
                <span class="news-logo">
                    <img src="static/img/CN_bilibiliB.png">
                </span>
            <span class="icon">

                </span>
        </div>
    </div>
    <div class="main-body">
        <div class="widefix clearfix">
            <div class="sideing-menu">
                <div class="menu-avatar">

                </div>
                <ul class="menu-body" onselectstart="return flase">
                    <li>
                        个人信息
                    </li>
                    <li>
                        我的评论
                    </li>
                </ul>
                <ul class="menu-body menu-body-author" onselectstart="return flase">
                    <li>
                        文章管理
                    </li>
                    <li>
                        评论管理
                    </li>
                </ul>
            </div>
            <div class="main-content">
                <div class="article-search"></div>
                <ul class="article-list">
                    <li class="article-nav">
                        <a>
                            <div class="article-title">
                                bilibala
                            </div>
                            <div class="atricle-inf">
                                    <span>

                                    </span>
                                <span>

                                    </span>
                                <span>
                                        编辑
                                    </span>
                                <span>
                                        删除
                                    </span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/index.js"></script>
</html>
