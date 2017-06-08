<%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/7
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="login.jsp">
    <input type="text" name="mobile" placeholder="邮箱"><br>
    <input type="password" name="password" placeholder="密码"><br>
    <input type="submit" value="登陆">
</form>
<p><%=request.getAttribute("message")%></p>
<a href="signup.jsp">注册</a>
</body>
</html>
