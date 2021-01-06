package com.dado.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dado.demo.vo.BoardVO;

@Mapper
public interface BoardMapper {
	List<BoardVO> getBoardList();
}
