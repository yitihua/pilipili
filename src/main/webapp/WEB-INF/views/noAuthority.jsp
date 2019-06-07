<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/4
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
抱歉，没有权限访问该资源！<br><br>
<a href="${ctx}/index">返回首页</a> &nbsp;&nbsp;&nbsp;<a href="${ctx}/logout">登出</a> <br>
</body>
</html>
