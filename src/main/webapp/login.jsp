<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/7
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String mobile = request.getParameter("mobile");
    String password = request.getParameter("password");
    new Driver();
    Connection connection= DriverManager.getConnection("jdbc:mysql:///?user=root&password=wang");
    String sql ="SELECT *FROM db_javaee.user WHERE mobile =? AND password =?";
//    PreparedStatement statement= connection.prepareStatement(sql);
    PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
    statement.setString(1,mobile);
    statement.setString(2,password);
    ResultSet resultSet=statement.executeQuery();
    if (resultSet.next()) {
        // success
        response.sendRedirect("home.jsp");  // redirect  重定向
    } else {
        // failed
//        response.sendRedirect("test.jsp"); // redirect  重定向  地址栏 地址有变化
        request.setAttribute("message","用户名或密码错误");
        request.getRequestDispatcher("test.jsp").forward(request,response); // forward  转发   地址栏地址没有发生变化
    }




%>

</body>
</html>
