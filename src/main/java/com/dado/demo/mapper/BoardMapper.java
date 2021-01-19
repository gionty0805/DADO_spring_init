package com.dado.demo.mapper;

import java.util.List;

import com.dado.demo.vo.BoardPostVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.dado.demo.vo.BoardVO;

@Repository("com.dado.demo.mapper.BoardMapper")
public interface BoardMapper {
	List<BoardPostVO> selectPostList(BoardPostVO vo);
	int insertPost(BoardPostVO vo);

	BoardPostVO selectPost(BoardPostVO vo);

	int selectPostTotal(BoardPostVO vo);

	int deletePost(BoardPostVO vo);

	int updatePost(BoardPostVO vo);
}
