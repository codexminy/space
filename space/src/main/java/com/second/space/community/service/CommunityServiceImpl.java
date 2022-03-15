package com.second.space.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.community.model.CommunityBoardDTO;
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
		return community_mapper.get(list.getC_board_id());
	}

}
