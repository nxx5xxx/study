package com.simple.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simple.domain.UserDTO;
import com.simple.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDAO userDAO;
	
	@Override
	public UserDTO getUserTest(String id) {
		return userDAO.getUserTest(id);
	}
	@Override
	public List<UserDTO> getUserList() {
		return userDAO.getUserList();
	}
	@Override
	public void updateUserList(List<UserDTO> userDTOList) {
		
		for(UserDTO UserDTO : userDTOList) {
			System.out.println(UserDTO.toString());
			userDAO.updateUserList(UserDTO);
		}
		
	}
}
