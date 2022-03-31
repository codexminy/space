package com.second.space;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.service.UserServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	UserServiceImpl userService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
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
	
}
