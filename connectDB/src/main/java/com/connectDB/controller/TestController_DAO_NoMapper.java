package com.connectDB.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connectDB.service.TestService;

@Controller
public class TestController_DAO_NoMapper {
	@Autowired
	TestService testService;
	
	@RequestMapping("/selectDAO")
	public void selectTest(Model model) {
		model.addAttribute("list", testService.selectTest1());
	}
}
