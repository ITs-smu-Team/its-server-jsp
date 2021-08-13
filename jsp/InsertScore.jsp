<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hometraining?serverTimezone=UTC&useSSL=false");
        PreparedStatement statement = con.prepareStatement("update ranking set point=? where id=?");
        statement.setString(1, request.getParameter("userScore"));
        statement.setString(2, request.getParameter("userId"));
        int ret=statement.executeUpdate();
        if(ret == 0){
                response.getWriter().write("error");
        }else{
                response.getWriter().write("success");}
        con.close();

%>
