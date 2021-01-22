package com.dado.demo.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dado.demo.vo.BoardPostVO;
import com.dado.demo.vo.CommentVO;

@Repository("com.dado.demo.mapper.CommentMapper")
public interface CommentMapper {
	
	List<CommentVO> selectCommentList(CommentVO cvo);

	int insertComment(CommentVO cvo);
}
