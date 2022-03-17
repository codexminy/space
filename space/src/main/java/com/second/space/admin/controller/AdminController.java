package com.second.space.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.admin.service.AdminService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/home")
	public void homePage(Model model) {
		List<String> list = new ArrayList<>();
		list.add("신고접수");
		list.add("통계");
		list.add("광고");
		list.add("배너관리");
		list.add("공지사항");
		
		try {
			model.addAttribute("list", list);
			model.addAttribute("banner", service.getNotificationAdList());
			model.addAttribute("admin", service.getNoticeAdminList());
			model.addAttribute("all", service.getAllNotificationCount());
			model.addAttribute("board", service.getNotificationBoardCount());
			model.addAttribute("cmt", service.getNotificationCmtCount());
			model.addAttribute("review", service.getNotificationReviewCount());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/notification")
	public void notificatonPage(Model model) {
		List<String> list = new ArrayList<>();
		list.add("회원 신고 관리");
		list.add("게시글 신고 관리");
		list.add("댓글 신고 관리");
		list.add("리뷰 신고 관리");
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/banner")
	public void bannerPage(Model model, PageSet ps) throws Exception {
		List<String> list = new ArrayList<>();
		list.add("목록");
		list.add("신규 등록");
		list.add("마감");
		
		model.addAttribute("ps", ps);
		model.addAttribute("pageList", service.getAllNotificationAdList(ps));
		model.addAttribute("paging", new Paging(service.getNotificationAdTotal(), ps));
		model.addAttribute("list", list);
	}
	
	@GetMapping("/list")
	public void bannerListPage(Model model, int na_id, PageSet ps) throws Exception {
		List<String> list = new ArrayList<>();
		list.add("목록");
		list.add("신규 등록");
		list.add("마감");
		
		model.addAttribute("list", list);
		model.addAttribute("na_id", na_id);
		model.addAttribute("ps", ps);
		model.addAttribute("banner", service.getNotificationAdDetailList(na_id));
	}
	
	@GetMapping("/update")
	public void updatePage(Model model, int na_id, PageSet ps) throws Exception {
		List<String> list = new ArrayList<>();
		list.add("목록");
		list.add("신규 등록");
		list.add("마감");
		
		model.addAttribute("list", list);
		model.addAttribute("banner", service.getNotificationAdDetailList(na_id));
	}
	
	@PostMapping("/update")
	public String updateUpload(@RequestParam("multiFile") List<MultipartFile> multiFileList, Model model, HttpServletRequest re, RedirectAttributes redirect) throws Exception {
		String path = "C:\\javaWeb\\repository\\space\\space\\src\\main\\webapp\\resources";
		String root = path + "\\images\\notification_ad";
		
		File fileCheck = new File(path);
		
		if(!fileCheck.exists()) {
			fileCheck.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(MultipartFile mf : multiFileList) {
			String originFile = mf.getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}

		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				service.insertNotificationAd("images/notification_ad/" + fileList.get(i).get("changeFile"));
			}
			
			redirect.addFlashAttribute("updateResult", "Y");
		} catch (IllegalStateException | IOException e) {
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			
			e.printStackTrace();
		}
		
		return "redirect:banner";
	}
}







