package com.okbs.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.okbs.document.UserDocument;

public interface UserRepository extends MongoRepository<UserDocument, String>{

}
