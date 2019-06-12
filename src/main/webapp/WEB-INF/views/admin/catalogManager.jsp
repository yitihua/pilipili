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
</head>
<body>


<!-- navigation -->
<div class="nav-top">
    <a class="navbar-brand" href="" >PiliPili</a>
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
    <div class="container-fluid">
        <!-- 当前所在页面 -->

        <!-- 弹出窗口-添加栏目 -->
        <div id="add-box">
            <form id="addform" action="${ctx}/admin/catalogManager/createType" method="post" >
                <li>
                    <lable>栏目名称：</lable>
                    <input type="text" name="name"></li>
               <li>
                   <label>英文名：</label>
                   <input type="text" name="engName"></li>
                <a id="closeBtn" class="button">取消添加</a>
                <a class="button" onclick="document:addform.submit()">确认添加</a>
            </form>
        </div>

    <c:forEach items="${typeList}" var="type">
        <%--弹框-修改栏目--%>
        <div id="edit-box">
            <form id="editform" action="${ctx}/admin/catalogManager/update/${type.id}" method="post">
                <li>
                    <lable>栏目编号：</lable>
                    <label>${type.id}</label>
                </li>
                <li>
                    <lable>栏目名称：</lable>
                    <input type="text" name="name" id="type-name" value="${type.name}">
                </li>
                <li>
                    <lable>英文名：</lable>
                    <input type="text" name="engName" id="type-engName" value="${type.engName}">
                </li>
                    <a id="closeBtn2" class="button">取消修改</a>
                    <a class="button" onclick="document:editform.submit()">确认修改</a>
            </form>
        </div>
    </c:forEach>

        <!-- 弹出窗口-删除栏目 -->
        <div id="delect-box">
            <form id="delectform" action="${ctx}/admin/catalogManager/delect/${type.id}" method="post">
                <div class="ttBox">
                    <h1>提示</h1>
                </div>
                <div class="txtBox">
                    <p>你确定要删除该目录吗？？？（小心挨打</p>
                </div>
                <div class="btnArea">
                    <div class="btnArea">
                        <a class="button" id="closeBtn3">取消删除</a>
                        <a class="button" onclick="document:delectform.submit()">确定删除</a>
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

                <!-- 栏目列表 -->
                <div class="row">
                    <form>
                        <table style="text-align: center;">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>类名</th>
                                <th>英文名</th>
                                <th colspan="2" >操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${typeList}" var="type">
                                <tr>
                                    <td>${type.id}</td>
                                    <td>${type.name}</td>
                                    <td>${type.engName}</td>
                                    <td><a class="edit" type-name="${type.name}" type-engName="${type.engName}">编辑</a></td>
                                    <td><a class="delect" type-id="${type.id}">删除</a></td>
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
                                    <a href="" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page_link next" id="dataTable_next">Next</a></li>
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
<script type="text/javascript" src="${ctx}/static/js/admin_catalog.js"></script>
<script type="text/javascript">

</script>

</body>
</html>
