package com.second.space.admin.service;

import java.util.List;

import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;

public interface AdminService {

	public int getAllNotificationCount() throws Exception; // 홈 - 회원 신고 접수
	
	public int getNotificationBoardCount() throws Exception; // 홈 - 게시글 신고 접수
		
		public int getNotificationCmtCount() throws Exception; // 홈 - 댓글 신고 접수
		
		public int getNotificationReviewCount() throws Exception; // 홈 - 리뷰 신고 접수
	
	public List<Notification_adDTO> getNotificationAdList() throws Exception; // 홈 - 배너 관리
	
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception; // 홈 - 어드민 안내
}
