<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>数据字典列表</title>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/commons.js"></script>
    <script>
        $(document).ready(function(){
            $("#btn_bkCreate").click(function(){//生成补考名单
                window.location.href="${ctx}/dict/create";
            }) ;
            checkAllFunction("#chkAll","chkIds");
            $("#id_delete").click(function () {
                if (confirm("你确定要删除吗？")){
                    var id =$("#id_delete").attr("dict");
                    window.location.href="${ctx}/dict/delete/"+id;
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <h3>数据字典管理
        <small><a href="${ctx}/index">首页</a></small>
    </h3>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-default" id="btn_bkCreate">创建</button>
            <button type="button" class="btn btn-danger" id="btn_bkDelete">批量删除</button>
        </div>
        <div class="col-md-12">
            <form class="form-search" method="post" action="#">
                <label>名称：</label> <input type="text" name="s_LIKE_name" class="input-medium" value="${param.s_LIKE_name}">
                <button type="submit" class="btn btn-danger"><i class="icon-search"></i> Search</button>
            </form>
        </div>
    </div>



    <%--                    分页部分开始                                  --%>
    <table id="contentTable" class="table table-striped table-hover">
        <thead><tr>
            <th><input type="checkbox" id="chkAll"></th>
            <th>序号</th>
            <th>字典名称</th>
            <th>属性编码</th>
            <th>属性名称</th>
            <th>属性状态</th>
            <th>管理</th></tr></thead>
        <tbody>
        <c:forEach items="${newsList.content}" var="news" varStatus="idxStatus">   <%--这行的EL表达式中的.content不能改 varStatus里的不要改--%>
            <tr>
                <td><input type="checkbox" name="chkIds" value="${news.id}"></td>
                <td>${idxStatus.index+1}</td> <%--表示序号 不要改--%>
                <td>${news.type.name}
                </td>
                <td>${news.author.username}</td>
                <td>${news.title}</td>
                <td>${news.createAt}</td>
                <td> <a href="${ctx}/dict/update/${news.id}">编辑</a>  |   <a href="#" id="id_delete" dict="${news.id}">删除</a>
                </td>
            </tr>
        </c:forEach>     <%--程羚--%>
                                <%--程羚--%>
        <%--!!!!!程羚注意了！！！！程羚底下还有一行！！！！--%>
        </tbody>
    </table>
    <tags:pagination page="${newsList}" paginationSize="${PAGE_SIZE}"/>  <%--这行的page_size不能改--%>
    <%--                   分页部分结束                                   --%>



</div>


<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
