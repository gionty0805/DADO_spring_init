package com.dado.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dado.demo.mapper.BoardMapper;
import com.dado.demo.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getBoardList() {
		log.info("ajdi");
		return mapper.getBoardList();
	}

}
