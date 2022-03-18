package com.second.space.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.community.model.CommunityCommentDTO;
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
			model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
	}
	
	@PostMapping("/login")
	public String communityMainLogin(HttpServletRequest request, Model model) {
		String temp_id = request.getParameter("temp_id");
		String temp_pw = request.getParameter("temp_pw");
		
		HttpSession session = request.getSession();
		session.setAttribute("ing_id", temp_id);
		session.setAttribute("ing_pw", temp_pw);
		
		System.out.println("아이디: "+session.getAttribute("ing_id"));
		System.out.println("비밀번호: "+session.getAttribute("ing_pw"));
		return "redirect:/community/main";
	}
	
	@RequestMapping("/category")
	public String community1(HttpServletRequest request, Model model) {
		System.out.println("community category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/category";
	}
	
	@PostMapping("/comment_write")
	public String communityCommentWrite(CommunityCommentDTO list, HttpServletRequest request, Model model) {
		String c_content = request.getParameter("c_comment_write");
		String c_board_id = request.getParameter("c_board_id");
		model.addAttribute("c_content", c_content);
		model.addAttribute("c_board_id", c_board_id);
		try {
			System.out.println("보냈다");
			model.addAttribute(community_service.newCommunityComment(list));
			log.info("INSERT");
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
			log.info("Error");
		}
		return "redirect:/community/main";
	}
}
