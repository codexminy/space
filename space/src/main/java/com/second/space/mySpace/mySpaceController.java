package com.second.space.mySpace;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.mySpace.model.FollowInfoDTO;
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
	
	@ResponseBody
	@DeleteMapping("/myspace/myspace/interested/{board_like_id}")
	public String deleteLike(@PathVariable int board_like_id) {
		service.deleteLike(board_like_id);
		return "success";
	}
	
	@GetMapping("/myspace/followings")
	public void follwing(PageSet ps, Model model, HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");
		
		if(user != null) {
			model.addAttribute("info", service.getUserInfo(ps.getUser_id()));
			model.addAttribute("ps", ps);
			model.addAttribute("list", service.getFollowingList(ps));
			model.addAttribute("paging", new Paging(service.getFollowingCount(ps.getUser_id()), ps));
			model.addAttribute("total", service.getFollowingCount(ps.getUser_id()));
			System.out.println(service.getFollowingList(ps).size());
		}
	}	
	
	@ResponseBody
	@DeleteMapping("/myspace/myspace/followings/{user_id}/{user_login_id}")
	public String deleteFollowing(FollowInfoDTO dto) {
		service.deleteFollowing(dto);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/myspace/myspace/followings/{user_id}/{user_login_id}")
	public String insertFollowing(FollowInfoDTO dto) {
		service.insertFollowing(dto);
		return "success";
	}
	
	@GetMapping("/myspace/followers")
	public void follower(PageSet ps, Model model, HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");
		
		if(user != null) {
			model.addAttribute("info", service.getUserInfo(ps.getUser_id()));
			model.addAttribute("ps", ps);
			model.addAttribute("list", service.getFollowerList(ps));
			model.addAttribute("paging", new Paging(service.getFollowerCount(ps.getUser_id()), ps));
			model.addAttribute("total", service.getFollowerCount(ps.getUser_id()));
			model.addAttribute("testing", service.getFollowerCheck(ps.getUser_id()));
		}
	}
}










