package com.second.space.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.NotifyDTO;
import com.second.space.admin.service.AdminService;

@Controller
public class AdminController {
	private static String[] homeMenu = {"신고 관리", "통계", "배너 관리", "관리자 공지"};
	private static String[] homeLink = {"/admin/notification/board", "/admin/stats/stats", "/admin/banner/list", "/admin/admin/list"};
	private static String userTitle = "회원 관리";
	private static String[] userMenu = {"목록", "탈퇴 회원"};
	private static String[] userLink = {"/admin/user/list", "/admin/user/withdrawalList"};
	private static String notifyTitle = "신고 관리";
	private static String[] notifyMenu = {"게시글", "댓글", "후기"};
	private static String[] notifyLink = {"/admin/notification/board", "/admin/notification/cmt", "/admin/notification/review"};
	private static String[] notifyWidth = {"3%", "3%", "20%", "10%", "20%", "12%", "8%", "8%", "5%", "30%"};
	private static String bannerTitle = "배너 관리";
	private static String[] bannerMenu = {"목록", "신규 등록", "마감"};
	private static String[] bannerLink = {"/admin/banner/list", "/admin/banner/create", "/admin/banner/endDate"};
	private static String[] bannerWidth = {"3%", "3%", "15%", "15%", "20%", "15%"};
	private static String[] bannerHead = {selectAllBox(), "번호", "업체", "노출 상호", "링크", "기간"};
	private static String noticeTitle = "공지사항";
	private static String[] noticeMenu = {"목록", "신규 등록"};
	private static String[] noticeLink = {"/admin/notice/list", "/admin/notice/create"};
	private static String[] noticeWidth = {"3%", "3%", "10%", "60%", "10%"};
	private static String[] noticeHead = {selectAllBox(), "번호", "분류", "제목", "등록일"};
	private static String contactUsTitle = "문의사항";
	private static String[] contactUsMenu = {"1:1 문의"};
	private static String[] contactUsLink = {"/admin/enquiry/contactUs"};
	private static String boardTitle = "게시물 관리";
	private static String[] boardMenu = {"장터", "커뮤니티"};
	private static String[] boardLink = {"/admin/board/sale", "/admin/board/community"};
	private static String[] boardWidth = {"3%", "3%", "15%", "12%", "12%", "35%", "10%", "15%"};
	private static String[] boardHead = {selectAllBox(), "번호", "아이디", "닉네임", "카테고리", "제목", "등록일", "처리"};
	private static String adminTitle = "관리자 공지";
	private static String[] adminMenu = {"목록", "신규등록"};
	private static String[] adminLink = {"/admin/admin/list", "/admin/admin/create"};
	private static String statsTitle = "통계";
	private static String[] statsMenu = {"회원", "게시글", "신고"};
	private static String[] statsLink = {"/admin/stats/stats", "/admin/stats/board", "/admin/stats/notification"};
	
	private static Model settingModel(Model model, String title, String[] menu, String[] link, String[] width, String[] head) {
		model.addAttribute("title", title);
		model.addAttribute("menu", menu);
		model.addAttribute("link", link);
		model.addAttribute("width", width);
		model.addAttribute("head", head);
		return model;
	}
	
	private static Model settingModel(Model model, String title, String[] menu, String[] link) {
		model.addAttribute("title", title);
		model.addAttribute("menu", menu);
		model.addAttribute("link", link);
		return model;
	}

	private static String[] notifyHead(String word) {
		return new String[] {selectAllBox(), "번호", "신고대상", "접수일", "신고자", "사유", "내용", word, "누적신고", "처리"};
	}
	
	private static String selectAllBox() {
		return "<input type=checkbox class=chkAll onclick=selectAll() />";
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
		settingModel(model, notifyTitle, notifyMenu, notifyLink, notifyWidth, notifyHead("게시글"));
		model.addAttribute("id", "n_id");
		model.addAttribute("table", "notification_board");
	}
	
	@GetMapping("/admin/notification/boardDetail")
	public void notificationDetailBoard(Model model, @RequestParam int n_id) {
		model.addAttribute("n_id", n_id);
	}
	
