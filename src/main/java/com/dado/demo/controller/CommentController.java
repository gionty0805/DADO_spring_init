package com.dado.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dado.demo.service.CommentService;
import com.dado.demo.vo.CommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/comment")
public class CommentController {

	CommentService commnetservice;
	
	@GetMapping("view/{post_id}/{comment_cnt}")
	@ResponseBody
	public List<CommentVO> view_get(Model model, CommentVO cvo) {
		return commnetservice.getCommentList(cvo);
	}
	

	@PostMapping("view")
	@ResponseBody
	public List<CommentVO> view_post(Model model, CommentVO cvo) {
		List<CommentVO> list = commnetservice.getCommentList(cvo);
		return list;
	}
}
