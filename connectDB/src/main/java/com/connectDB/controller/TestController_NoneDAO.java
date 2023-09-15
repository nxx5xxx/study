package com.connectDB.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connectDB.dto.Test1DTO;

@Controller
public class TestController_NoneDAO {

	private final static String DRIVER ="com.mysql.cj.jdbc.Driver";
	private final static String URL="jdbc:mysql://localhost:3306/connectDB";
	private final static String USER="root";
	private final static String PASS="1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	@RequestMapping("select")
	public void selectTest(Model model) {
		List<Test1DTO> list = new ArrayList<>();
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
							Test1DTO test1 = new Test1DTO();
							test1.setId(rs.getString("id"));
							test1.setName(rs.getString("name"));
							test1.setPw(rs.getInt("pw"));
							list.add(test1);
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
		model.addAttribute("list", list);
	}
}
