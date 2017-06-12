<%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/7
  Time: 15:44
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
<p>主页欢迎<%=session.getId()%></p>
<a href="second.jsp">第二页</a>
<%=session.getAttribute("nick")%>
<%--<p><%=request.getAttribute("nick")%></p>--%>
<%
    pageContext.setAttribute("key","value");
    application.setAttribute("app-key","app-value");
%>
<%=pageContext.getAttribute("key")%>
<%=application.getAttribute("app-key")%>
<p><a href="user?action=logout">注销</a></p>
</body>
</html>
