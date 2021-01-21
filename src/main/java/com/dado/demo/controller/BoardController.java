package com.dado.demo.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dado.demo.service.BoardService;
import com.dado.demo.service.CommentService;
import com.dado.demo.service.FileService;
import com.dado.demo.vo.BoardPostVO;
import com.dado.demo.vo.CommentVO;
import com.dado.demo.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {

	BoardService service;
	CommentService commentService;
	FileService fileService;
	
	@GetMapping("list/{board_id}/{pageVO.page_no}")
	public String list(Model model, BoardPostVO boardVO) {
		log.info(boardVO);
		model.addAttribute("pagination",new PageDTO(boardVO.getPageVO(), service.getPostTotal(boardVO)));
		model.addAttribute("boardVO",boardVO);
		model.addAttribute("list",service.getPostList(boardVO));
		return "/board/list";
	}

	@GetMapping("write/{board_id}")
	public String write(Model model, BoardPostVO vo) {
		log.info(vo);

		//글 답변
		if(vo.getOrigin_no() != 0){
			model.addAttribute("boardVO", service.getPost(vo));
		}else{

			//글 수정
			if(vo.getPost_id() != 0){
				model.addAttribute("boardVO", service.getPost(vo));

			//새 글 등록
			}else{
				model.addAttribute("boardVO", vo);
			}
		}

		model.addAttribute("board", vo);
		return "/board/write";
	}

	@PostMapping("write")
	public String write(BoardPostVO vo, RedirectAttributes rttr) throws IOException {
		log.info(vo);
		rttr.addFlashAttribute("result", service.registerPost(vo) ? "insert_success" : "error");
		return "redirect:/board/list/"+vo.getBoard_id()+"/1"; //1page
	}

	@GetMapping("view/{board_id}/{post_id}/{comment_cnt}")
	public String view(Model model, BoardPostVO vo, CommentVO cvo) {
		model.addAttribute("board", service.getPost(vo));
		//model.addAttribute("comment",commentService.getCommentList(cvo));
		return "/board/view";
	}

	@PostMapping("delete")
	public String delete(Model model, BoardPostVO vo, RedirectAttributes rttr){

		rttr.addFlashAttribute("result", service.removePost(vo) ? "delete_success" : "error");
		return "redirect:/board/list/"+vo.getBoard_id()+"/1"; //1page
	}

	@PostMapping("update")
	public String update(BoardPostVO vo, RedirectAttributes rttr) throws IOException {
		rttr.addFlashAttribute("result", service.updatePost(vo) ? "update_success" : "error");
		return "redirect:/board/list/"+vo.getBoard_id()+"/1"; //1page
	}

}
