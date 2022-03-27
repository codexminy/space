package com.second.space.customerService.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.customerService.service.CSService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/customerService")
public class customerServiceController {
	
	@Autowired
	CSService cs_service;
	
	@GetMapping("/main")
	public String csMain(Model model) {
		System.out.println("cs main으로 이동");
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/cs_main";
	}
	
	@RequestMapping("/category")
	public String csCategory(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq";
	}
}
