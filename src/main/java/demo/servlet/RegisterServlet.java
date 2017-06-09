package demo.servlet;

import demo.util.Db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

/**
 * Created by 王凯宁 on 2017/6/9.
 * servlet 服务器端小程序
 * 1. 接收请求
 * 2.出来请求
 * 3.返回响应
 */
@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//ctrl+o 重写父类方法
//        super.doPost(req, resp);
        String nick = req.getParameter("nick").trim();

        String mobile = req.getParameter("mobile").trim();

        String password = req.getParameter("password");

        if (nick.length() == 0 || mobile.length() == 0 || password.length() == 0) {
            req.setAttribute("message", "昵称或用户名不能为空");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        String[] hobbies = req.getParameterValues("hobbies");
        String[] cities = req.getParameterValues("cities");

        Connection connection = Db.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        try {
            String sqlnick = "SELECT * FROM db_javaee.user WHERE nick = ?";
            if (connection != null) {
                statement = connection.prepareStatement(sqlnick);
            } else {
                return;
            }
            statement.setString(1, nick);
            resultSet = statement.executeQuery();
            boolean isnickExist = resultSet.next();

            String sqlMobile = "SELECT * FROM db_javaee.user WHERE mobile = ?";
            statement = connection.prepareStatement(sqlMobile);
            statement.setString(1, mobile);
            resultSet = statement.executeQuery();
            boolean isMobileExist = resultSet.next();
            if (isnickExist) {
                req.setAttribute("message", "昵称已经存在");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);

            } else if (isMobileExist) {
                req.setAttribute("message", "手机号已经存在");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);
            } else {


                String sql = "INSERT INTO db_javaee.user VALUE (NULL,?,?,?,?,?)";
                statement = connection.prepareStatement(sql);
                statement.setString(1, nick);
                statement.setString(2, mobile);
                statement.setString(3, password);
                statement.setString(4, Arrays.toString(hobbies));
                statement.setString(5, Arrays.toString(cities));
                statement.executeUpdate();
                resp.sendRedirect("index.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            Db.close(resultSet,statement ,connection );
        }
    }
}

