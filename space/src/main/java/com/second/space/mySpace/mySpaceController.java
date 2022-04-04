package com.second.space.mySpace;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.second.space.admin.model.PageSet;
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
		}
	}
	
	@GetMapping("/myspace/reviews")
	public void review() {

	}
	
	@GetMapping("/myspace/interested")
	public void interest() {

	}
	
	@GetMapping("/myspace/followings")
	public void follwing() {

	}	
	
	@GetMapping("/myspace/followers")
	public void follower() {

	}
}
