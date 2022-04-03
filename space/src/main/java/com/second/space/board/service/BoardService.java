package com.second.space.board.service;

import java.util.List;

import com.second.space.board.model.AuctionDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.FollowingDTO;
import com.second.space.board.model.PaymentsCategoryDTO;
import com.second.space.user_.model.UserDTO;

public interface BoardService {
	
	List<PaymentsCategoryDTO> getPaymentsCategory() throws Exception;
	
	String getAddress(int user_id) throws Exception;
	
	int insertBoard(BoardDTO board) throws Exception;

	int getBoardId(Integer user_id) throws Exception;
	
	int insertBoardImg(List<BoardImgDTO> imgList) throws Exception;
	
	BoardDTO getBoardDto(int board_id) throws Exception;
	
	List<BoardImgDTO> getBoardImgDto(int board_id) throws Exception;

	String getCategoryName(int p_category_id) throws Exception;

	UserDTO getUserByUserId(Integer user_id);

	int getFollower(Integer user_id);

	int getBoardCnt(Integer user_id);

	int insertAcution(AuctionDTO auction);

	int getAuctionId(int board_id);

	AuctionDTO getAuctionDTO(Integer auction_id);

	Integer getFollowing(int user_id, int user_login_id);
}
