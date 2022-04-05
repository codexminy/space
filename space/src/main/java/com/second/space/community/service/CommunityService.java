package com.second.space.community.service;

import java.util.List;

import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.Notification_cmtDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityBoardImgDTO;
import com.second.space.community.model.CommunityCategoryDTO;
import com.second.space.community.model.CommunityCommentCountDTO;
import com.second.space.community.model.CommunityCommentDTO;
import com.second.space.community.model.CommunityUserDTO;

public interface CommunityService {
	
	public List<CommunityUserDTO> getUserList() throws Exception;
	
	public int getCommunityBoardCount() throws Exception;
	public CommunityBoardDTO getCommunityBoardList(CommunityBoardDTO list) throws Exception;
	public List<CommunityBoardDTO> getCommunityBoardList(String user_address) throws Exception;
	public List<CommunityBoardDTO> getCommunitySearchList(String user_address, String keyword) throws Exception;
	
	public CommunityCategoryDTO getCommunityCategoryList(CommunityCategoryDTO list) throws Exception;
	public List<CommunityCategoryDTO> getCommunityCategoryList() throws Exception;
	
	public List<CommunityCommentDTO> getCommunityCommentList() throws Exception;
	public List<CommunityCommentCountDTO> getCommunityCommentCount() throws Exception;
	
	public CommunityCommentDTO newCommunityComment(CommunityCommentDTO list) throws Exception;
	public CommunityCommentDTO newCommunityCommentReply(CommunityCommentDTO list) throws Exception;
	
	public Notification_boardDTO newNotificationBoard(Notification_boardDTO list) throws Exception;
	
	public Notification_cmtDTO newNotificationCmt(Notification_cmtDTO list) throws Exception;
	
	public int newCommunityBoard(CommunityBoardDTO list) throws Exception;
	public int getCommunityBoardId(Integer user_id) throws Exception;
	
	public int newCommunityBoardImg(List<CommunityBoardImgDTO> imgList) throws Exception;
	public List<CommunityBoardImgDTO> getCommunityBoardImgList() throws Exception;
	
	public int PutCommunityBoardViewCount(CommunityBoardDTO list) throws Exception;
}
