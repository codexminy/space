package com.second.space.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.Notification_cmtDTO;
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
			model.addAttribute("c_comment_list2", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list3", community_service.getCommunityCommentList());
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
		session.setAttribute("user_id", temp_id);
		session.setAttribute("user_pw", temp_pw);
		
		System.out.println("아이디: "+session.getAttribute("user_id"));
		System.out.println("비밀번호: "+session.getAttribute("user_pw"));
		return "redirect:/community/main";
	}
	
	@PostMapping("/c_board_write")
	public String communityBoardWrite(Model model) {
		System.out.println("글쓰기.jsp");
		try {
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/board_write";
	}
	
	@RequestMapping("/category")
	public String community1(HttpServletRequest request, Model model) {
		System.out.println("community category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list2", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list3", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/category";
	}
	
	@PostMapping("/comment_write")
	public String communityCommentWrite(CommunityCommentDTO list, Model model) {
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
	
	@PostMapping("/reply_write")
	public String communityReplyWrite(CommunityCommentDTO list, Model model) {
		try {
			System.out.println("보냈다");
			model.addAttribute(community_service.newCommunityCommentReply(list));
			log.info("INSERT");
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
			log.info("Error");
		}
		return "redirect:/community/main";
	}
	
	@GetMapping("/board_report")
	public String communityBoardReportWrite(Model model) {
		try {
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/board_report";
	}
	
	@PostMapping("/board_report/process")
	public String communityBoardReportProcess(Notification_boardDTO list, Model model) {
		try {
			System.out.println("보냈다");
			model.addAttribute(community_service.newNotificationBoard(list));
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
		}
		return "/community/exit";
	}
	
	@GetMapping("/comment_report")
	public String communityCommentReportWrite(Model model) {
		try {
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/comment_report";
	}
	
	@PostMapping("/comment_report/process")
	public String communityCommentReportProcess(Notification_cmtDTO list, Model model) {
		try {
			System.out.println("보냈다");
			model.addAttribute(community_service.newNotificationCmt(list));
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
		}
		return "/community/exit";
	}
}
