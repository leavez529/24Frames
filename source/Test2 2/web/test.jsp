<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tanrui
  Date: 2018/12/19
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/login" method="post">
    <input type="text" name="id" />
    <input type="password" name="password" />
    <button type="submit">提交</button>
</form>

<form action="/search" method="post">
    <input type="text" name="key"/>
    <button type="submit">提交</button>
</form>
<c:choose>
    <c:when test="${requestScope.get(ConstantDefinition.LOGIN_RETURN) == ConstantDefinition.WRONG_USER}">
        用户名错误
    </c:when>
    <c:when test="${requestScope.get(ConstantDefinition.LOGIN_RETURN) == ConstantDefinition.WRONG_PWD}">
        密码错误
    </c:when>
    <c:otherwise>
        请登录
    </c:otherwise>
</c:choose>


</body>
</html>
