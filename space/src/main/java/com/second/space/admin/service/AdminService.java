package com.second.space.admin.service;

import java.util.List;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notice_categoryDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;

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
	
}
