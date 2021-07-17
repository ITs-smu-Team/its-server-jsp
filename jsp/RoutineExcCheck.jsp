<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

    <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hometraining?serverTimezone=UTC&useSSL=false");
    PreparedStatement statement = con.prepareStatement("select name, engname from routine where id=? and routine_name=?");
    statement.setString(1, request.getParameter("UserId"));
    statement.setString(2, request.getParameter("RoutineName"));
    ResultSet rs = statement.executeQuery();

    while(rs.next()){
        response.getWriter().write(rs.getString(1)+","+rs.getString(2)+",");
        }
        con.close();
        %>
