package com.dado.demo.service;

import java.util.List;

import com.dado.demo.mapper.FileMapper;
import com.dado.demo.vo.BoardPostVO;
import com.dado.demo.vo.FileVO;
import org.springframework.stereotype.Service;

import com.dado.demo.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.transaction.annotation.Transactional;

@Log4j2
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	private FileMapper fileMapper;
	
	@Override
	public List<BoardPostVO> getPostList(BoardPostVO vo) {
		return mapper.selectPostList(vo);
	}

	@Transactional
	@Override
	public boolean registerPost(BoardPostVO vo) {
		int insert_result = 0;
		log.info(mapper);
		if(mapper.insertPost(vo) > 0){
			if(vo.getFile_list() != null){
				int board_id = vo.getBoard_id(), post_id = vo.getPost_id();

				for (FileVO fileVO: vo.getFile_list()) {
					fileVO.setBoard_id(board_id);
					fileVO.setPost_id(post_id);
					insert_result += fileMapper.insertFile(fileVO);
				}
				return insert_result > 0;
			}
			return true;
		}
		return false;
	}

	@Override
	public BoardPostVO getPost(BoardPostVO vo) {
		vo = mapper.selectPost(vo);
		vo.setFile_list(fileMapper.selectFileList(FileVO.builder()
														.board_id(vo.getBoard_id())
														.post_id(vo.getPost_id())
														.build()));
		//log.info(vo);
		return vo;
	}

	@Override
	public int getPostTotal(BoardPostVO vo) {
		return mapper.selectPostTotal(vo);
	}

	@Override
	public boolean removePost(BoardPostVO vo) {
		return mapper.deletePost(vo) > 0;
	}

	@Override
	public boolean updatePost(BoardPostVO vo) {

		int insert_result = 0;
		log.info(mapper);
		if(mapper.updatePost(vo) > 0){
			if(vo.getFile_list() != null){
				int board_id = vo.getBoard_id(), post_id = vo.getPost_id();

				for (FileVO fileVO: vo.getFile_list()) {
					fileVO.setBoard_id(board_id);
					fileVO.setPost_id(post_id);
					insert_result += fileMapper.insertFile(fileVO);
				}
				return insert_result > 0;
			}
			return true;
		}
		return false;
	}
}
