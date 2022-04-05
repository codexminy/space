package com.second.space.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.admin.service.AdminService;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/notice")
	public void notice(PageSet ps, Model model) throws Exception {
		model.addAttribute("list", service.getAllNoticeList(ps));
		model.addAttribute("paging", new Paging(service.getNoticeTotal(ps), ps));
	}
	
	@GetMapping("/notice_view")
	public void notice_view(int notice_id, Model model) throws Exception {
		model.addAttribute("list", service.getNoticeDetail(notice_id));
	}
}
