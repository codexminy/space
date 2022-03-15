package com.second.space.mapper;

import java.util.List;

import com.second.space.community.model.CommunityBoardDTO;

public interface CommunityXMLMapper {
	
	public CommunityBoardDTO get(int pk);
	public List<CommunityBoardDTO> getCommunityBoardList();
	public int getCommunityBoardCount();
	
	
}
