package com.connectDB.test;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

public class MySQL_SelectTest {
	private final static String DRIVER ="com.mysql.cj.jdbc.Driver";
	private final static String URL="jdbc:mysql://localhost:3306/connectDB";
	private final static String USER="root";
	private final static String PASS="1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	@Test
	public void test() {
		try {
			Class.forName(DRIVER);
			try {
				conn = DriverManager.getConnection(URL,USER,PASS);
					try {
						pstmt = conn.prepareStatement("select * from test1");
						rs = pstmt.executeQuery();
						if(rs!=null) {
							System.out.println("DB에 잘 연결되었습니다");
						}
						while(rs.next()) {
							System.out.println("--------------------------");
							System.out.println("id : " + rs.getString("id"));
							System.out.println("name : " + rs.getString("name"));
							System.out.println("pw : " + rs.getInt("pw"));
							System.out.println("--------------------------");
						}
						
						rs.close();
						pstmt.close();
						conn.close();
					} catch (Exception e) {
						System.out.println("쿼리 전송 실패"+e);
				}
			} catch (Exception e) {
				System.out.println("DB연결 실패"+e);
			}
		} catch (Exception e) {
			System.out.println("드라이버 로딩 실패"+e);
		}
	}

}
