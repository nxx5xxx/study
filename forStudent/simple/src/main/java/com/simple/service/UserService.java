package com.simple.service;

import java.util.List;

import com.simple.domain.UserDTO;

public interface UserService {
	public UserDTO getUserTest(String id);
	public List<UserDTO> getUserList();
	public void updateUserList(List<UserDTO> userDTOList);
}
