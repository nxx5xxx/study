package com.okbs;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.okbs.repository.UserRepository;

@SpringBootTest
class MongoDbTestApplicationTests {
	
	@Autowired
	UserRepository userRepository;
	
	@Test
	void printUsers() {
		System.out.println(userRepository.findAll());
	}

}
