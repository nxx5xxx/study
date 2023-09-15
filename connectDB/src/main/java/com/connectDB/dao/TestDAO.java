package com.connectDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connectDB.dto.Test1DTO;
import com.connectDB.model.MySQL8;

@Repository
public class TestDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public List<Test1DTO> selectTest1(){
		List<Test1DTO> list = new ArrayList<>();
			try {
				conn = MySQL8.getConnection();
				pstmt = conn.prepareStatement(MySQL8.SELECT_TEST1);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Test1DTO test1 = new Test1DTO();
					test1.setId(rs.getString("id"));
					test1.setName(rs.getString("name"));
					test1.setPw(rs.getInt("pw"));
					list.add(test1);
				}
				
			} catch (Exception e) {
				System.out.println("에러"+e);
			}
			MySQL8.close(rs, pstmt, conn);
		return list;
	}
}
