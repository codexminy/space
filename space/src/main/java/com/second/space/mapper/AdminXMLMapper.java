package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;

public interface AdminXMLMapper {
	
	public int getAllNotificationCount(); // 홈 - 회원 신고 접수
	
	public int getNotificationBoardCount(); // 홈 - 게시글 신고 접수
	
	public int getNotificationCmtCount(); // 홈 - 댓글 신고 접수
	
	public int getNotificationReviewCount(); // 홈 - 리뷰 신고 접수
	
	public List<Notification_adDTO> getNotificationAdList(); // 홈 - 배너 관리
	
	public List<Notice_adminDTO> getNoticeAdminList(); // 홈 - 어드민 안내
}
