<%@ page import="java.sql.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
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
    new com.mysql.jdbc.Driver();
    Connection connection = DriverManager.getConnection("jdbc:mysql:///?user=root&password=wang");
    String sql= "INSERT INTO db_javaee.user VALUE (null,?,?,?)";
    PreparedStatement statement =connection.prepareStatement(sql);
    statement.setString(1,nick);
    statement.setString(2,mobile);
    statement.setString(3,password);
    statement.executeUpdate();
    statement.close();
    connection.close();
    response.sendRedirect("test.jsp");

%>
</body>
</html>
