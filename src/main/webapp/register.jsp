<%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/7
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register pate</title>
</head>
<body>
<%
    String nick=request.getParameter("nick");
    out.print(nick);
    String mobile=request.getParameter("mobile");
    out.print(mobile);
    String password=request.getParameter("password");
    out.print(password);
%>
</body>
</html>
