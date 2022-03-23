package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.UserDTO;

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
	
	public int insertNotice(NoticeDTO dto); // 공지사항 - 신규 등록
	
	public List<UserDTO> getAllUserList(PageSet ps); // 회원 관리 - 목록 리스트
	
	public int getUserTotal(); // 회원 관리 - 목록 전체 갯수
	
	public List<UserDTO> getAllWithdrawalList(PageSet ps); // 회원 관리 - 탈퇴 회원 리스트
	
	public int getWithdrawalTotal(); // 회원 관리 - 탈퇴 회원 전체 갯수
	
	public List<UserDTO> getAllSaleList(PageSet ps); // 게시물 관리 - 장터 게시물 리스트
	
	public int getSaleTotal(); // 게시물 관리 - 장터 게시물 갯수
	
	public List<UserDTO> getAllCommunityList(PageSet ps); // 게시물 관리 - 장터 게시물 리스트
	
	public int getCommunityTotal(); // 게시물 관리 - 장터 게시물 갯수
	
	public List<UserDTO> getAllNoticeAdminList(PageSet ps); // 관리자 공지 - 목록 리스트
	
	public int getNoticeAdminTotal(); // 관리자 공지 - 목록 갯수
	
	public List<UserDTO> getAllContactUsList(PageSet ps); // 문의사항 - 1:1 문의 리스트
	
	public int getContactUsTotal(); // 문의사항 - 1:1 문의 리스트 갯수
	
	public List<Integer> getMonthlyNewUser(); // 통계 - 월별 신규 회원
	
	public List<Integer> getMonthlyWithdrawalUser(); // 통계 - 월별 탈퇴 회원
	
	public List<Integer> getDailyVisit(); // 일일 방문자수
}










