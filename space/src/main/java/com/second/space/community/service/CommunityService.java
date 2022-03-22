package com.second.space.community.service;

import java.util.List;

import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityCategoryDTO;
import com.second.space.community.model.CommunityCommentCountDTO;
import com.second.space.community.model.CommunityCommentDTO;

public interface CommunityService {
	
	public int getCommunityBoardCount() throws Exception;
	public CommunityBoardDTO getCommunityBoardList(CommunityBoardDTO list) throws Exception;
	public List<CommunityBoardDTO> getCommunityBoardList() throws Exception;
	
	public CommunityCategoryDTO getCommunityCategoryList(CommunityCategoryDTO list) throws Exception;
	public List<CommunityCategoryDTO> getCommunityCategoryList() throws Exception;
	
	public List<CommunityCommentDTO> getCommunityCommentList() throws Exception;
	public List<CommunityCommentCountDTO> getCommunityCommentCount() throws Exception;
	
	public CommunityCommentDTO newCommunityComment(CommunityCommentDTO list) throws Exception;
	public CommunityCommentDTO newCommunityCommentReply(CommunityCommentDTO list) throws Exception;
	
	public Notification_boardDTO newNotificationBoard(Notification_boardDTO list) throws Exception;
}
