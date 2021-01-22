package com.dado.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dado.demo.mapper.CommentMapper;
import com.dado.demo.vo.BoardPostVO;
import com.dado.demo.vo.CommentVO;
import com.dado.demo.vo.FileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {

	private CommentMapper mapper;
	@Override
	public List<CommentVO> getCommentList(CommentVO cvo) {
		return mapper.selectCommentList(cvo);
	}
	

	@Transactional
	@Override
	public boolean registerComment(CommentVO cvo) {
		int insert_result = 0;

		//글 답변
		if(mapper.insertComment(cvo) > 0){
			return true;
		}
		return false;
	}

}
