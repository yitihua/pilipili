<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/3
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <script>var ctx="${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/myInf.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>
</head>
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
                    <li onclick="javascript:window.location.href='${ctx}/myInf'" class="bc-highlight">
                        个人信息
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/myComment'">
                        我的评论
                    </li>
                </ul>
                <ul class="menu-body menu-body-author" v-bind:class="{hide:notauthor}" onselectstart="return flase">
                    <li onclick="javascript:window.location.href='${ctx}/myArticle'">
                        文章管理
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/commentManagement'">
                        评论管理
                    </li>
                </ul>
            </div>
            <%--右边栏，用户信息详情--%>
            <div class="main-content">
                <div class="inf-body" id="inf-body">
                    <div class="inf-box">
                        <span class="inf-lable">头像</span>
                        <p><span class="inf-avatar"></span><span class="inf-update-btn">更改头像</span></p>
                    </div>
                    <div class="inf-box">
                        <span class="inf-lable">用户名</span>
                        <p>${user.username}</p>
                    </div>
                    <div class="inf-box">
                        <span class="inf-lable">性别</span>
                        <p>${user.gender}<span class="inf-update-btn" v-on:click="turnGenderBox">{{genderfix}}</span></p>
                        <form method="post" action="#" v-bind:class="{hide:genderBox}" class="gender-form">
                            <input name="gender" type="radio" value="男" id="male"><label for="male">男</label><br>
                            <input name="gender" type="radio" value="女" id="female"><label for="female">女</label><br>
                            <input name="gender" type="radio" value="保密" id="secret"><label for="secret">保密</label><br>
                            <input type="submit" class="inf-submit-btn" value="确认">
                        </form>
                    </div>
                    <div class="inf-box">
                        <span class="inf-lable">学历</span>
                        <p>${user.education}<span class="inf-update-btn" v-on:click="turnEducationBox">{{educationfix}}</span></p>
                        <form v-bind:class="{hide:educationBox}" class="edu-form">
                            <select name="education" required="required">
                                <option value="无">无</option>
                                <option value="小学">小学</option>
                                <option value="初中">初中</option>
                                <option value="高中">高中</option>
                                <option value="大学及以上">大学及以上</option>
                            </select>
                            <br>
                            <input type="submit" class="inf-submit-btn" value="确认">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/sideMenu.js"></script>
<script src="${ctx}/static/js/myInf.js"></script>
</html>
