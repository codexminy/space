package com.second.space.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	@GetMapping("/notice")
	public void notice() {
		
	}
	@GetMapping("/notice_view")
	public void notice_view() {
		
	}
}
