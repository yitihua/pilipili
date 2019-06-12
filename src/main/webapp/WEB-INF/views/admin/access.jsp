<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/manage_index.css">

    <title>用户权限管理</title>

</head>
<body>

<!-- navigation -->
<div class="nav-top">
    <a class="navbar-brand" href="" style="color: #fff;">PiliPili</a>
    <ul class="navtop-items">
        <%--<li class="navtop-item">--%>
            <%--<a href="" class="message">--%>
                <%--<i class="fa fa-fw fa-envelope"></i>--%>
                <%--<span>Message</span>--%>
            <%--</a>--%>
        <%--</li>--%>

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
        <%--<li class="nav-item">--%>
            <%--<a  herf="${ctx}/admin/index">--%>
                <%--<span class="navside-text">新闻管理</span>--%>
                <%--<i class="fa fa-angle-right "></i>--%>
            <%--</a>--%>

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

        <%--</li>--%>
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
            <a href="">
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
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">index</a>
            </li>
            <li class="breadcrumb-item">
                <span>/ 用户权限管理</span>
            </li>
        </ol>

        <div class="card">

            <div class="card-header">
                <i class="fa fa-table"></i>
                <span>用户列表</span>
                <a id="addUser">添加用户<i class="fa fa-plus-square"></i></a>
                <%--<a id="addRole">添加权限<i class="fa fa-plus-square"></i></a>--%>

            </div>

            <div class="card-body">
                <div class="row"></div>
            <!-- 用户列表 -->
                <div class="row">
                    <form>
                        <table style="text-align: center;">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>用户名</th>
                            <th>级别</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user" varStatus="i">
                            <tr>
                                <td>${idxStatus.index+1}</td> <%--表示序号 不要改--%>
                                <td>${user.username}</td>
                                <td>
                                    <c:forEach items="${user.roles}" var="role" >
                                        ${role.name}
                                        <option type="text" id="refundReason" style="display: none">${role.name}</option>
                                    </c:forEach>
                                </td>
                                <td><a class="change-authority" user-name="${user.username}" user-roles="${role.name} ">更改权限</a></td>
                                <td><a class="delect" user-id="${user.id}">删除</a></td>
                                </tr>
                        </c:forEach>
                        </tbody>
                        </table>


                        <!-- 弹出窗口-添加用户 -->
                        <div id="add-box1">
                            <form id="createUserform" action="${ctx}/admin/access/createUser" method="post">
                                <li>
                                    <lable>用户名：</lable>
                                    <input type="text" name="username" value="">
                                </li>
                                <li>
                                    <lable>权限级别：</lable>
                                    <input type="checkbox" name="" value="admin">admin
                                    <input type="checkbox" name="" value="user">user
                                </li>
                                <a id="closeBtn1" class="button">取消添加</a>
                                <a class="button" onclick="document:createUserform.submit()">确认添加</a>

                            </form></div>


                        <c:forEach items="${userList}" var="user">
                        <!-- 弹出窗口-更改权限 -->
                        <div id="change-authority-box">
                            <form id="changeRoleform" action="${ctx}/admin/access/update/${user.id}" method="post">
                                <li>
                                    <lable>用户名：</lable>
                                    <label id="edit-name">${user.username}</label>
                                </li>
                                <li>
                                    <lable>更改权限：</lable>

                                    <input type="checkbox" name="" value="admin" class="checkbox" >admin
                                    <input type="checkbox" name="" value="user" class="checkbox">user
                                </li>
                                <a id="closeBtn2" class="button">取消修改</a>
                                <a class="button" onclick="document:changeRoleform.submit()">确认修改</a>
                            </form>
                        </div>
                        </c:forEach>

                        <!-- 弹出窗口-删除用户 -->
                        <div id="delect-box">
                            <form id="delectform" action="${ctx}/admin/access/delect/${user.id}" method="post">
                                <div class="ttBox">
                                    <h1>提示</h1>
                                </div>
                                <div class="txtBox">
                                    <p>你确定要删除该用户吗？？？（小心挨打</p>
                                </div>
                                <div class="btnArea">
                                    <div class="btnArea">
                                        <a class="button" id="closeBtn3">取消删除</a>
                                        <a class="button" onclick="document:delectform.submit()">确定删除</a>
                                    </div>
                                </div>
                            </form>
                        </div>


                        <!-- 分页 -->
                        <div class="row">
                            <ul class="pagination">
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page_link"
                                       id="dataTable_previous disabled">Previous</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page_link">1</a>
                                </li>

                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="2" tabindex="0"
                                       class="page_link next" id="dataTable_next">Next</a></li>
                            </ul>
                        </div>
                    </form>
                </div>


        </div><!-- card -->
    </div>
</div><!-- container-fluid -->


</div>


</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/js/accessManagement.js"></script>

</body>
</html>