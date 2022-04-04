package com.second.space.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.Notification_cmtDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityBoardImgDTO;
import com.second.space.community.model.CommunityCategoryDTO;
import com.second.space.community.model.CommunityCommentCountDTO;
import com.second.space.community.model.CommunityCommentDTO;
import com.second.space.community.model.CommunityUserDTO;
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
	public List<CommunityBoardDTO> getCommunityBoardList(String user_address) throws Exception {
		return community_mapper.getCommunityBoardList(user_address);
	}

	@Override
	public List<CommunityCategoryDTO> getCommunityCategoryList() throws Exception {
		return community_mapper.getCommunityCategoryList();
	}

	@Override
	public List<CommunityCommentDTO> getCommunityCommentList() throws Exception {
		return community_mapper.getCommunityCommentList();
	}

	@Override
	public List<CommunityCommentCountDTO> getCommunityCommentCount() throws Exception {
		return community_mapper.getCommunityCommentCount();
	}
	
	/* 댓글 DB등록 */
	@Override
	public CommunityCommentDTO newCommunityComment(CommunityCommentDTO comment) throws Exception {
		int row = community_mapper.addCommunityComment(comment);
		
		if(row == 0) {
			throw new Exception("댓글등록 실패");
		}
		
		return community_mapper.getCommunityComment(comment.getC_id());
	}
	
	/* 대댓글 DB등록 */
	@Override
	public CommunityCommentDTO newCommunityCommentReply(CommunityCommentDTO comment) throws Exception {
		int row = community_mapper.addCommunityCommentReply(comment);
		
		if(row == 0) {
			throw new Exception("대댓글등록 실패");
		}
		
		return community_mapper.getCommunityComment(comment.getC_id());
	}
	
	/* 커뮤니티 글 신고 DB등록 */
	@Override
	public Notification_boardDTO newNotificationBoard(Notification_boardDTO list) throws Exception {
		int row = community_mapper.addNotificationBoard(list);
		
		if(row == 0) {
			throw new Exception("신고등록 실패");
		}
		
		return community_mapper.getNotificationBoard(list.getN_id());
	}
	
	/* 커뮤니티 댓글 신고 DB등록 */
	@Override
	public Notification_cmtDTO newNotificationCmt(Notification_cmtDTO list) throws Exception {
		int row = community_mapper.addNotificationCmt(list);
		
		if(row == 0) {
			throw new Exception("신고등록 실패");
		}
		
		return community_mapper.getNotificationCmt(list.getNc_id());
	}
	
	/* 커뮤니티 게시글 DB등록 */
	@Override
	public int newCommunityBoard(CommunityBoardDTO list) throws Exception {
		return community_mapper.addCommunityBoard(list);
	}
	
	/* 커뮤니티 게시글 가장 최근 c_board_id GET */
	@Override
	public int getCommunityBoardId(Integer user_id) throws Exception {
		return community_mapper.getCommunityBoardId(user_id);
	}
	
	/* 커뮤니티 게시글 이미지들, 이미지 테이블에 넣기 */
	@Override
	public int newCommunityBoardImg(List<CommunityBoardImgDTO> imgList) throws Exception {
		int result = 0;
		
		for(int i = 0; i < imgList.size(); i++) {
			result = community_mapper.addCommunityBoardImg(imgList.get(i));
			if(result == 0) {
				break;
			}
		}
		
		return result;
	}
	
	/* 커뮤니티 게시글 이미지 리스트 GET */
	@Override
	public List<CommunityBoardImgDTO> getCommunityBoardImgList() throws Exception {
		return community_mapper.getCommunityBoardImgList();
	}
	
	/* 커뮤니티 게시글 조회수 UP */
	@Override
	public int PutCommunityBoardViewCount(CommunityBoardDTO list) throws Exception {
		return community_mapper.communityBoardViewCount(list);
	}
	
	/* 유저 리스트 GET */
	@Override
	public List<CommunityUserDTO> getUserList() throws Exception {
		return community_mapper.getUserList();
	}

}
