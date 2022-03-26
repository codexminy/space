package com.second.space.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.admin.service.AdminService;

@Controller
public class AdminController {
	private static String[] homeMenu = {"신고 관리", "통계", "광고", "배너 관리", "관리자 공지"};
	private static String[] homeLink = {"/admin/notification/board", "/admin/stats/stats", "#", "/admin/banner/list", "/admin/admin/list"};
	private static String userTitle = "회원 관리";
	private static String[] userMenu = {"목록", "탈퇴 회원", "누적 신고"};
	private static String[] userLink = {"/admin/user/list", "/admin/user/withdrawalList", "#"};
	private static String notifyTitle = "신고 관리";
	private static String[] notifyMenu = {"게시글", "댓글", "후기"};
	private static String[] notifyLink = {"/admin/notification/board", "/admin/notification/cmt", "/admin/notification/review"};
	private static String[] notifyWidth = {"20%", "20%", "20%", "20%", "20%", "20%", "20%", "20%", "20%"};
	private static String bannerTitle = "배너 관리";
	private static String[] bannerMenu = {"목록", "신규 등록", "마감"};
	private static String[] bannerLink = {"/admin/banner/list", "/admin/banner/create", "/admin/banner/endDate"};
	private static String[] bannerWidth = {"5%", "10%", "10%", "50%", "10%", "15%"};
	private static String[] bannerHead = {"번호", "선택", "업체", "노출 상호", "링크", "기간"};
	private static String noticeTitle = "공지사항";
	private static String[] noticeMenu = {"목록", "신규 등록"};
	private static String[] noticeLink = {"/admin/notice/list", "/admin/notice/create"};
	private static String[] noticeWidth = {"5%", "5%", "10%", "70%", "10%"};
	private static String[] noticeHead = {"번호", "선택", "분류", "제목", "등록일"};
	private static String contactUsTitle = "문의사항";
	private static String[] contactUsMenu = {"1:1 문의", "광고제의"};
	private static String[] contactUsLink = {"/admin/enquiry/contactUs", "/admin/enquiry/advertising"};
	private static String boardTitle = "게시물 관리";
	private static String[] boardMenu = {"장터", "커뮤니티"};
	private static String[] boardLink = {"/admin/board/sale", "/admin/board/community"};
	private static String[] boardWidth = {"20%", "20%", "20%", "20%", "20%", "20%"};
	private static String[] boardHead = {"번호", "선택", "아이디", "닉네임", "카테고리", "제목", "등록일", "처리"};
	private static String adminTitle = "관리자 공지";
	private static String[] adminMenu = {"목록", "신규등록"};
	private static String[] adminLink = {"/admin/admin/list", "/admin/admin/create"};
	private static String statsTitle = "통계";
	private static String[] statsMenu = {"회원", "게시글", "신고", "광고"};
	private static String[] statsLink = {"/admin/stats/stats", "/admin/stats/board", "/admin/stats/notification", "#"};

	private static Model settingModel(Model model, String title, String[] menu, String[] link, String[] width, String[] head) {
		model.addAttribute("title", title);
		model.addAttribute("menu", menu);
		model.addAttribute("link", link);
		model.addAttribute("width", width);
		model.addAttribute("head", head);
		return model;
	}
	
	private static Model bannerCommon(Model model) {
		model.addAttribute("title", bannerTitle);
		model.addAttribute("menu", bannerMenu);
		model.addAttribute("link", bannerLink);
		return model;
	}
	
	private static Model noticeCommon(Model model) {
		model.addAttribute("title", noticeTitle);
		model.addAttribute("menu", noticeMenu);
		model.addAttribute("link", noticeLink);
		return model;
	}
	
	private static Model statsCommon(Model model) {
		model.addAttribute("title", statsTitle);
		model.addAttribute("menu", statsMenu);
		model.addAttribute("link", statsLink);
		return model;
	}
	
	@Autowired
	AdminService service;
	
	@GetMapping("/admin/home")
	public void home(Model model) {
		model.addAttribute("menu", homeMenu);
		model.addAttribute("link", homeLink);	
	}
	
	@GetMapping("/admin/notification/board")
	public void notificationBoard(Model model) {
		settingModel(
			model, notifyTitle, notifyMenu, notifyLink, notifyWidth,
			new String[] {"번호", "신고대상", "접수일", "신고자", "사유", "내용", "게시글", "누적신고", "처리"}
		);
	}
	
	@GetMapping("/admin/notification/cmt")
	public void notificationCmt(Model model) {
		settingModel(
			model, notifyTitle, notifyMenu, notifyLink, notifyWidth,
			new String[] {"번호", "신고대상", "접수일", "신고자", "사유", "내용", "댓글", "누적신고", "처리"}
		);
	}
	
