<%--
  Created by IntelliJ IDEA.
  User: 王凯宁
  Date: 2017/6/6
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<form action="user" method="post"><%-- 这段话 是 地址栏不显示密码  --%>
  <input type="hidden" name="action" value="login">
  <input type="text" name="mobile" placeholder="邮箱"><br>  <%-- 用户登录用户名 或者说是 邮箱  --%>
  <input type="password" name="password" placeholder="密码"><br><%-- 用户登录密码 --%>
  <input type="submit" value="登录"> <%-- 登陆按钮 --%>
</form>
<%--<p><%=request.getAttribute("message")%></p>--%> <%--  表达式  某一隐式对象调用某一个方法能返回一个值就可以用动作表达式--%>
<p>
  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
      out.print(message);
    }
  %>
</p>
<a href="signup.jsp">注册</a>
  </body>
</html>
