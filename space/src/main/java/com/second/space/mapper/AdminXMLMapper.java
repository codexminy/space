package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.PageSet;

public interface AdminXMLMapper {
	
	public List<Integer> getNotificationCount(); // 홈 - 신고 관리 접수 갯수
	
	public List<Integer> getStatsCount(); // 홈 - 통계 갯수
	
	public List<Notification_adDTO> getNotificationAdList(); // 홈 - 배너 관리 리스트
	
	public List<Notice_adminDTO> getNoticeAdminList(); // 홈 - 어드민 안내 리스트
	
	public List<Notification_boardDTO> getNotificationBoardList(PageSet ps); // 신고관리 - 판매 게시글 리스트
}
