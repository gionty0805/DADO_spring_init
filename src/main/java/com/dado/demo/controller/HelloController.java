package com.dado.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

	@GetMapping("/login")
	public String login(){
		return "login";
	}

	@RequestMapping(value = "/" , method=RequestMethod.GET)
	public String Hello() { // jmesp 페이지 호출
		return "main";
	}

	@RequestMapping(value = "/hello" , method=RequestMethod.GET)
	public String Hello(Model model) { // Spring 에서 제공하는 Model 객체를 사용하여 뷰페이지에 데이터를 넘겨준다.
		model.addAttribute("name" , "TEST"); // jsp 페이지 호출
		return "hello";
	}

}

//https://github.com/gionty0805/DADO_spring_init.git
