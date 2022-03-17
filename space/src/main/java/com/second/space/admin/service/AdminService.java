package com.second.space.admin.service;

import java.util.List;

import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;

public interface AdminService {

	public int getAllNotificationCount() throws Exception; // 홈 - 회원 신고 접수
	
	public int getNotificationBoardCount() throws Exception; // 홈 - 게시글 신고 접수
		
	public int getNotificationCmtCount() throws Exception; // 홈 - 댓글 신고 접수
	
	public int getNotificationReviewCount() throws Exception; // 홈 - 리뷰 신고 접수
	
	public List<Notification_adDTO> getNotificationAdList() throws Exception; // 홈 - 배너 관리
	
	public List<Notice_adminDTO> getNoticeAdminList() throws Exception; // 홈 - 어드민 안내
	
	public List<Notification_adDTO> getAllNotificationAdList(PageSet ps) throws Exception; // 배너관리 - 테이블
	
	public int getNotificationAdTotal() throws Exception; // 배너관리 - 총 갯수
	
	public Notification_adDTO getNotificationAdDetailList(int na_id) throws Exception; // 배너리스트
	
	public int insertNotificationAd(String imgPath) throws Exception; // 배너 등록
}
