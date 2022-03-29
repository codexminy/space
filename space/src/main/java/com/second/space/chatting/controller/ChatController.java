package com.second.space.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/chatting")
@Controller
public class ChatController {
	@GetMapping("/chat")
	public void chat() {
		
	}
	@GetMapping("/chatPartner")
	public void chatPartner() {
		
	}
	
}
