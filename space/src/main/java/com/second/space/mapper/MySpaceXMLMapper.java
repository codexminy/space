package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.PageSet;
import com.second.space.mySpace.model.BoardInfoDTO;
import com.second.space.mySpace.model.InfoDTO;

public interface MySpaceXMLMapper {
	
	public InfoDTO getUserInfo(int user_id); // 유저 정보
	
	public List<BoardInfoDTO> getBoardInfoList(PageSet ps); // 유저 판매글 정보 리스트
	
	public int getBoardInfoCount(int user_id); // 유저 판매글 정보 리스트 총 갯수
}
