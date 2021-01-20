package com.dado.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dado.demo.mapper.CommentMapper;
import com.dado.demo.vo.CommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {

	private CommentMapper mapper;
	@Override
	public List<CommentVO> getCommentList(CommentVO vo) {
		return mapper.selectCommentList(vo);
	}

}
