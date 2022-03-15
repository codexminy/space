package com.second.space.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/home")
	public void getAllNotificationCount(Model model) {
		ArrayList<String> list = new ArrayList<>();
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
}
