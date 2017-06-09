<%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/8
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if (session.getAttribute("nick") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<h1>第二页</h1>
<a href="home.jsp">回到主页</a>
<%=session.getAttribute("nick")%>

</body>
</html>
