package com.connectDB.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQL8 {
	private final static String DRIVER ="com.mysql.cj.jdbc.Driver";
	private final static String URL="jdbc:mysql://localhost:3306/connectDB";
	private final static String USER="root";
	private final static String PASS="1234";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//쿼리문 쓸 영역
	public final static String SELECT_TEST1 = "select * from test1";
	
	
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
		return conn;
	}
	
	public static void close(PreparedStatement pstmt, Connection conn){
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs,PreparedStatement pstmt, Connection conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
