package com.second.space.customerService.controller.copy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/customerService")
@Controller
public class customerServiceController {
	@GetMapping("/customer")
	public void customer() {
		
	}
	@GetMapping("/FAQ")
	public void FAQ() {
		
	}
	@GetMapping("/QnA")
	public void QnA() {
		
	}
	@GetMapping("/client")
	public void client() {
		
	}
	@GetMapping("/contentList")
	public void contentList() {
		
	}
	
}
