package com.second.space.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.service.UserServiceImpl;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@Autowired
	UserServiceImpl userService;
	
	@GetMapping("/space")
	public String space(Model model) {
		List<MainInfoDTO> mainList = userService.getMain();
		
		//공지사항
		List<NoticeDTO> noticeList = userService.getNoticeList();
		//커뮤니티
		List<CommunityBoardDTO> communityList = userService.getCommunity();

		model.addAttribute("mainList", mainList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("communityList", communityList);
		
		return "main/space";
		
	}
	@GetMapping("/header")
	public void header() {
		
	}
	@GetMapping("/footer")
	public void footer() {
		
	}
	@GetMapping("/company")
	public void company() {
		
	}
	@GetMapping("/recruitment")
	public void recruitment() {
		
	}
	@GetMapping("/ad")
	public void ad() {
		
	}
	@GetMapping("/personal")
	public void personal() {
		
	}
	@GetMapping("/terms")
	public void terms() {
		
	}
	
}
