package com.second.space.admin.service;

import java.util.List;

import com.second.space.admin.model.A_Community_boardDTO;
import com.second.space.admin.model.A_boardDTO;
import com.second.space.admin.model.Admin_categoryDTO;
import com.second.space.admin.model.Contact_usDTO;
import com.second.space.admin.model.DeleteCheckDTO;
import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.NotifyDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.UserDTO;

public interface AdminService {

	public List<Integer> getNotificationCount() throws Exception; // 홈 - 신고 관리 접수 갯수
	
	public List<Integer> getStatsCount() throws Exception; // 홈 - 통계 갯수
	
	public List<Notification_adDTO> getNotificationAdList() throws Exception; // 홈 - 배너 관리 리스트
	
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception; // 홈 - 어드민 안내 리스트
	
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps) throws Exception; // 배너관리 - 목록 리스트
	
	public int getNotificationAdTotal(PageSet ps) throws Exception; // 배너관리 - 목록 전체 갯수
	
	public int createNotificationAd(Notification_adDTO dto) throws Exception; // 배너관리 - 신규 등록
	
	public Notification_adDTO getNotificationAdDetail(int na_id) throws Exception; // 배너관리 - 상세 정보
	
	public int updateBanner(Notification_adDTO dto) throws Exception; // 배너관리 - 수정
	
	public int deleteBanner(int na_id) throws Exception; // 배너관리 - 삭제
	
	public List<Notification_adDTO> getAllBannerEndDateList(PageSet ps) throws Exception; // 배너관리 - 마감 목록 리스트
	
	public int getBannerEndDateTotal(PageSet ps) throws Exception; // 배너관리 - 마감 목록 전체 갯수
	
	public List<NoticeDTO> getAllNoticeList(PageSet ps) throws Exception; // 공지사항 - 목록 리스트
	
	public int getNoticeTotal(PageSet ps) throws Exception; // 공지사항 - 목록 전체 갯수
	
	public NoticeDTO getNoticeDetail(int notice_id) throws Exception; // 공지사항 - 상세 정보
	
	public List<Notice_categoryDTO> getNoticeCategory() throws Exception; // 공지사항 - 카테고리 리스트
	
	public int insertNotice(NoticeDTO dto) throws Exception; // 공지사항 - 신규 등록
	
	public int updateNotice(NoticeDTO dto) throws Exception; // 공지사항 - 수정
	
	public int deleteNotice(int notice_id) throws Exception; // 공지사항 - 삭제
	
	public List<UserDTO> getAllUserList(PageSet ps) throws Exception; // 회원 관리 - 목록 리스트
	
	public int getUserTotal(PageSet ps) throws Exception; // 회원 관리 - 목록 전체 갯수
	
	public List<UserDTO> getAllWithdrawalList(PageSet ps) throws Exception; // 회원 관리 - 탈퇴 회원 리스트
	
	public int getWithdrawalTotal(PageSet ps) throws Exception; // 회원 관리 - 탈퇴 회원 전체 갯수
	
	public List<UserDTO> getAllSaleList(PageSet ps) throws Exception; // 게시물 관리 - 장터 게시물 리스트
	
	public int getSaleTotal(PageSet ps) throws Exception; // 게시물 관리 - 장터 게시물 갯수
	
	public List<UserDTO> getAllCommunityList(PageSet ps) throws Exception; // 게시물 관리 - 커뮤니티 게시물 리스트
	
	public int getCommunityTotal(PageSet ps) throws Exception; // 게시물 관리 - 커뮤니티 게시물 갯수
	
	public int updateHidden(A_boardDTO dto) throws Exception; // 게시물 관리 - 장터 게시물 숨김 처리
	
	public List<UserDTO> getAllNoticeAdminList(PageSet ps) throws Exception; // 관리자 공지 - 목록 리스트
	
	public int getNoticeAdminTotal() throws Exception; // 관리자 공지 - 목록 갯수
	
	public List<Contact_usDTO> getAllContactUsList(PageSet ps) throws Exception; // 문의사항 - 1:1 문의 리스트
	
	public int getContactUsTotal(PageSet ps) throws Exception; // 문의사항 - 1:1 문의 리스트 갯수
	
	public List<String> getDailyLabel() throws Exception; // 통계 - 일일 라벨
	
	public List<String> getWeeklyLabel() throws Exception; // 통계 - 주별 라벨
	
	public List<String> getMonthlyLabel() throws Exception; // 통계 - 월별 라벨
	
	public List<Integer> getDailyNewUser() throws Exception; // 통계 - 일일 신규 회원
	
	public List<Integer> getDailyWithdrawalUser() throws Exception; // 통계 - 일일 탈퇴 회원
	
	public List<Integer> getDailyVisit() throws Exception; // 통계 - 일일 방문자수
	
	public List<Integer> getWeeklyNewUser() throws Exception; // 통계 - 주별 신규 회원
	
	public List<Integer> getWeeklyWithdrawalUser() throws Exception; // 통계 - 주별 탈퇴 회원
	
	public List<Integer> getWeeklyVisit() throws Exception; // 통계 - 일일 방문자수
	
	public List<Integer> getMonthlyNewUser() throws Exception; // 통계 - 월별 신규 회원
	
	public List<Integer> getMonthlyWithdrawalUser() throws Exception; // 월별 탈퇴 회원
	
	public List<Integer> getMonthlyVisit() throws Exception; // 월별 방문자수
	
	public List<Integer> getDailySaleList() throws Exception; // 일일 장터 게시글 수
	
	public List<Integer> getDailyCommunityList() throws Exception; // 일일 커뮤니티 게시글 수
	
	public List<Integer> getWeeklySaleList() throws Exception; // 통계 - 주별 장터 게시글 수
	
	public List<Integer> getWeeklyCommunityList() throws Exception; // 통계 - 주별 커뮤니티 게시글 수
	
	public List<Integer> getMonthlySaleList() throws Exception; // 통계 - 월별 장터 게시글 수
	
	public List<Integer> getMonthlyCommunityList() throws Exception; // 통계 - 월별 커뮤니티 게시글 수
	
	public List<Integer> getDailyBoardNotifyList() throws Exception; // 통계 - 일일 게시글 신고 수
	
	public List<Integer> getDailyCmtNotifyList() throws Exception; // 통계 - 일일 댓글 신고 수
	
	public List<Integer> getDailyReviewNotifyList() throws Exception; // 통계 - 일일 리뷰 신고 수
	
	public List<Integer> getWeeklyBoardNotifyList() throws Exception; // 통계 - 주별 게시글 신고 수
	
	public List<Integer> getWeeklyCmtNotifyList() throws Exception; // 통계 - 주별 댓글 신고 수
	
	public List<Integer> getWeeklyReviewNotifyList() throws Exception; // 통계 - 주별 리뷰 신고 수
	
	public List<Integer> getMonthlyBoardNotifyList() throws Exception; // 통계 - 월별 게시글 신고 수
	
	public List<Integer> getMonthlyCmtNotifyList() throws Exception; // 통계 - 월별 댓글 신고 수
	
	public List<Integer> getMonthlyReviewNotifyList() throws Exception; // 통계 - 월별 댓글 신고 수
	
	public List<NotifyDTO> getBoardNotifyList(PageSet ps) throws Exception; // 신고 관리 - 게시글 신고 리스트
	
	public int getBoardNotifyCount(PageSet ps) throws Exception; // 신고 관리 - 게시물 신고 갯수
	
	public int updateBoardHandling(NotifyDTO dto) throws Exception; // 신고 관리 - 장터 게시글 신고 승인 처리
	
	public int updateBoardDelete(NotifyDTO dto) throws Exception; // 신고 관리 - 장터 게시글 신고 승인 처리
	
	public int updateReported(NotifyDTO dto) throws Exception; // 신고 관리 - 장터 게시글 신고 승인 처리
	
	public int updateCommunityBoardDelete(NotifyDTO dto) throws Exception; // 신고 관리 - 커뮤니티 게시글 신고 승인 처리

	public int updateCancelReported(NotifyDTO dto) throws Exception; // 신고 관리 - 커뮤니티 게시글 신고 승인 취소 처리
	
	public List<NotifyDTO> getCmtNotifyList(PageSet ps) throws Exception; // 신고 관리 - 댓글 신고 리스트
	
	public int getCmtNotifyCount(PageSet ps) throws Exception; // 신고 관리 - 댓글 신고 갯수
	
	public int updateCmtHandling(NotifyDTO dto) throws Exception; // 댓글 신고 승인, 반려 처리
	
	public int updateCmtDelete(NotifyDTO dto) throws Exception; // 댓글 신고 승인 처리
	
	public List<NotifyDTO> getReviewNotifyList(PageSet ps) throws Exception; // 신고 관리 - 리뷰 신고 리스트
	
	public int getReviewNotifyCount(PageSet ps) throws Exception; // 신고 관리 - 댓글 신고 갯수
	
	public int updateReviewHandling(NotifyDTO dto) throws Exception; // 신고 관리 - 리뷰 신고 승인, 반려 처리
	
	public int updateReviewDelete(NotifyDTO dto) throws Exception; // 신고 관리 - 리뷰 신고 승인 처리
	
	public int deleteCheck(DeleteCheckDTO dto) throws Exception; // 체크한 항목 삭제
	
	public List<Admin_categoryDTO> getNoticeAdminCategory() throws Exception; // 관리자 공지 - 카테고리
	
	public int insertNoticeAdmin(Notice_adminDTO dto) throws Exception; // 관리자 공지 - 관리자 공지 등록
	
	public Notice_adminDTO getNoticeAdmin(int notice_admin_id) throws Exception; // 관리자 공지 - 관리자 글 가져오기
	
	public int deleteNoticeAdmin(int notice_admin_id) throws Exception; // 관리자 공지 - 관리자 글 삭제하기
	
	public int updateNoticeAdmin(Notice_adminDTO dto) throws Exception; // 관리자 공지 - 관리자 글 수정하기
	
	public UserDTO getuserDetail(int user_id) throws Exception; // 회원 관리 - 회원 상세 정보
	
	public int updateUserDetail(UserDTO dto) throws Exception; // 회원 관리 - 회원 상세 정보 수정
	
	public Contact_usDTO getContactUsDetail(int cu_id) throws Exception; // 문의사항 - 1:1 문의 상세
	
	public int insertContactUsCmt(Contact_usDTO dto) throws Exception; // 문의사항 - 1:1 문의 답변
	
	public int deleteContactUsCmt(int cuc_comment_id) throws Exception; // 문의사항 - 1:1 문의 답변 삭제
	
	public Contact_usDTO getContactUsCmt(int cu_id) throws Exception; // 문의사항 - 1:1 문의 상세 답변
	
	public int updateContactUsState(Contact_usDTO dto) throws Exception; // 문의사항 - 1:1 문의 답변 완료,취소 처리
	
	public int updateCboardHidden(A_Community_boardDTO dto) throws Exception; // 게시물 관리 - 커뮤니티 게시물 숨김 처리
	
}










