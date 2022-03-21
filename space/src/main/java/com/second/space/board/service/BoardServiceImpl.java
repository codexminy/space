package com.second.space.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.PaymentsCategoryDTO;
import com.second.space.mapper.BoardXMLMapper;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardXMLMapper boardMapper;

	@Override
	public List<PaymentsCategoryDTO> getPaymentsCategory() throws Exception {
		
		return boardMapper.getPaymentsCategory();
	}
	
	@Override
	public String getAddress(int user_id) {
		
		return boardMapper.getAddress(user_id);
	}
	
	@Override
	public int insertBoard(BoardDTO board) {
		
		return boardMapper.insertBoard(board);
	}
	
	@Override
	public int getBoardId(Integer user_id) {
		
		return boardMapper.getBoardId(user_id);
	}

	@Override
	public int insertBoardImg(List<BoardImgDTO> imgList) {
		int result = 0;
		
		for(int i = 0; i < imgList.size(); i++) {
			result = boardMapper.insertBoardImg(imgList.get(i));
			if(result == 0) {
				break;
			}
		}
		
		return result;
	}
	
	@Override
	public BoardDTO getBoardDto(int board_id) {
		
		return boardMapper.getBoardDto(board_id);
	}
	
	@Override
	public List<BoardImgDTO> getBoardImgDto(int board_id) {
		return boardMapper.getBoardImgDto(board_id);
	}
	
	@Override
	public String getCategoryName(int p_category_id) {
		return boardMapper.getCategoryName(p_category_id);
	}

	
	
	
	
}
