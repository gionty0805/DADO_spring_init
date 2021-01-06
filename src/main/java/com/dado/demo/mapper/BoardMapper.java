package com.dado.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dado.demo.vo.BoardVO;

@Repository("com.dado.demo.mapper.BoardMapper")
public interface BoardMapper {
	List<BoardVO> getBoardList();
}
