package com.second.space.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/admin/home")
	public void home() {

	}
	
	@GetMapping("/admin/notification/main")
	public void notification() {

	}
	
	@GetMapping("/admin/banner/list")
	public void bannerList() {

	}
	
	@GetMapping("/admin/banner/create")
	public void bannerCreate() {

	}
	
	@GetMapping("/admin/banner/detail")
	public void bannerDetail(@ModelAttribute("dto") Notification_adDTO dto) {
		
	}
	
	@GetMapping("/admin/banner/update")
	public void bannerUpdate(@ModelAttribute("dto") Notification_adDTO dto) {
		
	}
	
	@GetMapping("/admin/notice/list")
	public void notice() {
		
	}
	
	@GetMapping("/admin/notice/create")
	public void noticeCreate(Model model) throws Exception {
		model.addAttribute("list", service.getNoticeCategory());
	}
	
	@GetMapping("/admin/notice/detail")
	public void noticeDetail(@ModelAttribute("dto") NoticeDTO dto) {
		
	}
	
	@GetMapping("/admin/notice/update")
	public void noticeUpdate(@ModelAttribute("dto") NoticeDTO dto) {
		
	}
	
	@GetMapping("/admin/user/list")
	public void userList() {
		
	}
	
	@GetMapping("/admin/user/withdrawalList")
	public void userWithdrawalList() {
		
	}
	
	@GetMapping("/admin/board/sale")
	public void saleList() {
		
	}
	
	@GetMapping("/admin/board/community")
	public void communityList() {
		
	}
	
	@GetMapping("/admin/admin/list")
	public void adminList() {
		
	}
	
	@GetMapping("/admin/enquiry/contactUs")
	public void contactUsList() {
		
	}
	
	@GetMapping("/admin/stats/stats")
	public void statsList() {
	}
}







