<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/6
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的评论</title>
    <script>var ctx="${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/myComment.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>
</head>
<body>
<div class="contenter">
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
            <div class="side-menu" id="side-menu" v-bind:class="{lowH:notauthor,highH:!notauthor}">
                <div class="menu-avatar">
                    <div class="menu-myAvatar"><img src="static/img/indexPhoto.png"></div>
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
                <ul class="menu-body menu-body-author" v-bind:class="{hide:notauthor}" onselectstart="return flase">
                    <li onclick="javascript:window.location.href='${ctx}/myArticle'" class="bc-highlight">
                        文章管理
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/commentManagement'">
                        评论管理
                    </li>
                </ul>
            </div>
            <div class="main-content" id="mycomment-area">
                <ul class="comment-list">
                    <%--<c:forEach var="comment" items="commentList">--%>
                        <%--<li>--%>
                            <%--<p>--%>
                                <%--<span>我评论了</span>--%>
                                <%--<span class="commentator">${comment.author.username}狗剩</span>:--%>
                            <%--</p>--%>
                            <%--<a>--%>
                                <%--${comment.content}--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</c:forEach>--%>
                    <li>
                        <p>
                            <span>
                                我评论了
                            </span>
                            <span class="commentator">
                                大土豆
                            </span>:<br>
                            <span class="remove-btn"></span>
                            <span></span>
                            <a class="comment-content">
                                你可真帅
                            </a><br>
                            <span class="comment-inf">
                                2019-12-2
                            </span>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/sideMenu.js"></script>
<%--<script src="${ctx}/static/js/myComment.js"></script>--%>
</html>
