package com.dado.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {
	
	@RequestMapping(value = "/" , method=RequestMethod.GET) 
	public String Hello() { // jsp ������ ȣ�� 
		return "main"; 
	} 
	
	@RequestMapping(value = "/hello" , method=RequestMethod.GET) 
	public String Hello(Model model) { // Spring ���� �����ϴ� Model ��ü�� ����Ͽ� ���������� �����͸� �Ѱ��ش�. 
		model.addAttribute("name" , "TEST"); // jsp ������ ȣ�� 
		return "hello"; 
	}
		
}

//https://github.com/gionty0805/DADO_spring_init.git
