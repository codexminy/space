package com.second.space.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.board.model.BoardLikeDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;
import com.second.space.user_.service.UserServiceImpl;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@Autowired
	UserServiceImpl userService;
	
	@GetMapping("/space")
	public String space(Model model,  HttpServletRequest request) {
		model.addAttribute("banner", userService.getNotificationAdList());

		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		
		if(user != null) {
			List<MainInfoDTO> mainList = userService.getMainList(user.getUser_address());
			
			//공지사항
			List<NoticeDTO> noticeList = userService.getNoticeList();
			//커뮤니티
			List<CommunityBoardDTO> communityList = userService.getCommunityList(user.getUser_address());
			//찜
			List<BoardLikeDTO> likeList = userService.getBoardLikeList(user.getUser_id());
			for(int i = 0; i < mainList.size(); i++) {
				for(int j = 0; j < likeList.size(); j++) {
					if(mainList.get(i).getBoard_id() == likeList.get(j).getBoard_id()) {
						mainList.get(i).setBoard_like("Y");
						break;
					}
				}
			}
			model.addAttribute("user_id", user.getUser_id());	
			model.addAttribute("mainList", mainList);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("communityList", communityList);
		
			
		}else {
			List<MainInfoDTO> mainList = userService.getMain();
			
			//공지사항
			List<NoticeDTO> noticeList = userService.getNoticeList();
			//커뮤니티
			List<CommunityBoardDTO> communityList = userService.getCommunity();
			List<BoardLikeDTO> likeList = null;

			model.addAttribute("mainList", mainList);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("communityList", communityList);
		}
		
		
		
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
