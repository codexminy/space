package com.second.space.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {
	@GetMapping("/space")
	public void space() {
		
	}
	@GetMapping("/header")
	public void header() {
		
	}
	@GetMapping("/footer")
	public void footer() {
		
	}
}
