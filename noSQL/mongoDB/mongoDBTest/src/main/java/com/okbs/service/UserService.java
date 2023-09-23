package com.okbs.service;

import java.util.List;

import com.okbs.document.UserDocument;

public interface UserService {
	UserDocument createUser(UserDocument userDocument);
	UserDocument createUser2(UserDocument userDocument);
	List<UserDocument> selectAllUsers();
	UserDocument selectById(String id);
	void updateUser(String id, UserDocument userDocument);
	void deleteUser(String id);
}