	@GetMapping("/admin/notification/cmtDetail")
	public void notificationDetailCmt(Model model, @RequestParam int nc_id) {
		model.addAttribute("nc_id", nc_id);
	}
	
	@GetMapping("/admin/notification/reviewDetail")
	public void notificationDetailReview(Model model, @RequestParam int nr_id) {
		model.addAttribute("nr_id", nr_id);
	}
	
	@GetMapping("/admin/notification/cmt")
	public void notificationCmt(Model model) {
		settingModel(model, notifyTitle, notifyMenu, notifyLink, notifyWidth, notifyHead("댓글"));
		model.addAttribute("id", "nc_id");
		model.addAttribute("table", "notification_cmt");
	}
	
	@GetMapping("/admin/notification/review")
	public void notificationReview(Model model) {
		settingModel(model, notifyTitle, notifyMenu, notifyLink, notifyWidth, notifyHead("리뷰"));
		model.addAttribute("id", "nr_id");
		model.addAttribute("table", "notification_review");
	}
	
	@GetMapping("/admin/banner/list")
	public void bannerList(Model model) throws Exception {
		settingModel(model, bannerTitle, bannerMenu, bannerLink, bannerWidth, bannerHead);
		model.addAttribute("detailUrl", "/admin/banner/detail");
		model.addAttribute("id", "na_id");
		model.addAttribute("table", "notification_ad");
	}
	
	@GetMapping("/admin/banner/create")
	public void bannerCreate(Model model) {
		settingModel(model, bannerTitle, bannerMenu, bannerLink);
	}
	
	@GetMapping("/admin/banner/detail")
	public void bannerDetail(@ModelAttribute("dto") Notification_adDTO dto, Model model) {
		settingModel(model, bannerTitle, bannerMenu, bannerLink);
	}
	
	@GetMapping("/admin/banner/update")
	public void bannerUpdate(@ModelAttribute("dto") Notification_adDTO dto, Model model) {
		settingModel(model, bannerTitle, bannerMenu, bannerLink);
	}
	
	@GetMapping("/admin/banner/endDate")
	public void endDateList(Model model) {
		settingModel(model, bannerTitle, bannerMenu, bannerLink, bannerWidth, bannerHead);
		model.addAttribute("detailUrl", "/admin/banner/detail");
		model.addAttribute("id", "na_id");
		model.addAttribute("table", "notification_ad");
	}
	
	@GetMapping("/admin/notice/list")
	public void notice(Model model) {
		settingModel(model, noticeTitle, noticeMenu, noticeLink, noticeWidth, noticeHead);
		model.addAttribute("detailUrl", "/admin/notice/detail");
		model.addAttribute("id", "notice_id");
		model.addAttribute("table", "notice");
	}
	
	@GetMapping("/admin/notice/create")
	public void noticeCreate(Model model) throws Exception {
		model.addAttribute("list", service.getNoticeCategory());
		settingModel(model, noticeTitle, noticeMenu, noticeLink);
	}
	
	@GetMapping("/admin/notice/detail")
	public void noticeDetail(@ModelAttribute("dto") NoticeDTO dto, Model model) {
		settingModel(model, noticeTitle, noticeMenu, noticeLink);
	}
	
	@GetMapping("/admin/notice/update")
	public void noticeUpdate(@ModelAttribute("dto") NoticeDTO dto, Model model) throws Exception {
		model.addAttribute("list", service.getNoticeCategory());
		settingModel(model, noticeTitle, noticeMenu, noticeLink);
	}

	@GetMapping("/admin/user/list")
	public void userList(Model model) {
		settingModel(
			model, userTitle, userMenu, userLink,
			new String[] {"3%", "3%", "20%", "15%", "10%", "15%", "15%", "20%"},
			new String[] {selectAllBox(), "번호", "아이디", "닉네임", "가입일", "주소", "휴대전화", "메일"}
		);
		model.addAttribute("detailUrl", "/admin/user/detail");
		model.addAttribute("id", "user_id");
		model.addAttribute("table", "user_");
	}
	
