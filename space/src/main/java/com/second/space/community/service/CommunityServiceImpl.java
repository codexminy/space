package com.second.space.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityCategoryDTO;
import com.second.space.community.model.CommunityCommentDTO;
import com.second.space.mapper.CommunityXMLMapper;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityXMLMapper community_mapper;

	@Override
	public int getCommunityBoardCount() throws Exception {
		return community_mapper.getCommunityBoardCount();
	}

	@Override
	public CommunityBoardDTO getCommunityBoardList(CommunityBoardDTO list) throws Exception {
		return community_mapper.getCommunityBoard(list.getC_board_id());
	}

	@Override
	public CommunityCategoryDTO getCommunityCategoryList(CommunityCategoryDTO list) throws Exception {
		return community_mapper.getCommunityCategory(list.getC_category_id());
	}

	@Override
	public List<CommunityBoardDTO> getCommunityBoardList() throws Exception {
		return community_mapper.getCommunityBoardList();
	}

	@Override
	public List<CommunityCategoryDTO> getCommunityCategoryList() throws Exception {
		return community_mapper.getCommunityCategoryList();
	}

	@Override
	public List<CommunityCommentDTO> getCommunityCommentList() throws Exception {
		return community_mapper.getCommunityCommentList();
	}
}
