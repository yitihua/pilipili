<%--
  Created by IntelliJ IDEA.
  User: orange
  Date: 2019/6/1
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/font/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/navbar.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/manage_index.css" />

    <title>栏目管理</title>
    <style type="text/css">

    </style>
</head>
<body>


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
            <a class="sidenav-first-level" herf="${ctx}/admin/index">
                <span class="navside-text">新闻管理</span>
                <i class="fa fa-angle-right "></i>
            </a>

            <%--<ul class="sidenav-second-level">--%>
                <%--<li class="nav-item">--%>
                    <%--<a href=""><span class="navside-text">全部资讯</span></a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a href=""><span class="navside-text">最新咨询</span></a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a href=""><span class="navside-text">热点资讯</span></a>--%>
                <%--</li>--%>

            <%--</ul>--%>

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
    <div class="container-fluid">
        <!-- 当前所在页面 -->

        <!-- 弹出窗口-添加栏目 -->
        <div id="add-box">
            <form action="${ctx}/admin/catalogManager/createType" method="post" id="addform">
                <li>
                    <lable>栏目名称：</lable>
                    <input type="text" name="name"></li>

                <a value="确认添加" class="button" onclick="document:addform.submit()"></a>
                <a id="closeBtn" class="button">取消添加</a>
            </form>
        </div>
        <%--弹框-修改栏目--%>
        <div id="edit-box">
            <form id="editform" action="${ctx}/admin/catalogManager/update/${type.id}">
                <li>
                    <lable>栏目编号：</lable>
                    <input type="text" name="id" value="${type.id}">
                </li>
                <li>
                    <lable>栏目名称：</lable>
                    <input type="text" name="name" value="${type.name}">
                </li>

                    <a class="button" name="" onclick="document:editform.submit()">确认修改</a>
                    <a id="closeBtn2" class="button">取消修改</a>
            </form>
        </div>

        <!-- 弹出窗口-删除栏目 -->
        <div id="delect-box">
            <form id="delectform" action="${ctx}/admin/catalogManager/delect/${type.id}">
                <div class="ttBox">
                    <h1>提示</h1>
                </div>
                <div class="txtBox">
                    <p>你确定要删除该用户吗？？？（小心挨打</p>
                </div>
                <div class="btnArea">
                    <div class="btnArea">
                        <a class="button" onclick="document:delectform.submit()">确定删除</a>
                        <a class="button" id="closeBtn3">取消删除</a>
                    </div>
                </div>
            </form>
        </div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">index</a>
            </li>
            <li class="breadcrumb-item">
                <span>/ 栏目管理</span>
            </li>
        </ol>

        <div class="card">

            <div class="card-header">
                <i class="fa fa-table"></i>
                <span>栏目列表</span>
                <a id="addType">添加<i class="fa fa-plus-square"></i></a>
            </div>

            <div class="card-body">
                <div class="row"></div>

                <!-- 字典列表 -->
                <div class="row">
                    <form>
                        <table style="text-align: center;">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>类名</th>
                                <th colspan="2" >操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${typeList}" var="type">
                                <tr>
                                    <td>${type.id}</td>
                                    <td>${type.name}</td>
                                    <td><a >编辑</a></td>
                                    <td><a id="delect">删除</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>






                        <!-- 分页 -->
                        <div class="row">
                            <ul class="pagination">
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page_link" id="dataTable_previous disabled">Previous</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page_link">1</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page_link">2</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page_link">3</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page_link">4</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page_link next" id="dataTable_next">Next</a></li>
                            </ul>
                        </div>
                    </form>
                </div>


            </div><!-- card -->
        </div>
    </div><!-- container-fluid -->





</div>



</div>
<script type="text/javascript" src="${ctx}/static/js/vue.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/js/navbar.js"></script>
<!-- <script type="text/javascript" src="js/accessManagement.js"></script> -->
<script type="text/javascript">
    $(function(){

        //add
        $("#addType").click(function(){
            $('#add-box').show();

            //获取页面文档的高度
            var docheight = $(document).height();
            //追加一个层，使背景变灰
            $("body").append("<div id='greybackground'></div>");
            $("#greybackground").css({"opacity":"0.3","height":docheight});
            return false;

        });
        //点击关闭按钮
        $("#closeBtn").click(function() {
            $("#add-box").hide();
            //删除变灰的层
            $("#greybackground").remove();
            return false;
        });

        // edit
        $("#edit").click(function(){
            $('#edit-box').show();

            //获取页面文档的高度
            var docheight = $(document).height();
            //追加一个层，使背景变灰
            $("body").append("<div id='greybackground'></div>");
            $("#greybackground").css({"opacity":"0.3","height":docheight});
            return false;

        });
        //点击关闭按钮
        $("#closeBtn2").click(function() {
            $("#edit-box").hide();
            //删除变灰的层
            $("#greybackground").remove();
            return false;
        });

        // delect
        $("#delect").click(function(){
            $('#delect-box').show();

            //获取页面文档的高度
            var docheight = $(document).height();
            //追加一个层，使背景变灰
            $("body").append("<div id='greybackground'></div>");
            $("#greybackground").css({"opacity":"0.3","height":docheight});
            return false;

        });
        //点击关闭按钮
        $("#closeBtn3").click(function() {
            $("#delect-box").hide();
            //删除变灰的层
            $("#greybackground").remove();
            return false;
        });
    })
</script>

</body>
</html>
