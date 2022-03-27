package com.second.space.mapper;

import java.util.List;

import com.second.space.admin.model.A_boardDTO;
import com.second.space.admin.model.Admin_categoryDTO;
import com.second.space.admin.model.Contact_usDTO;
import com.second.space.admin.model.DeleteCheckDTO;
import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.NotifyDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.UserDTO;

public interface AdminXMLMapper {
	
	public List<Integer> getNotificationCount(); // 홈 - 신고 관리 접수 갯수
	
	public List<Integer> getStatsCount(); // 홈 - 통계 갯수
	
	public List<Notification_adDTO> getNotificationAdList(); // 홈 - 배너 관리 리스트
	
	public List<Notice_adminDTO> getNoticeAdminList(); // 홈 - 어드민 안내 리스트
	
	public List<Notification_boardDTO> getNotificationBoardList(PageSet ps); // 신고관리 - 판매 게시글 리스트
	
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps); // 배너관리 - 목록 리스트
	
	public int getNotificationAdTotal(PageSet ps); // 배너관리 - 목록 전체 갯수
	
	public int createNotificationAd(Notification_adDTO dto); // 배너관리 - 신규 등록
	
	public Notification_adDTO getNotificationAdDetail(int na_id); // 배너관리 - 상세 정보
	
	public int updateBanner(Notification_adDTO dto); // 배너관리 - 수정
	
	public int deleteBanner(int na_id); // 배너관리 - 삭제
	
	public List<Notification_adDTO> getAllBannerEndDateList(PageSet ps); // 배너관리 - 마감 목록 리스트
	
	public int getBannerEndDateTotal(PageSet ps); // 배너관리 - 마감 목록 전체 갯수
	
	public List<NoticeDTO> getAllNoticeList(PageSet ps); // 공지사항 - 목록 리스트
	
	public int getNoticeTotal(PageSet ps); // 공지사항 - 목록 전체 갯수
	
	public NoticeDTO getNoticeDetail(int notice_id); // 공지사항 - 상세 정보
	
	public List<Notice_categoryDTO> getNoticeCategory(); // 공지사항 - 카테고리 리스트
	
	public int insertNotice(NoticeDTO dto); // 공지사항 - 신규 등록
	
	public int updateNotice(NoticeDTO dto); // 공지사항 - 수정
	
	public int deleteNotice(int notice_id); // 공지사항 - 삭제
	
	public List<UserDTO> getAllUserList(PageSet ps); // 회원 관리 - 목록 리스트
	
	public int getUserTotal(PageSet ps); // 회원 관리 - 목록 전체 갯수
	
	public List<UserDTO> getAllWithdrawalList(PageSet ps); // 회원 관리 - 탈퇴 회원 리스트
	
	public int getWithdrawalTotal(PageSet ps); // 회원 관리 - 탈퇴 회원 전체 갯수
	
	public List<UserDTO> getAllSaleList(PageSet ps); // 게시물 관리 - 장터 게시물 리스트
	
	public int getSaleTotal(PageSet ps); // 게시물 관리 - 장터 게시물 갯수
	
	public List<UserDTO> getAllCommunityList(PageSet ps); // 게시물 관리 - 커뮤니티 게시물 리스트
	
	public int getCommunityTotal(PageSet ps); // 게시물 관리 - 커뮤니티 게시물 갯수
	
	public int updateHidden(A_boardDTO dto); // 게시물 관리 - 장터 게시물 숨김 처리

	public List<UserDTO> getAllNoticeAdminList(PageSet ps); // 관리자 공지 - 목록 리스트
	
	public int getNoticeAdminTotal(); // 관리자 공지 - 목록 갯수
	
	public List<Contact_usDTO> getAllContactUsList(PageSet ps); // 문의사항 - 1:1 문의 리스트
	
	public int getContactUsTotal(PageSet ps); // 문의사항 - 1:1 문의 리스트 갯수
	
	public List<String> getDailyLabel(); // 통계 - 일일 라벨
	
	public List<String> getWeeklyLabel(); // 통계 - 주별 라벨
	
	public List<String> getMonthlyLabel(); // 통계 - 월별 라벨
	
	public List<Integer> getDailyNewUser(); // 통계 - 일일 신규 회원
	
	public List<Integer> getDailyWithdrawalUser(); // 통계 - 일일 탈퇴 회원
	
	public List<Integer> getDailyVisit(); // 통계 - 일일 방문자수
	
	public List<Integer> getWeeklyNewUser(); // 통계 - 주별 신규 회원
	
	public List<Integer> getWeeklyWithdrawalUser(); // 통계 - 주별 탈퇴 회원
	
	public List<Integer> getWeeklyVisit(); // 통계 - 일일 방문자수
	
	public List<Integer> getMonthlyNewUser(); // 통계 - 월별 신규 회원
	
	public List<Integer> getMonthlyWithdrawalUser(); // 통계 - 월별 탈퇴 회원
	
	public List<Integer> getMonthlyVisit(); // 통계 - 월별 방문자수
	
	public List<Integer> getDailySaleList(); // 통계 - 일일 장터 게시글 수
	
	public List<Integer> getDailyCommunityList(); // 통계 - 일일 커뮤니티 게시글 수
	
	public List<Integer> getWeeklySaleList(); // 통계 - 주별 장터 게시글 수
	
	public List<Integer> getWeeklyCommunityList(); // 통계 - 주별 커뮤니티 게시글 수
	
	public List<Integer> getMonthlySaleList(); // 통계 - 월별 장터 게시글 수
	
	public List<Integer> getMonthlyCommunityList(); // 통계 - 월별 커뮤니티 게시글 수

	public List<Integer> getDailyBoardNotifyList(); // 통계 - 일일 게시글 신고 수
	
	public List<Integer> getDailyCmtNotifyList(); // 통계 - 일일 댓글 신고 수
	
	public List<Integer> getDailyReviewNotifyList(); // 통계 - 일일 리뷰 신고 수
	
	public List<Integer> getWeeklyBoardNotifyList(); // 통계 - 주별 게시글 신고 수
	
	public List<Integer> getWeeklyCmtNotifyList(); // 통계 - 주별 댓글 신고 수
	
	public List<Integer> getWeeklyReviewNotifyList(); // 통계 - 주별 리뷰 신고 수
	
	public List<Integer> getMonthlyBoardNotifyList(); // 통계 - 월별 게시글 신고 수
	
	public List<Integer> getMonthlyCmtNotifyList(); // 통계 - 월별 댓글 신고 수
	
	public List<Integer> getMonthlyReviewNotifyList(); // 통계 - 월별 댓글 신고 수
	
	public List<NotifyDTO> getBoardNotifyList(PageSet ps); // 신고 관리 - 게시글 신고 리스트
	
	public int getBoardNotifyCount(PageSet ps); // 신고 관리 - 게시물 신고 갯수
	
	public int updateBoardHandling(NotifyDTO dto); // 신고 관리 - 게시글 신고 승인 처리
	
	public int updateBoardDelete(NotifyDTO dto); // 신고 관리 - 장터 게시글 신고 승인 처리
	
	public int updateReported(NotifyDTO dto); // 신고 관리 - 게시글 신고 승인 처리
	
	public int updateCommunityBoardDelete(NotifyDTO dto); // 신고 관리 - 커뮤니티 게시글 신고 승인 처리
	
	public int updateCancelReported(NotifyDTO dto); // 신고 관리 - 커뮤니티 게시글 신고 승인 취소 처리
	
	public List<NotifyDTO> getCmtNotifyList(PageSet ps); // 신고 관리 - 댓글 신고 리스트
	
	public int getCmtNotifyCount(PageSet ps); // 신고 관리 - 댓글 신고 갯수
	
	public int updateCmtHandling(NotifyDTO dto); // 댓글 신고 승인, 반려 처리
	
	public int updateCmtDelete(NotifyDTO dto); // 댓글 신고 승인 처리
	
	public List<NotifyDTO> getReviewNotifyList(PageSet ps); // 신고 관리 - 리뷰 신고 리스트
	
	public int getReviewNotifyCount(PageSet ps); // 신고 관리 - 댓글 신고 갯수
	
	public int updateReviewHandling(NotifyDTO dto); // 신고 관리 - 리뷰 신고 승인, 반려 처리
	
	public int updateReviewDelete(NotifyDTO dto); // 신고 관리 - 리뷰 신고 승인 처리
	
	public int deleteCheck(DeleteCheckDTO dto); // 체크한 항목 삭제
	
	public List<Admin_categoryDTO> getNoticeAdminCategory(); // 관리자 공지 - 카테고리
	
	public int insertNoticeAdmin(Notice_adminDTO dto); // 관리자 공지 - 관리자 공지 등록
	
	public Notice_adminDTO getNoticeAdmin(int notice_admin_id); // 관리자 공지 - 관리자 글 가져오기
	
	public int deleteNoticeAdmin(int notice_admin_id); // 관리자 공지 - 관리자 글 삭제하기
	
	public int updateNoticeAdmin(Notice_adminDTO dto); // 관리자 공지 - 관리자 글 수정하기
}