	@GetMapping("/admin/notification/review")
	public void notificationReview(Model model) {
		settingModel(
			model, notifyTitle, notifyMenu, notifyLink, notifyWidth,
			new String[] {"번호", "신고대상", "접수일", "신고자", "사유", "내용", "리뷰", "누적신고", "처리"}
		);
	}
	
	@GetMapping("/admin/banner/list")
	public void bannerList(Model model) throws Exception {
		settingModel(model, bannerTitle, bannerMenu, bannerLink, bannerWidth, bannerHead);
		model.addAttribute("detailUrl", "/admin/banner/detail");
		model.addAttribute("id", "na_id");
	}
	
	@GetMapping("/admin/banner/create")
	public void bannerCreate(Model model) {
		bannerCommon(model);
	}
	
	@GetMapping("/admin/banner/detail")
	public void bannerDetail(@ModelAttribute("dto") Notification_adDTO dto, Model model) {
		bannerCommon(model);
	}
	
	@GetMapping("/admin/banner/update")
	public void bannerUpdate(@ModelAttribute("dto") Notification_adDTO dto, Model model) {
		bannerCommon(model);
	}
	
	@GetMapping("/admin/banner/endDate")
	public void endDateList(Model model) {
		settingModel(model, bannerTitle, bannerMenu, bannerLink, bannerWidth, bannerHead);
		model.addAttribute("detailUrl", "/admin/banner/detail");
		model.addAttribute("id", "na_id");
	}
	
	@GetMapping("/admin/notice/list")
	public void notice(Model model) {
		settingModel(model, noticeTitle, noticeMenu, noticeLink, noticeWidth, noticeHead);
		model.addAttribute("detailUrl", "/admin/notice/detail");
		model.addAttribute("id", "notice_id");
	}
	
	@GetMapping("/admin/notice/create")
	public void noticeCreate(Model model) throws Exception {
		model.addAttribute("list", service.getNoticeCategory());
		noticeCommon(model);
	}
	
	@GetMapping("/admin/notice/detail")
	public void noticeDetail(@ModelAttribute("dto") NoticeDTO dto, Model model) {
		noticeCommon(model);
	}
	
	@GetMapping("/admin/notice/update")
	public void noticeUpdate(@ModelAttribute("dto") NoticeDTO dto, Model model) throws Exception {
		model.addAttribute("list", service.getNoticeCategory());
		noticeCommon(model);
	}

	@GetMapping("/admin/user/list")
	public void userList(Model model) {
		settingModel(
			model, userTitle, userMenu, userLink,
			new String[] {"20", "20%", "20%", "20%", "20%", "20%", "20%", "20%"},
			new String[] {"번호", "선택", "아이디", "닉네임", "가입일", "주소", "휴대전화", "메일"}
		);
		model.addAttribute("detailUrl", "/admin/user/detail");
		model.addAttribute("id", "user_id");
	}
	
	@GetMapping("/admin/user/withdrawalList")
	public void userWithdrawalList(Model model) {
		settingModel(
			model, userTitle, userMenu, userLink,
			new String[] {"20", "20%", "20%", "20%", "20%", "20%", "20%"},
			new String[] {"번호", "선택", "아이디", "닉네임", "가입일", "사유", "탈퇴일"}
		);
		model.addAttribute("detailUrl", "/admin/user/detail");
		model.addAttribute("id", "user_id");
	}
	
	@GetMapping("/admin/board/sale")
	public void saleList(Model model) {
		settingModel(model, boardTitle, boardMenu, boardLink, boardWidth, boardHead);
		model.addAttribute("detailUrl", "#");
		model.addAttribute("id", "board_id");
	}
	
	@GetMapping("/admin/board/community")
	public void communityList(Model model) {
		settingModel(model, boardTitle, boardMenu, boardLink, boardWidth, boardHead);
		model.addAttribute("detailUrl", "/admin/community/c_board");
		model.addAttribute("id", "c_board_id");
	}
	
	@GetMapping("/admin/admin/list")
	public void adminList(Model model) {
		settingModel(model, adminTitle, adminMenu, adminLink, noticeWidth, noticeHead);
		model.addAttribute("detailUrl", "/admin/admin/detail");
		model.addAttribute("id", "notice_admin_id");
	}
	
	@GetMapping("/admin/enquiry/contactUs")
	public void contactUsList(Model model) {
		settingModel(model, contactUsTitle, contactUsMenu, contactUsLink, noticeWidth, noticeHead);
		model.addAttribute("detailUrl", "/admin/contactUs/detail");
		model.addAttribute("id", "cu_id");
	}
	
	@GetMapping("/admin/stats/stats")
	public void statsList(Model model) {
		statsCommon(model);
	}
	
	@GetMapping("/admin/stats/board")
	public void statsBoardList(Model model) {
		statsCommon(model);
	}
	
	@GetMapping("/admin/stats/notification")
	public void statsNotificationList(Model model) {
		statsCommon(model);
	}
}







