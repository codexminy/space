package com.second.space.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.Notification_cmtDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityBoardImgDTO;
import com.second.space.community.model.CommunityCategoryDTO;
import com.second.space.community.model.CommunityCommentCountDTO;
import com.second.space.community.model.CommunityCommentDTO;
import com.second.space.community.model.CommunityUserDTO;

public interface CommunityXMLMapper {
	
	public List<CommunityUserDTO> getUserList();
	
	public CommunityBoardDTO getCommunityBoard(int pk);
	public List<CommunityBoardDTO> getCommunityBoardList(String user_address);
	public List<CommunityBoardDTO> getCommunitySearchList(@Param("user_address")String user_address, @Param("keyword")String keyword);
	public int getCommunityBoardCount();
	
	public CommunityCategoryDTO getCommunityCategory(int pk);
	public List<CommunityCategoryDTO> getCommunityCategoryList();
	
	public CommunityCommentDTO getCommunityComment(int pk);
	public List<CommunityCommentDTO> getCommunityCommentList();
	public List<CommunityCommentCountDTO> getCommunityCommentCount();
	
	public int addCommunityComment(CommunityCommentDTO list);
	public int addCommunityCommentReply(CommunityCommentDTO list);
	
	public Notification_boardDTO getNotificationBoard(int pk);
	public int addNotificationBoard(Notification_boardDTO list);
	
	public Notification_cmtDTO getNotificationCmt(int pk);
	public int addNotificationCmt(Notification_cmtDTO list);
	
	public int addCommunityBoard(CommunityBoardDTO list);
	public int getCommunityBoardId(Integer user_id);
	
	public int addCommunityBoardImg(CommunityBoardImgDTO boardImg);
	public List<CommunityBoardImgDTO> getCommunityBoardImgList();
	
	public int communityBoardViewCount(CommunityBoardDTO list);
}
