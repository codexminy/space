package com.second.space.admin.service;

import java.util.List;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.UserDTO;

public interface AdminService {

	public List<Integer> getNotificationCount() throws Exception; // 홈 - 신고 관리 접수 갯수
	
	public List<Integer> getStatsCount() throws Exception; // 홈 - 통계 갯수
	
	public List<Notification_adDTO> getNotificationAdList() throws Exception; // 홈 - 배너 관리 리스트
	
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception; // 홈 - 어드민 안내 리스트
	
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps) throws Exception; // 배너관리 - 목록 리스트
	
	public int getNotificationAdTotal() throws Exception; // 배너관리 - 목록 전체 갯수
	
	public int createNotificationAd(Notification_adDTO dto) throws Exception; // 배너관리 - 신규 등록
	
	public Notification_adDTO getNotificationAdDetail(int na_id) throws Exception; // 배너관리 - 상세 정보
	
	public List<NoticeDTO> getAllNoticeList(PageSet ps) throws Exception; // 공지사항 - 목록 리스트
	
	public int getNoticeTotal() throws Exception; // 공지사항 - 목록 전체 갯수
	
	public NoticeDTO getNoticeDetail(int notice_id) throws Exception; // 공지사항 - 상세 정보
	
	public List<Notice_categoryDTO> getNoticeCategory() throws Exception; // 공지사항 - 카테고리 리스트
	
	public int insertNotice(NoticeDTO dto) throws Exception; // 공지사항 - 신규 등록
	
	public List<UserDTO> getAllUserList(PageSet ps) throws Exception; // 회원 관리 - 목록 리스트
	
	public int getUserTotal() throws Exception; // 회원 관리 - 목록 전체 갯수
	
	public List<UserDTO> getAllWithdrawalList(PageSet ps) throws Exception; // 회원 관리 - 탈퇴 회원 리스트
	
	public int getWithdrawalTotal() throws Exception; // 회원 관리 - 탈퇴 회원 전체 갯수
	
	public List<UserDTO> getAllSaleList(PageSet ps) throws Exception; // 게시물 관리 - 장터 게시물 리스트
	
	public int getSaleTotal() throws Exception; // 게시물 관리 - 장터 게시물 갯수
	
	public List<UserDTO> getAllCommunityList(PageSet ps) throws Exception; // 게시물 관리 - 장터 게시물 리스트
	
	public int getCommunityTotal() throws Exception; // 게시물 관리 - 장터 게시물 갯수
	
	public List<UserDTO> getAllNoticeAdminList(PageSet ps) throws Exception; // 관리자 공지 - 목록 리스트
	
	public int getNoticeAdminTotal() throws Exception; // 관리자 공지 - 목록 갯수
	
	public List<UserDTO> getAllContactUsList(PageSet ps) throws Exception; // 문의사항 - 1:1 문의 리스트
	
	public int getContactUsTotal() throws Exception; // 문의사항 - 1:1 문의 리스트 갯수
	
	public List<Integer> getMonthlyNewUser() throws Exception; // 통계 - 월별 성별 기준 신규 회원
	
	public List<Integer> getMonthlyWithdrawalUser() throws Exception; // 통계 - 월별 탈퇴 회원
	
	public List<Integer> getDailyVisit() throws Exception; // 일일 방문자수
	
}










