package com.second.space.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.second.space.admin.model.Notification_boardDTO;
import com.second.space.admin.model.Notification_cmtDTO;
import com.second.space.common.util.Utils;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.community.model.CommunityBoardImgDTO;
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
			model.addAttribute("c_board_img_list", community_service.getCommunityBoardImgList());
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
	
	@RequestMapping("/c_board_write/process")
	public String communityBoardWriteProcess(CommunityBoardDTO list, @RequestParam MultipartFile[] upfile, Model model, HttpServletRequest request) {
		
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/c_board");
		System.out.println(saveDirection);
				
		try {
			System.out.println("보냈다");
			// 커뮤니티 게시글 insert 후에 c_board_id 가져오기
			int result = community_service.newCommunityBoard(list);
			int c_board_id = 0;
			List<CommunityBoardImgDTO> imgList = new ArrayList<>();
			
			if(result > 0) {
				// c_board_id 가져오기 
				c_board_id = community_service.getCommunityBoardId(list.getUser_id());
				log.info("보드 넣기 성공");
				if(c_board_id != 0) {
					for(MultipartFile f : upfile) {
						if(!f.isEmpty()) {
							//파일명 
							String originalFileName = f.getOriginalFilename();
							String renamedFileName = Utils.getRenamedFileName2(originalFileName);
							
							//실제서버 저장
							try {
								f.transferTo(new File(saveDirection+"/"+renamedFileName));
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
							
							//List 작성
							CommunityBoardImgDTO c_board_img = new CommunityBoardImgDTO();
							c_board_img.setC_board_id(c_board_id);
							c_board_img.setC_originalfilename(originalFileName);
							c_board_img.setC_renamedfilename(renamedFileName);
							imgList.add(c_board_img);							
						}
					}
					//List Insert
					try {
						result = community_service.newCommunityBoardImg(imgList);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if(result > 0) {
						log.info("인서트 성공");
						System.out.println("성공");
					}else {
						log.info("인서트 실패");
						System.out.println("실패");
					}
				}
			}
			
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
		try {
			model.addAttribute("c_category_list", community_service.getCommunityCategoryList());
			model.addAttribute("c_board_list", community_service.getCommunityBoardList());
			model.addAttribute("c_board_img_list", community_service.getCommunityBoardImgList());
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
