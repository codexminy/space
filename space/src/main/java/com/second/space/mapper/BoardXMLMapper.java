package com.second.space.mapper;

import java.util.List;

import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.PaymentsCategoryDTO;

public interface BoardXMLMapper {
	
	List<PaymentsCategoryDTO> getPaymentsCategory();

	String getAddress(int user_id);

	int insertBoard(BoardDTO board);

	int getBoardId(Integer user_id);

	int insertBoardImg(BoardImgDTO boardImg);

	BoardDTO getBoardDto(int board_id);
	
	List<BoardImgDTO> getBoardImgDto(int board_id);

	String getCategoryName(int p_category_id);
}
