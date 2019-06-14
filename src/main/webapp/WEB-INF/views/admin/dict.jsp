<%--
  Created by IntelliJ IDEA.
  User: orange
  Date: 2019/6/1
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
    <%--引入jquery--%>
    <script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
    <title>数据字典</title>
</head>
<body>


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
    <div class="container-fluid">
        <!-- 当前所在页面 -->

        <!-- 弹出窗口-添加字典 -->
        <div id="add-box">
            <form action="${ctx}/admin/dict/createDict" method="post" id="addDictform">
                <li>
                    <lable>字典名称：</lable>
                    <input type="text" name="type"></li>
                <li>
                    <lable>属性名称：</lable>
                    <input type="text" name="name"></li>
                <li>
                    <lable>属性状态：</lable>
                    <select name="status">
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </li>
                    <a id="closeBtn" class="button">取消添加</a>
                <a  class="button" onclick="addDictform.submit()">确认添加</a>
            </form>
        </div>

        <c:forEach items="${dictPage.content}" var="dict" >
        <%--弹框-修改字典--%>
        <div id="edit-box">
            <form id="editDictform" action="${ctx}/admin/dict/updateDict/${dict.id}" method="post">
                <li>
                    <lable>字典名称：</lable>
                    <input type="text" name="type" id="edit-name">
                </li>
                <li>
                    <lable>属性名称：</lable>
                    <input type="text" name="name" id="edit-type">
                </li>
                <li>
                    <lable>属性状态：</lable>
                    <select name="status" id="edit-status">
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </li>
                    <a id="closeBtn2" class="button">取消修改</a>
                    <a  class="button"  onclick="editDictform.submit()" >确认修改</a>
            </form>
        </div>
        </c:forEach>



        <!-- 弹出窗口-删除字典 -->
        <div id="delect-box"  >
            <form id="delectDictform" action="${ctx}/admin/dict/delete/" method="post">
                <div class="ttBox">
                    <h1>提示</h1>
                </div>
                <div class="txtBox">
                    <p>你确定要删除该用户吗？？？（小心挨打</p>
                </div>
                <div class="btnArea">
                    <div class="btnArea">
                        <a  class="button" onclick="delectDictform.submit()">确定删除</a>
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
                <span>/ 数据字典</span>
            </li>
        </ol>

        <div class="card">

            <div class="card-header">
                <i class="fa fa-table"></i>
                <span>数据字典</span>
                <a id="addDict">添加<i class="fa fa-plus-square"></i></a>
            </div>

            <div class="card-body">
                <div class="row"></div>

                <!-- 字典列表 -->
                <div class="row">
                    <form>
                        <table style="text-align: center;">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>字典名称</th>
                                <th>属性名称</th>
                                <th>属性状态</th>
                                <th colspan="2" >操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${dictPage.content}" var="dict" varStatus="idxStatus">
                            <tr>
                                <td>${idxStatus.index+1}</td> <%--表示序号 不要改--%>
                                <td>${dict.type}</td>
                                <td>${dict.name}</td>
                                <td>${dict.status}</td>
                                <td>
                                    <a class="edit"  dict-type="${dict
                                .type}" dict-name="${dict.name}" dict.status="${dict.status}">编辑</a>
                                </td>
                                <td><a class="delect" dict-id="${dict.id}">删除</a></td>
                            </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <tags:pagination page="${dictPage}" paginationSize="${PAGE_SIZE}"/>

                        <!-- 分页 -->
                        <%--<div class="row">--%>
                            <%--<ul class="pagination">--%>
                                <%--<li class="paginate_button">--%>
                                    <%--<a href="" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page_link" id="dataTable_previous disabled">Previous</a></li>--%>
                                <%--<li class="paginate_button">--%>
                                    <%--<a href="" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page_link">1</a></li>--%>

                                <%--<li class="paginate_button">--%>
                                    <%--<a href="" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page_link next" id="dataTable_next">Next</a></li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    </form>
                </div>
            </div><!-- card -->
        </div>
    </div><!-- container-fluid -->

</div>
</div>
<script type="text/javascript" src="${ctx}/static/js/navbar.js"></script>
<script type="text/javascript" src="${ctx}/static/js/admin_dict.js"></script>

</body>
</html>
