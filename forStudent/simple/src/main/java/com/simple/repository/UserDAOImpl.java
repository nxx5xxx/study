package com.simple.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simple.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public UserDTO getUserTest(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserTest",id);
		
	}
}
