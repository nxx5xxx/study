package com.simple.repository;

import java.util.List;

import com.simple.domain.UserDTO;

public interface UserDAO {
	public UserDTO getUserTest(String id);
	public List<UserDTO> getUserList();
	public void updateUserList(UserDTO userDTO);
}
