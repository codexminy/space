package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.PageSet;

public interface AdminXMLMapper {
	
	public List<Integer> getNotificationCount(); // 홈 - 신고 관리 접수 갯수
	
	public List<Integer> getStatsCount(); // 홈 - 통계 갯수
	
	public List<Notification_adDTO> getNotificationAdList(); // 홈 - 배너 관리 리스트
	
	public List<Notice_adminDTO> getNoticeAdminList(); // 홈 - 어드민 안내 리스트
	
	public List<Notification_boardDTO> getNotificationBoardList(PageSet ps); // 신고관리 - 판매 게시글 리스트
	
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps); // 배너관리 - 목록 리스트
	
	public int getNotificationAdTotal(); // 배너관리 - 목록 전체 갯수
	
	public int createNotificationAd(Notification_adDTO dto); // 배너관리 - 신규 등록
	
	public Notification_adDTO getNotificationAdDetail(int na_id); // 배너관리 - 상세 정보
	
	public List<NoticeDTO> getAllNoticeList(PageSet ps); // 공지사항 - 목록 리스트
	
	public int getNoticeTotal(); // 공지사항 - 목록 전체 갯수
	
	public NoticeDTO getNoticeDetail(int notice_id); // 공지사항 - 상세 정보
	
	public List<Notice_categoryDTO> getNoticeCategory(); // 공지사항 - 카테고리 리스트
}
