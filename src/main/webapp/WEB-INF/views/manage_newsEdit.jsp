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


    <title>navbar</title>
    <script type="text/javascript" src="${ctx}/static/js/vue.js"></script>
</head>
<body>

<div class="container">
    <!-- navigation -->
    <div class="nav-top">
        <a class="navbar-brand" href="" style="color: #fff;">PiliPili</a>
        <ul class="navtop-items">
            <li class="navtop-item">
                <a href="" class="message">
                    <i class="fa fa-fw fa-envelope"></i>
                    <span>Message</span>
                </a>
            </li>

            <li class="navtop-item">
                <a href="" class="logout">
                    <i class="fa fa-fw fa-sign-out"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="nav-side">
        <ul id="nav-side">
            <li class="nav-item">
                <a class="sidenav-first-level">
                    <span class="navside-text">新闻管理</span>
                    <i class="fa fa-angle-right "></i>
                </a>

                <ul class="sidenav-second-level">
                    <li class="nav-item">
                        <a href=""><span class="navside-text">全部资讯</span></a>
                    </li>
                    <li class="nav-item">
                        <a href=""><span class="navside-text">最新咨询</span></a>
                    </li>
                    <li class="nav-item">
                        <a href=""><span class="navside-text">热点资讯</span></a>
                    </li>

                </ul>

            </li>

            <li class="nav-item">
                <a href="">
                    <span class="navside-text">栏目管理</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="">
                    <span class="navside-text">用户权限管理</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="">
                    <span class="navside-text">用户信息管理</span>
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

        <div class="biaoti">
            <label class="fn0">标题：</label>
            <div class="bz0">
                <input type="text" name="" value="梅西：没有赢球 我负全部责任 下场必胜克罗地亚" class="inputTitle">
            </div>
        </div>
        <div class="fenlei">
            <label class="fn0">分类：</label>
            <div class="bz0">
                <select >
                    <option value="国内新闻">国内新闻</option>
                    <option value="国际新闻">国际新闻</option>
                    <option value="社会">社会</option>
                    <option value="军事">军事</option>
                    <option value="财经">财经</option>
                    <option value="科技">科技</option>
                    <option value="体育" selected = "selected">体育</option>
                    <option value="娱乐">娱乐</option>
                    <option value="时尚">时尚</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>

        <div class="content">

            <div id="editor">
                <p>请输入...</p>
            </div>

            <div >
                <a href="" class="btnrg" style="color: white;">立即发布</a>
            </div>
        </div>



    </div>



</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/js/navbar.js"></script>
<script type="text/javascript" src="${ctx}/static/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()
</script>

</body>
</html>