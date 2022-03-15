package com.second.space.community.service;

import com.second.space.community.model.CommunityBoardDTO;

public interface CommunityService {
	
	public int getCommunityBoardCount() throws Exception;
	public CommunityBoardDTO getCommunityBoardList(CommunityBoardDTO list) throws Exception;
	
}
