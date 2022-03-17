package com.second.space.mapper;

import java.util.List;

import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityCategoryDTO;
import com.second.space.community.model.CommunityCommentDTO;

public interface CommunityXMLMapper {
	
	public CommunityBoardDTO getCommunityBoard(int pk);
	public List<CommunityBoardDTO> getCommunityBoardList();
	public int getCommunityBoardCount();
	public CommunityCategoryDTO getCommunityCategory(int pk);
	public List<CommunityCategoryDTO> getCommunityCategoryList();
	public List<CommunityCommentDTO> getCommunityCommentList();
	
}
