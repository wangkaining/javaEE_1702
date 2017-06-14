<%@ page import="demo.model.Student" %><%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/13
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>首页</h1>
<form action="user" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="mobile" placeholder="手机号"><br>
    <input type="password" name="password" placeholder="密码"><br>
    <input type="submit" value="登录">
</form>
<p>${requestScope.message}</p>
<a href="signup.jsp">注册</a>
</body>
</body>
</html>