	@GetMapping("/admin/user/withdrawalList")
	public void userWithdrawalList(Model model) {
		settingModel(
			model, userTitle, userMenu, userLink,
			new String[] {"3%", "3%", "20%", "20%", "20%", "20%", "20%"},
			new String[] {selectAllBox(), "번호", "아이디", "닉네임", "가입일", "사유", "탈퇴일"}
		);
		model.addAttribute("detailUrl", "/admin/user/detail");
		model.addAttribute("id", "user_id");
		model.addAttribute("table", new String[] {"delete_account", "user_"});
	}
	
	@GetMapping("/admin/user/detail")
	public void userDetail(Model model, @RequestParam int user_id) throws Exception {
		model.addAttribute("user_id", user_id);
		model.addAttribute("list", service.getuserDetail(user_id));
	}
	
	@GetMapping("/admin/board/sale")
	public void saleList(Model model) {
		settingModel(model, boardTitle, boardMenu, boardLink, boardWidth, boardHead);
		model.addAttribute("detailUrl", "#");
		model.addAttribute("id", "board_id");
		model.addAttribute("table", "board");
	}
	
	@GetMapping("/admin/board/community")
	public void communityList(Model model) {
		settingModel(model, boardTitle, boardMenu, boardLink, boardWidth, boardHead);
		model.addAttribute("detailUrl", "/admin/community/c_board");
		model.addAttribute("id", "c_board_id");
		model.addAttribute("table", "community_board");
	}
	
	@GetMapping("/admin/admin/list")
	public void adminList(Model model) {
		settingModel(model, adminTitle, adminMenu, adminLink, noticeWidth, noticeHead);
		model.addAttribute("detailUrl", "/admin/admin/detail");
		model.addAttribute("id", "notice_admin_id");
		model.addAttribute("table", "notice_admin");
	}
	
	@GetMapping("/admin/admin/create")
	public void adminCreate(Model model) throws Exception {
		model.addAttribute("list", service.getNoticeAdminCategory());
		settingModel(model, adminTitle, adminMenu, adminLink);
	}
	
	@GetMapping("/admin/admin/detail")
	public void adminDetail(@ModelAttribute("dto") Notice_adminDTO dto, Model model) throws Exception {
		settingModel(model, adminTitle, adminMenu, adminLink);
	}
	
	@GetMapping("/admin/admin/update")
	public void adminUpdate(@ModelAttribute("dto") Notice_adminDTO dto, Model model) throws Exception {
		model.addAttribute("list", service.getNoticeAdminCategory());
		settingModel(model, adminTitle, adminMenu, adminLink);
	}
	
	@GetMapping("/admin/enquiry/contactUs")
	public void contactUsList(Model model) {
		settingModel(
			model, contactUsTitle, contactUsMenu, contactUsLink,
			new String[] {"3%", "3%", "10%", "60%", "10%", "10%"},
			new String[] {selectAllBox(), "번호", "분류", "제목", "등록일", "답변 상태"}
		);
		model.addAttribute("detailUrl", "/admin/enquiry/detail");
		model.addAttribute("id", "cu_id");
		model.addAttribute("table", "contact_us");
	}
	
	@GetMapping("/admin/enquiry/detail")
	public void contactUsList(Model model, @RequestParam int cu_id) {
		model.addAttribute("cu_id", cu_id);
		settingModel(model, contactUsTitle, contactUsMenu, contactUsLink, noticeWidth, noticeHead);
	}
	
	@GetMapping("/admin/stats/stats")
	public void statsList(Model model) {
		settingModel(model, statsTitle, statsMenu, statsLink);
	}
	
	@GetMapping("/admin/stats/board")
	public void statsBoardList(Model model) {
		settingModel(model, statsTitle, statsMenu, statsLink);
	}
	
	@GetMapping("/admin/stats/notification")
	public void statsNotificationList(Model model) {
		settingModel(model, statsTitle, statsMenu, statsLink);
	}
}







