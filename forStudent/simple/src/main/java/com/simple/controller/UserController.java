package com.simple.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping("/checkBox")
	public String checkBox(Model model) {	
		List<UserDTO> userList = userService.getUserList();
		model.addAttribute("userList",userList);
		return "user/checkBox";
	}
	
	
//	아래 적는 포스트맵핑은 원래 컨트롤러단보다는 서비스나 다오에서 완성하는게 좋습니다
	@PostMapping("/listEdit")
	public String checkBoxEdit(Model model,
			@RequestParam("no") String[] no ,
			@RequestParam("index") String[] index,
			@RequestParam("id") String[] id ,
			@RequestParam("passwd") String[] passwd,
			@RequestParam("name") String[] name
			) {
//		기존 문제가 체크되어있지않은 값 까지 갖고와서 문제가 되지만 이미 no를 primary key로 설정해놔서
//		인덱스 번호를 기준으로 갖고올수 있게끔하였습니다
		System.out.println(Arrays.toString(index));
		
		// 인덱스 번호를 기준으로 데이터를 뽑아서 넣습니다
		List<UserDTO> tmpList = new ArrayList<UserDTO>();
		for(int i=0;i<index.length;i++) {
//			아래 tmpIndex는 jsp에서 받아온 인덱스넘버입니다
			int tmpIndex = Integer.parseInt(index[i]);
			UserDTO tmpUser = new UserDTO();
			tmpUser.setNo(no[tmpIndex]);
			tmpUser.setId(id[tmpIndex]);
			tmpUser.setPasswd(passwd[tmpIndex]);
			tmpUser.setName(name[tmpIndex]);
//			수정된정보를 담은 리스트를 다시 보냅니다
			tmpList.add(tmpUser);
		}
		
		userService.updateUserList(tmpList);

		List<UserDTO> userList = userService.getUserList();
		model.addAttribute("userList",userList);
		return "user/checkBox";
	}
}
