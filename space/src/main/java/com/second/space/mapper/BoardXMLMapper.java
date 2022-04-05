package com.second.space.mapper;

import java.util.List;

import com.second.space.board.model.AuctionDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.BoardLikeDTO;
import com.second.space.board.model.FollowerDTO;
import com.second.space.board.model.FollowingDTO;
import com.second.space.board.model.PaymentsCategoryDTO;
import com.second.space.board.model.WinningBidDTO;
import com.second.space.user_.model.UserDTO;

public interface BoardXMLMapper {
	
	List<PaymentsCategoryDTO> getPaymentsCategory();

	String getAddress(int user_id);

	int insertBoard(BoardDTO board);

	int getBoardId(Integer user_id);

	int insertBoardImg(BoardImgDTO boardImg);

	BoardDTO getBoardDto(int board_id);
	
	List<BoardImgDTO> getBoardImgDto(int board_id);

	String getCategoryName(int p_category_id);

	UserDTO getUserByUserId(Integer user_id);

	int getFollower(Integer user_id);

	int getBoardCnt(Integer user_id);

	int insertAcution(AuctionDTO auction);

	int getAuctionId(int board_id);

	AuctionDTO getAuctionDTO(Integer auction_id);

	Integer getFollowing(int user_id, int user_login_id);

	FollowingDTO selectFollowing(int user_id, int user_login_id);

	int getFollowing2(FollowingDTO f);

	int insertFollowing(FollowingDTO f);

	int deleteFollowing(FollowingDTO f);

	Integer getBoardLike(BoardLikeDTO b);

	int insertBoardLike(BoardLikeDTO b);

	int deleteBoardLike(BoardLikeDTO b);
	
	int getUserIdByLoginId(Integer user_login_id);

	int getUserLoginIdByUserId(Integer user_id);

	int insertFollower(FollowerDTO fwer);

	int deleteFollower(FollowerDTO fwer);

	int insertWinning(WinningBidDTO win);

	Integer getMaxWin(Integer auction_id);
}
