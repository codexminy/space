package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.PageSet;
import com.second.space.mySpace.model.BoardInfoDTO;
import com.second.space.mySpace.model.FollowInfoDTO;
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
	
	public int deleteLike(int board_like_id); // 찜한 상품 삭제
	
	public List<FollowInfoDTO> getFollowingList(PageSet ps); // 팔로잉 리스트
	
	public int getFollowingCount(int user_id); // 팔로잉 리스트 총 갯수
	
	public int deleteFollowing(FollowInfoDTO dto); // 팔로잉 삭제
	
	public List<FollowInfoDTO> getFollowerList(PageSet ps); // 팔로워 리스트
	
	public int getFollowerCount(int user_id); // 팔로워 리스트 총 갯수
	
	public List<Integer> getFollowerCheck(int user_id); // 팔로워 리스트 팔로잉 확인
	
	public int insertFollowing(FollowInfoDTO dto); // 팔로잉 추가

}
