<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/5
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑</title>
    <script>var ctx="${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/editorIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/add.css" rel="stylesheet" type="text/css">
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
                    <div class="menu-myName">${user.username}BUZA</div>
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
            <div class="main-content clearfix" id="myarticle-area">
                <div class="title"><span>标题</span><input type="text" class="title-text" value="${news.title}"></div>
                <div class="type-btns">
                    <input type="checkbox" name="type" id="英剧" value="英剧"><label for="英剧">英剧</label>
                    <input type="checkbox" name="type" id="美剧" value="美剧"><label for="美剧">美剧</label>
                    <input type="checkbox" name="type" id="韩剧" value="韩剧"><label for="韩剧">韩剧</label>
                    <input type="checkbox" name="type" id="日剧" value="日剧"><label for="日剧">日剧</label>
                    <input type="checkbox" name="type" id="国产" value="国产"><label for="国产">国产</label>
                    <input type="checkbox" name="type" id="泰剧" value="泰剧"><label for="泰剧">泰剧</label>
                    <input type="checkbox" name="type" id="番剧" value="番剧"><label for="番剧">番剧</label>
                </div>
                <div id="editor-tools" class="editor-tools">
                </div>
                <div id="editor-text" class="editor-text">
                    ${news.content}
                </div>
                <button id="btn1" class="submit-btn">提交</button>
                <input type="checkbox" >
            </div>
            <%--为提交富文本编辑器中的内容，引入下面的div和editorIndex.js文件--%>
            <div>
                <form id="new-article" method="post" action="#">
                </form>
            </div>
        </div>
    </div>
</div>
<div class="page-sidebar-wrapper" th:include="/common/page_sidebar::pageSidebar"></div>
</body>
<script src="${ctx}/static/js/wangEditor.min.js"></script>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/sideMenu.js"></script>
<script src="${ctx}/static/js/myArticle.js"></script>
<%--<script src="${ctx}/static/js/editorIndex.js"></script>--%>
<script>
    var E = window.wangEditor
    var editor = new E('#editor-tools','#editor-text');
    editor.create();
</script>
</html>

