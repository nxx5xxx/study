package com.okbs;

import java.util.Scanner;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.okbs.document.UserDocument;
import com.okbs.repository.UserRepository;

@SpringBootTest
class MongoDbTestApplicationTests {
	
	@Autowired
	UserRepository userRepository;
	
	@Test
	@DisplayName("유저리스트")
	void printUsers() {
		System.out.println(userRepository.findAll());
	}
	
	
	@Test
	@DisplayName("유저하나만 검색")
	void printUser() {
		System.out.println(userRepository.findById("1112").orElseThrow());
	}
	
	@Test
	@DisplayName("유저업데이트")
	void updateUser() {
		Scanner sc = new Scanner(System.in);
		System.out.println("변경할 유저 네임을 입력해주세요");
		String userName = sc.nextLine();
		UserDocument user1 = userRepository.findByName(userName);
		user1.setPw("변경된비밀번호");
		userRepository.save(user1);
		sc.close();
	}
	
	@Test
	@DisplayName("유저삭제")
	void deleteUser() {
		Scanner sc = new Scanner(System.in);
		System.out.println("삭제할 유저 네임을 입력해주세요");
		String userName = sc.nextLine();
		userRepository.deleteByName(userName);
	}
}
