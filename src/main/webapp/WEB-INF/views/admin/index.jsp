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
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/manage_index.css">

	<title>PiliPili</title>
    <script src="${ctx}/static/vue/vue.js"></script>
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
            <a class="sidenav-first-level">
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
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="#">index</a>
				</li>
				<li class="breadcrumb-item">
					<span>/ 时政要闻管理</span>
				</li>
			</ol>

			<div class="card">	

				<div class="card-header">
					<i class="fa fa-table"></i>
					<span>最新资讯</span>
				</div>

				<div class="card-body">
					<div class="row">
						<!-- 控制每页显示新闻数目 -->
						<div class="newsnumber">
								<span>显示</span>
								<select name=""  aria-controls="dataTable">
									<option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option>
								</select>
								<span>条信息</span>
						</div>
						<!-- 搜索框 -->
						<div class="searchbox">
							<span>查询：</span>
							<input type="search" aria-controls="dataTable" name="">
						</div>

					</div>							

					<!-- 新闻 -->
					<div class="row">
						<form>
							<table>
								<thead>
									<tr>
										<th>标题</th>
										<th>类别</th>
										<th>发布人</th>
										<th>发布时间</th>
										<th>编辑</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${newsList}" var="news">
                                    <tr>
                                        <td>${news.title}</td>
                                        <td>${news.type.name}</td>
                                        <td>${news.author.username}</td>
                                        <td>${news.createAt}</td>
                                        <td>编辑</td>
                                    </tr>
								</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
			
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
			</div><!-- card -->
		</div>
		</div><!-- container-fluid -->

				<div class="card-footer"></div>
	</div><!-- container -->


	<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
	<!-- <script type="text/javascript" src="js/jquery.dataTables.js"></script> -->



</body>
</html>