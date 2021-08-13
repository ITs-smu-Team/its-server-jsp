<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hometraining?serverTimezone=UTC&useSSL=false");
        PreparedStatement statement = con.prepareStatement("select rank() over(partition by team order by point desc),id,point from ranking where team=?");
        statement.setString(1, request.getParameter("userTeam"));
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
                response.getWriter().write(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+",");
        }
        con.close();

%>
