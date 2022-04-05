package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.PageSet;
import com.second.space.mySpace.model.BoardInfoDTO;
import com.second.space.mySpace.model.InfoDTO;
import com.second.space.mySpace.model.LikeInfoDTO;
import com.second.space.mySpace.model.ReviewInfoDTO;

public interface MySpaceXMLMapper {
	
	public InfoDTO getUserInfo(int user_id); // 유저 정보
	
	public List<BoardInfoDTO> getBoardInfoList(PageSet ps); // 유저 판매글 정보 리스트
	
	public int getBoardInfoCount(int user_id); // 유저 판매글 정보 리스트 총 갯수
	
	public List<ReviewInfoDTO> getReviewInfoList(PageSet ps); // 거래 후기 리스트
	
	public int getReviewInfoCount(int user_id); // 거래 후기 리스트 총 갯수
	
	public List<LikeInfoDTO> getLikeInfoList(PageSet ps); // 찜한 상품 리스트
	
	public int getLikeInfoCount(int user_id); // 찜한 상품 리스트 총 갯수
}
