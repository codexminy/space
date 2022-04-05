package com.second.space.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.PageSet;
import com.second.space.board.model.AuctionDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.BoardLikeDTO;
import com.second.space.board.model.FollowerDTO;
import com.second.space.board.model.FollowingDTO;
import com.second.space.board.model.PaymentsCategoryDTO;
import com.second.space.board.model.WinningBidDTO;
import com.second.space.mapper.BoardXMLMapper;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
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
	
	@Override
	public UserDTO getUserByUserId(Integer user_id) {
		return boardMapper.getUserByUserId(user_id);
	}
	
	@Override
	public int getFollower(Integer user_id) {
		return boardMapper.getFollower(user_id);
	}
	
	@Override
	public int getBoardCnt(Integer user_id) {
		return boardMapper.getBoardCnt(user_id);
	}
	
	@Override
	public int insertAcution(AuctionDTO auction) {
		return boardMapper.insertAcution(auction);
	}
	
	@Override
	public int getAuctionId(int board_id) {
		return boardMapper.getAuctionId(board_id);
	}
	
	@Override
	public AuctionDTO getAuctionDTO(Integer auction_id) {
		return boardMapper.getAuctionDTO(auction_id);
	}
	
	@Override
	public Integer getFollowing(int user_id, int user_login_id) {
		int result = boardMapper.getFollowing(user_id, user_login_id) ;
		log.info(result);
		return result;
	}

	public FollowingDTO selectFollowing(int user_id, int user_login_id) {
		return boardMapper.selectFollowing(user_id, user_login_id) == null ? null : boardMapper.selectFollowing(user_id, user_login_id);
	}

	public int getFollowing2(FollowingDTO f) {
		return boardMapper.getFollowing2(f);
	}

	public int insertFollowing(FollowingDTO f) {
		return boardMapper.insertFollowing(f);
	}

	public int deleteFollowing(FollowingDTO f) {
		return boardMapper.deleteFollowing(f);
	}

	public Integer getBoardLike(BoardLikeDTO b) {
		return boardMapper.getBoardLike(b);
	}

	public int insertBoardLike(BoardLikeDTO b) {
		return boardMapper.insertBoardLike(b);
	}

	public int deleteBoardLike(BoardLikeDTO b) {
		return boardMapper.deleteBoardLike(b);
	}

	public int getUserIdByLoginId(Integer user_login_id) {
		return boardMapper.getUserIdByLoginId(user_login_id);
	}

	public int getUserLoginIdByUserId(Integer user_id) {
		return boardMapper.getUserLoginIdByUserId(user_id);
	}

	public int insertFollower(FollowerDTO fwer) {
		return boardMapper.insertFollower(fwer);
	}

	public int deleteFollower(FollowerDTO fwer) {
		return boardMapper.deleteFollower(fwer);
	}

	public int insertWinning(WinningBidDTO win) {
		return boardMapper.insertWinning(win);
	}

	public Integer getMaxWin(Integer auction_id) {
		return boardMapper.getMaxWin(auction_id);
	}

	@Override
	public List<BoardDTO> getCategoryBoardList(PageSet ps) {
		return boardMapper.getCategoryBoardList(ps);
	}

	@Override
	public int getCategoryBoardTotal(PageSet ps) {
		return boardMapper.getCategoryBoardTotal(ps);
	}

	@Override
	public String getPCategoryName(PageSet ps) {
		return boardMapper.getPCategoryName(ps);
	}

	@Override
	public List<BoardDTO> getAllBoardList(PageSet ps) {
		return boardMapper.getAllBoardList(ps);
	}

	@Override
	public int getAllBoardTotal() {
		return boardMapper.getAllBoardTotal();
	}

	
}
