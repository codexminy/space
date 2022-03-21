package com.second.space.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}







