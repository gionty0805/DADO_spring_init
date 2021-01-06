package com.dado.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dado.demo.service.BoardService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("list")
	public void list(Model model) {
		System.out.println(service.getBoardList().get(0));
		model.addAttribute("list",service.getBoardList());
	}
	
}
