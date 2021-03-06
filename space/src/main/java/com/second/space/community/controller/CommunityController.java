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
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityCommentDTO;
import com.second.space.community.service.CommunityService;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService community_service;
	
	@GetMapping("/main")
	public String communityMain(Model model, HttpServletRequest request) {
		System.out.println("community main으로 이동");
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");
		
		try {
			if (user != null) {
				model.addAttribute("c_user_list", community_service.getUserList());
				model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
				model.addAttribute("c_board_list", community_service.getCommunityBoardList(user.getUser_address()));
				model.addAttribute("c_board_img_list", community_service.getCommunityBoardImgList());
				model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
				model.addAttribute("c_comment_list2", community_service.getCommunityCommentList());
				model.addAttribute("c_comment_list3", community_service.getCommunityCommentList());
				model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
			} else {
				return "redirect:/user_/login";
			}
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "community/main";

	}
	
	@PostMapping("/search")
	public String communitySearch(String keyword, Model model, HttpServletRequest request) {
		System.out.println("검색 중..");
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		String user_address = user.getUser_address();
		System.out.println(user_address);
		
		System.out.println(keyword);
		try {			
			model.addAttribute("c_user_list", community_service.getUserList());
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunitySearchList(user_address, keyword));
			model.addAttribute("c_board_img_list", community_service.getCommunityBoardImgList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list2", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list3", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/main";
	}
	
	@GetMapping("/c_board")
	public void communityBoard(HttpServletRequest request, CommunityBoardDTO list, Model model) {
		System.out.println("community board로 이동");
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		try {
			if (user != null) {
			community_service.PutCommunityBoardViewCount(list);
			model.addAttribute("c_user_list", community_service.getUserList());
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList(user.getUser_address()));
			model.addAttribute("c_board_img_list", community_service.getCommunityBoardImgList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list2", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list3", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
			}
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
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
	
	@RequestMapping("/c_board_write/process")
	public String communityBoardWriteProcess(CommunityBoardDTO list, Model model, HttpServletRequest request) {
		
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/c_board");
		System.out.println(saveDirection);
				
		try {
			// 커뮤니티 게시글 insert 후에 c_board_id 가져오기
			int result = community_service.newCommunityBoard(list);
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
		}
		return "redirect:/community/main";
	}
	
	@RequestMapping("/category")
	public String community1(HttpServletRequest request, Model model) {
		System.out.println("community category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		try {
			if (user != null) {
			model.addAttribute("c_user_list", community_service.getUserList());
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList(user.getUser_address()));
			model.addAttribute("c_board_img_list", community_service.getCommunityBoardImgList());
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list2", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_list3", community_service.getCommunityCommentList());
			model.addAttribute("c_comment_count", community_service.getCommunityCommentCount());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/category";
	}
	
	@PostMapping("/comment_write")
	public String communityCommentWrite(HttpServletRequest request, CommunityCommentDTO list, Model model) {
		try {
			System.out.println("보냈다");
			model.addAttribute(community_service.newCommunityComment(list));
			log.info("INSERT");
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
			log.info("Error");
		}
		return "redirect:/community/c_board?c_board_id="+request.getParameter("c_board_id");
	}
	
	@PostMapping("/reply_write")
	public String communityReplyWrite(HttpServletRequest request, CommunityCommentDTO list, Model model) {
		try {
			System.out.println("보냈다");
			model.addAttribute(community_service.newCommunityCommentReply(list));
			log.info("INSERT");
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
			log.info("Error");
		}
		return "redirect:/community/c_board?c_board_id="+request.getParameter("c_board_id");
	}
	
	@GetMapping("/board_report")
	public String communityBoardReportWrite(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		try {
			if(user != null) {
			model.addAttribute("c_board_list", community_service.getCommunityBoardList(user.getUser_address()));
			}
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
	public String communityCommentReportWrite(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		try {
			if (user != null) {
			model.addAttribute("c_board_list", community_service.getCommunityBoardList(user.getUser_address()));
			model.addAttribute("c_comment_list", community_service.getCommunityCommentList());
			}
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
