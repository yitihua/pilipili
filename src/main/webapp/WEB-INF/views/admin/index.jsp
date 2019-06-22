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
	<link rel="stylesheet" href="${ctx}/static/css/reset.css">
	<link href="${ctx}/static/font/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/navbar.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/manage_index.css">

	<title>PiliPili</title>
    <script src="${ctx}/static/vue/vue.js"></script>
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
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="#">index</a>
				</li>
				<li class="breadcrumb-item">
					<span>/ 新闻管理</span>
				</li>
			</ol>

			<div class="card">	

				<div class="card-header">
					<i class="fa fa-table"></i>
					<span>最新资讯</span>
					<a href="${ctx}/admin/newsEdit/create">添加<i class="fa fa-plus-square"></i></a>
				</div>

				<div class="card-body">
					<!-- 新闻 -->
					<div class="row">
						<form >
							<table style="text-align: center;">
								<thead>
									<tr >
										<th>标题</th>
										<th>类别</th>
										<th>发布人</th>
										<th>发布时间</th>
										<th colspan="2">编辑</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${newsPage.content}" var="news">
                                    <tr>
                                        <td style="width: 200px;">${news.title}</td>
                                        <td>${news.type.name}</td>
                                        <td>${news.author.username}</td>
                                        <td style="width: 200px">${news.createAt}</td>
                                        <td>
											<a herf="${ctx}/admin/newsEdit/${news.id}" onclick="window.location.href='${ctx}/admin/newsEdit/${news.id}'">编辑</a>
										</td>
										<td><a class="delect" dict-id="${dict.id}">删除</a></td>
                                    </tr>
								</c:forEach>
								</tbody>
							</table>
							<tags:pagination page="${newsPage}" paginationSize="${PAGE_SIZE}"/>
						</form>
					</div>

					<!-- 弹出窗口-删除字典 -->
					<div id="delect-box"  >
						<form id="delectform" action="${ctx}/admin/dict/delete/" >
							<div class="ttBox">
								<h1>提示</h1>
							</div>
							<div class="txtBox">
								<p>你确定要删除本条新闻吗？？？（小心挨打</p>
							</div>
							<div class="btnArea">
								<div class="btnArea">
									<a  class="button" onclick="delectform.submit()">确定删除</a>
									<a class="button" id="closeBtn3">取消删除</a>
								</div>
							</div>
						</form>
					</div>
					<!-- 分页 -->
					<%--<div class="row">--%>
						<%--<ul class="pagination">--%>
							<%--<li class="paginate_button">--%>
								<%--<a href="" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page_link" id="dataTable_previous disabled">Previous</a></li>--%>
							<%--<li class="paginate_button">--%>
								<%--<a href="" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page_link">1</a></li>--%>
							<%--<li class="paginate_button">--%>
								<%--<a href="" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page_link next" id="dataTable_next">Next</a></li>--%>
						<%--</ul>--%>
					<%--</div>--%>
			</div><!-- card -->
		</div>
		</div><!-- container-fluid -->
	</div><!-- container -->

	<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script>
$(function () {
	$(".delect").click(function(){
		$('#delect-box').show();

		var currentId = this.getAttribute("dict-id");
		var actionIndex=$('#delectform').attr('action');
		var tempurl =actionIndex +currentId;
		$('#delectform').attr('action',tempurl);

		getElementById("delectform").submit();
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