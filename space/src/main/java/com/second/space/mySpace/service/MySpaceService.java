package com.second.space.mySpace.service;

import java.util.List;

import com.second.space.admin.model.PageSet;
import com.second.space.mySpace.model.BoardInfoDTO;
import com.second.space.mySpace.model.InfoDTO;

public interface MySpaceService {
	
	public InfoDTO getUserInfo(int user_id); // 유저 닉네임
	
	public List<BoardInfoDTO> getBoardInfoList(PageSet ps); // 유저 판매글 정보 리스트
	
	public int getBoardInfoCount(int user_id); // 유저 판매글 정보 리스트 총 갯수
}
