package com.connectDB.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connectDB.dao.TestDAO;
import com.connectDB.dto.Test1DTO;

@Service
public class TestService {

	@Autowired
	TestDAO testDAO;
	
	public List<Test1DTO> selectTest1(){
		return testDAO.selectTest1();
	}
}
