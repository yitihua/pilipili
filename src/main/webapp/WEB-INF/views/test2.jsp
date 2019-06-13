<%--
  Created by IntelliJ IDEA.
  User: dandelion
  Date: 2019/6/13
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${ctx}/test2/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="uploadfile" required="required">
        <input type="submit">
    </form>
    <img src="${ctx}${user.avatar}">
</body>
</html>
