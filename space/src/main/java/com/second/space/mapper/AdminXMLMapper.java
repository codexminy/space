package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;

public interface AdminXMLMapper {
	
	public int getAllNotificationCount(); // 홈 - 회원 신고 접수
	
	public int getNotificationBoardCount(); // 홈 - 게시글 신고 접수
	
	public int getNotificationCmtCount(); // 홈 - 댓글 신고 접수
	
	public int getNotificationReviewCount(); // 홈 - 리뷰 신고 접수
	
	public List<Notification_adDTO> getNotificationAdList(); // 홈 - 배너 관리
	
	public List<Notice_adminDTO> getNoticeAdminList(); // 홈 - 어드민 안내
	
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps); // 배너관리 - 테이블
	
	public int getNotificationAdTotal(); // 배너관리 - 총 갯수

	public Notification_adDTO getNotificationAdDetailList(int na_id); // 배너리스트
	
	public int insertNotificationAd(String imgPath); // 배너 등록
	
	public List<NoticeDTO> getAllNoticeList(PageSet ps); // 공지사항 - 전체 테이블
	
	public int getNoticeTotal(PageSet ps); // 총 갯수
	
	public NoticeDTO getNotice(int notice_id); // 공지사항 - 게시물
	
	public int insertNotice(NoticeDTO dto); // 공지사항 - 등록
}
