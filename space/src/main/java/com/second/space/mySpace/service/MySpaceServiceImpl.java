package com.second.space.mySpace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.PageSet;
import com.second.space.mapper.MySpaceXMLMapper;
import com.second.space.mySpace.model.BoardInfoDTO;
import com.second.space.mySpace.model.InfoDTO;
import com.second.space.mySpace.model.LikeInfoDTO;
import com.second.space.mySpace.model.ReviewInfoDTO;

@Service
public class MySpaceServiceImpl implements MySpaceService {
	
	@Autowired
	MySpaceXMLMapper mapper;
	
	@Override
	public InfoDTO getUserInfo(int user_id) { // 유저 닉네임
		return mapper.getUserInfo(user_id);
	}

	@Override
	public List<BoardInfoDTO> getBoardInfoList(PageSet ps) { // 유저 판매글 정보 리스트
		return mapper.getBoardInfoList(ps);
	}

	@Override
	public int getBoardInfoCount(int user_id) { // 유저 판매글 정보 리스트 총 갯수
		return mapper.getBoardInfoCount(user_id);
	}

	@Override
	public List<ReviewInfoDTO> getReviewInfoList(PageSet ps) { // 거래 후기 리스트
		return mapper.getReviewInfoList(ps);
	}

	@Override
	public int getReviewInfoCount(int user_id) { // 거래 후기 리스트 총 갯수
		return mapper.getReviewInfoCount(user_id);
	}

	@Override
	public List<LikeInfoDTO> getLikeInfoList(PageSet ps) { // 찜한 상품 리스트
		return mapper.getLikeInfoList(ps);
	}

	@Override
	public int getLikeInfoCount(int user_id) { // 찜한 상품 리스트 총 갯수
		return mapper.getLikeInfoCount(user_id);
	}

	@Override
	public int deleteLike(int board_like_id) { // 찜한 상품 삭제
		return mapper.deleteLike(board_like_id);
	}
	
}
