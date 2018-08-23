package com.ssm.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@ResponseBody
	@RequestMapping("/dynamicEdit.do")
	public String test(String id,String name,String value){
		System.out.println(id+"\n"+name+"\n"+value);
		
		return "success";
	}
}
