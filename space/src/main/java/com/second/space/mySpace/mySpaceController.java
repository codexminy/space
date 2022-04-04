package com.second.space.mySpace;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.mySpace.service.MySpaceService;
import com.second.space.user_.model.UserDTO;

@Controller
public class mySpaceController {
	
	@Autowired
	MySpaceService service;
	
	@GetMapping("/myspace/product")
	public void product(PageSet ps, Model model, HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");
		
		if(user != null) {
			model.addAttribute("info", service.getUserInfo(ps.getUser_id()));
			model.addAttribute("ps", ps);
			model.addAttribute("list", service.getBoardInfoList(ps));
			model.addAttribute("paging", new Paging(service.getBoardInfoCount(ps.getUser_id()), ps));
			model.addAttribute("total", service.getBoardInfoCount(ps.getUser_id()));
		}
	}
	
	@GetMapping("/myspace/reviews")
	public void review(PageSet ps, Model model, HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");
		
		if(user != null) {
			model.addAttribute("info", service.getUserInfo(ps.getUser_id()));
			model.addAttribute("ps", ps);
			model.addAttribute("list", service.getReviewInfoList(ps));
			model.addAttribute("paging", new Paging(service.getReviewInfoCount(ps.getUser_id()), ps));
			model.addAttribute("total", service.getReviewInfoCount(ps.getUser_id()));
		}
	}
	
	@GetMapping("/myspace/interested")
	public void interest(PageSet ps, Model model, HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");
		
		if(user != null) {
			model.addAttribute("info", service.getUserInfo(ps.getUser_id()));
			model.addAttribute("ps", ps);
			model.addAttribute("list", service.getLikeInfoList(ps));
			model.addAttribute("paging", new Paging(service.getLikeInfoCount(ps.getUser_id()), ps));
			model.addAttribute("total", service.getLikeInfoCount(ps.getUser_id()));
		}
	}
	
	@GetMapping("/myspace/followings")
	public void follwing() {

	}	
	
	@GetMapping("/myspace/followers")
	public void follower() {

	}
}
