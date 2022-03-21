package com.second.space.admin.service;

import java.util.List;

import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;

public interface AdminService {

	public List<Integer> getNotificationCount() throws Exception; // 홈 - 신고 관리 접수 갯수
	
	public List<Integer> getStatsCount() throws Exception; // 홈 - 통계 갯수
	
	public List<Notification_adDTO> getNotificationAdList() throws Exception; // 홈 - 배너 관리 리스트
	
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception; // 홈 - 어드민 안내 리스트
	
}
