package com.dado.demo.service;

import java.util.List;

import com.dado.demo.vo.BoardPostVO;
import com.dado.demo.vo.CommentVO;


public interface CommentService {
	
	List<CommentVO> getCommentList(CommentVO vo);
	
}
