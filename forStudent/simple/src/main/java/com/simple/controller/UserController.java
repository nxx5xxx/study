package com.simple.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simple.domain.UserDTO;
import com.simple.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/test")
	public String test1(@RequestParam String id, Model model) {
		UserDTO userDTO = userService.getUserTest(id);
		model.addAttribute("user",userDTO);
		return "user/test";
	}
}
