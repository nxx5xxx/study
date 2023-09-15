package com.connectDB.test;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

public class MySQL_InsertTest {
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/connectDB";
	private final static String USER = "root";
	private final static String PASS = "1234";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	@Test
	public void test() {
		int sw=0;
		try {
			Class.forName(DRIVER);
			try {
				conn = DriverManager.getConnection(URL,USER,PASS);
				try {
					pstmt = conn.prepareStatement("insert into test1 values(?,?,?)");
					pstmt.setString(1, "test02");
					pstmt.setString(2, "테스트2");
					pstmt.setInt(3, 1234);
					sw=pstmt.executeUpdate();
					if(sw>0) {
						System.out.println(sw+"개의 행이 삽입되었습니다");
					}
					
					pstmt.close();
					conn.close();
				} catch (Exception e) {
					System.out.println("sql전송실패"+e);
				}
			} catch (Exception e) {
				System.out.println("DB연결실패"+e);
			}
		} catch (Exception e) {
			System.out.println("드라이버 로딩실패"+e);
		}
	}

}
