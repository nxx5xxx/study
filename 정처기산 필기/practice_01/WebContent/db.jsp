<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql ="";
		Class.forName("oracle.jdbc.OracleDriver");
		conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jungbo","1234");
 %>