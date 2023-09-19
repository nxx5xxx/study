package com.okbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.okbs.document.UserDocument;
import com.okbs.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDocument createUser(UserDocument userDocument) {
		return userRepository.save(userDocument);
	}
	
	@Override
	public UserDocument createUser2(UserDocument userDocument) {
		return userRepository.insert(userDocument);
	}
	
	@Override
	public List<UserDocument> selectAllUsers() {
		return userRepository.findAll();
	}
	
}
