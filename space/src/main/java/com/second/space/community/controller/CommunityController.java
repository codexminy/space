package com.second.space.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.service.CommunityService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community")
public class CommunityController {
//	
//	@Autowired
//	CommunityService community_service;
//	
//	@GetMapping("/main")
//	public void communityMain(CommunityBoardDTO list, Model model) {
//		try {
//			model.addAttribute(community_service.getCommunityBoardList(list));
//		} catch (Exception e) {
//			log.info("Error");
//			e.printStackTrace();
//		}
//	}
}
