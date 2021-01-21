package com.dado.demo.service;

import java.util.List;

import com.dado.demo.vo.BoardPostVO;
import org.springframework.stereotype.Service;

import com.dado.demo.vo.BoardVO;


public interface BoardService {
	List<BoardPostVO> getPostList(BoardPostVO vo);
    boolean registerPost(BoardPostVO boardVO);

    BoardPostVO getPost(BoardPostVO vo);

    int getPostTotal(BoardPostVO vo);

    boolean removePost(BoardPostVO vo);

    boolean updatePost(BoardPostVO vo);

}
