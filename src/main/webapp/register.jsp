<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %><%--
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
    String nick=request.getParameter("nick").trim();
    out.print(nick);
    String mobile=request.getParameter("mobile").trim();
    out.print(mobile);
    String password=request.getParameter("password");
    out.print(password);
    if (nick.length() == 0 || mobile.length() == 0 || password.length() == 0) {
        request.setAttribute("message","昵称或用户名不能为空");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    // TODO: 2017/6/8 验证 nick password 是否存在
    String[] hobbies =request.getParameterValues("hobbies");
    String[] cities =request.getParameterValues("cities");

//    System.out.println("hobbies: "+ Arrays.toString(hobbies));
//    System.out.println("cities: "+Arrays.toString(cities));
    new com.mysql.jdbc.Driver();
    Connection connection = DriverManager.getConnection("jdbc:mysql:///?user=root&password=wang");

    String sqlnick ="SELECT * FROM db_javaee.user WHERE nick = ?";
    PreparedStatement statement=connection.prepareStatement(sqlnick);
    statement.setString(1,nick);
    ResultSet resultSet =statement.executeQuery();
    boolean isnickExist =resultSet.next();
    String sqlMobile = "SELECT * FROM db_javaee.user WHERE mobile = ?";
    statement = connection.prepareStatement(sqlMobile);
    statement.setString(1,mobile);
    resultSet =statement.executeQuery();
    boolean isMobileExist =resultSet.next();



    if (isnickExist) {
        request.setAttribute("message","昵称已经存在");
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    } else if (isMobileExist) {
        request.setAttribute("message", "手机号已经存在");
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    } else {


        String sql = "INSERT INTO db_javaee.user VALUE (NULL,?,?,?,?,?)";
        statement = connection.prepareStatement(sql);
        statement.setString(1, nick);
        statement.setString(2, mobile);
        statement.setString(3, password);
        statement.setString(4,Arrays.toString(hobbies));
        statement.setString(5,Arrays.toString(cities));
        statement.executeUpdate();
        response.sendRedirect("index.jsp");
    }
    statement.close();
    connection.close();
    resultSet.close();

%>
</body>
</html>
