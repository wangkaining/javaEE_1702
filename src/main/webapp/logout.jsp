<%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/8
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

</body>
</html>