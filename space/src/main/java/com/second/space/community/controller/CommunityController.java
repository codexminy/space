package com.second.space.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.community.service.CommunityService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService community_service;
	
	@GetMapping("/main")
	public void communityMain(Model model) {
		System.out.println("community main으로 이동");
		try {
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/category")
	public String community1(HttpServletRequest request, Model model) {
		System.out.println("community category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/community/category";
	}
}
