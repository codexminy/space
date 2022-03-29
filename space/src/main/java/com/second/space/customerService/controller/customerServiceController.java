package com.second.space.customerService.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.customerService.model.ContactUsDTO;
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
	
	
	// 로그인 기능구현 시 삭제
	@PostMapping("/login")
	public String communityMainLogin(HttpServletRequest request, Model model) {
		String temp_id = request.getParameter("temp_id");
		String temp_pw = request.getParameter("temp_pw");
		
		HttpSession session = request.getSession();
		session.setAttribute("user_id", temp_id);
		session.setAttribute("user_pw", temp_pw);
		
		System.out.println("아이디: "+session.getAttribute("user_id"));
		System.out.println("비밀번호: "+session.getAttribute("user_pw"));
		return "redirect:/customerService/main";
	}
	// 로그인 기능구현시 삭제
	
	
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
	
	@PostMapping("/contactUs")
	public String contactUsWrite(Model model) {
		System.out.println("문의하기.jsp");
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/customerService/contact_us";
	}
	
	@RequestMapping("/contactUs/process")
	public String contactUsWriteProcess(ContactUsDTO list, Model model, HttpServletRequest request) {
		
		String saveDirection = request.getSession().getServletContext().getRealPath("/resources/upload/c_board");
		System.out.println(saveDirection);
				
		try {
			cs_service.newContactUs(list);
			System.out.println("보냈다");
		} catch (Exception e) {
			System.out.println("안보냈다");
			e.printStackTrace();
		}
		return "redirect:/customerService/main";
	}		
	
	@PostMapping("/contactUsListView")
	public String contactUsListView(ContactUsDTO list, Model model) {
		System.out.println("문의하기post.jsp");
		try {
			model.addAttribute("contact_us_list", cs_service.getContactUsList());
			model.addAttribute("contact_us_count", cs_service.getContactUsCount());
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
			model.addAttribute("contact_us_comments_list", cs_service.getContactUsCommentsList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/customerService/contact_us_list_view";
	}	

	@GetMapping("/contactUsListView")
	public String contactUsListView2(HttpServletRequest request, ContactUsDTO list, Model model) {
		System.out.println("문의하기get.jsp");
		request.setAttribute("val", request.getParameter("val"));
		try {
			model.addAttribute("contact_us_list", cs_service.getContactUsList());
			model.addAttribute("contact_us_count", cs_service.getContactUsCount());
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
			model.addAttribute("contact_us_comments_list", cs_service.getContactUsCommentsList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/customerService/contact_us_list_view";
	}
}
