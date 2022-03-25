package com.second.space.mySpace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mySpaceController {
	
	@GetMapping("/myspace/product")
	public void product() {

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
