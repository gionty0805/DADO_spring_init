package com.dado.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dado.demo.vo.BoardVO;


public interface BoardService {
	List<BoardVO> getBoardList();
}
