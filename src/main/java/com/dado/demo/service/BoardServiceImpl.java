package com.dado.demo.service;

import java.util.List;

import com.dado.demo.mapper.BoardMapper;
import com.dado.demo.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getBoardList() {
		//log.info("ajdi");
		return mapper.getBoardList();
	}

}
