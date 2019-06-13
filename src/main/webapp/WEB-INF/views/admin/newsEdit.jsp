<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/reset.css">
    <link href="${ctx}/static/font/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/manage_newsEdit.css">


    <title>新闻修改</title>
    <script type="text/javascript" src="${ctx}/static/js/vue.js"></script>
</head>
<body>

<%--<div class="container">--%>
    <!-- navigation -->
    <div class="nav-top">
        <a class="navbar-brand" href="" style="color: #fff;">PiliPili</a>
        <ul class="navtop-items">

            <li class="navtop-item">
                <a href="${ctx}/logout" class="logout">
                    <i class="fa fa-fw fa-sign-out"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="nav-side">
        <ul id="nav-side">
            <li class="nav-item">
                <a href="${ctx}/admin/index">
                    <span class="navside-text">新闻管理</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${ctx}/admin/catalogManager">
                    <span class="navside-text">栏目管理</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${ctx}/admin/access">
                    <span class="navside-text">用户权限管理</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${ctx}/admin/dict">
                    <span class="navside-text">数据字典</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${ctx}/index">
                    <span class="navside-text">返回首页</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="">
                    <span class="navside-text"></span>
                </a></li>
            <li class="nav-item">
                <a href="">
                    <span class="navside-text"></span>
                </a></li>

            <li class="nav-item">
                <a href="">
                    <span class="navside-text"></span>
                </a></li>


        </ul>
    </div>


    <!-- container -->
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">index</a>
            </li>
            <li class="breadcrumb-item">
                <span>/ 新闻修改</span>
            </li>
        </ol>
        <form >
            <div class="biaoti">
            <label class="fn0" >标题：</label>
            <div class="bz0">
                <input type="text" class="title-text" id="title" value="${news.title}" class="inputTitle">
            </div>
        </div>
        <div class="fenlei">
            <label class="fn0">分类：</label>
            <div class="bz0">
                <input type="hidden" id ="selectRefundReason" value="${news.type.name}"/>
                <select name="type" >
                    <c:forEach items="${typeList}" var="type">
                        <option value="${type.name}">${type.name}</option>
                    </c:forEach>
                </select>
            </select>
            </div>
        </div>

        <div class="content">
            <div id="editor-tools" class="editor-tools"></div>
            <div id="editor-text">
                <p>${news.content}</p>
            </div>
        </div>
        <div >
            <a class="btnrg" id="btn1">立即发布</a>
        </div>
        </form>
        <div style="visibility:hidden">
            <form id="new-article" action="${ctx}/admin/newsEdit/edit/${news.id}" method="post">
            </form>
        </div>
    </div>

<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/js/navbar.js"></script>
<script type="text/javascript" src="${ctx}/static/js/wangEditor.min.js"></script>
<script src="${ctx}/static/js/admin_newsEdit.js"></script>

</body>
</html>