package com.simple.repository;

import java.util.List;

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
	
	@Override
	public List<UserDTO> getUserList() {
		return sqlSessionTemplate.selectList("user1.getUserList");
	}
	
	@Override
	public void updateUserList(UserDTO userDTO) {
		sqlSessionTemplate.update("user1.updateUserList", userDTO);
	}
}
