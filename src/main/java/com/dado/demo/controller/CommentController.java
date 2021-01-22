package com.dado.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dado.demo.service.CommentService;
import com.dado.demo.vo.BoardPostVO;
import com.dado.demo.vo.CommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/comment")
public class CommentController {

	CommentService commnetService;
	
	@GetMapping("view/{post_id}/{comment_cnt}")
	@ResponseBody
	public List<CommentVO> view_get(Model model, CommentVO cvo) {
		return commnetService.getCommentList(cvo);
	}
	

	@PostMapping("view")
	@ResponseBody
	public List<CommentVO> view_post(Model model, CommentVO cvo) {
		List<CommentVO> list = commnetService.getCommentList(cvo);
		return list;
	}
	
	@PostMapping("write")
	@ResponseBody
	public String write(CommentVO cvo) throws IOException {
		String res =(commnetService.registerComment(cvo) ? "insert_success" : "error");
		return res;
	}
}
