package com.second.space.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/home")
	public void homePage(Model model) {
		List<String> list = new ArrayList<>();
		list.add("신고접수");
		list.add("통계");
		list.add("광고");
		list.add("배너관리");
		list.add("공지사항");
		
		try {
			model.addAttribute("list", list);
			model.addAttribute("banner", service.getNotificationAdList());
			model.addAttribute("admin", service.getNoticeAdminList());
			model.addAttribute("all", service.getAllNotificationCount());
			model.addAttribute("board", service.getNotificationBoardCount());
			model.addAttribute("cmt", service.getNotificationCmtCount());
			model.addAttribute("review", service.getNotificationReviewCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("notification")
	public void notificatonPage(Model model) {
		List<String> list = new ArrayList<>();
		list.add("회원 신고 관리");
		list.add("게시글 신고 관리");
		list.add("댓글 신고 관리");
		list.add("리뷰 신고 관리");
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("banner")
	public void bannerPage(Model model, PageSet ps) throws Exception {
		List<String> list = new ArrayList<>();
		list.add("목록");
		list.add("신규 등록");
		list.add("마감");
		
		model.addAttribute("ps", ps);
		model.addAttribute("pageList", service.getAllNotificationAdList(ps));
		model.addAttribute("paging", new Paging(service.getNotificationAdTotal(), ps));
		model.addAttribute("list", list);
	}
}







