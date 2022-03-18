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

@Controller
public class AdminController {
	
	private static String[] home = {"신고접수", "통계", "광고", "배너관리", "공지사항"};
	private static String[] notification = {"회원 신고 관리", "게시글 신고 관리", "댓글 신고 관리", "리뷰 신고 관리"};
	private static String[] banner = {"목록", "신규 등록", "마감"};
	private static String[] notice = {"목록", "신규 등록"};
	
	@Autowired
	AdminService service;
	
	@GetMapping("/admin/home")
	public void homePage(Model model) {
		try {
			model.addAttribute("list", home);
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
	
	@GetMapping("/admin/notification/main")
	public void notificatonPage(Model model) {
		model.addAttribute("list", notification);
	}
	
	@GetMapping("/admin/banner/main")
	public void bannerPage(Model model, PageSet ps) throws Exception {
		model.addAttribute("ps", ps);
		model.addAttribute("pageList", service.getAllNotificationAdList(ps));
		model.addAttribute("paging", new Paging(service.getNotificationAdTotal(), ps));
		model.addAttribute("list", banner);
	}
	
	@GetMapping("/admin/banner/detail")
	public void bannerListPage(Model model, int na_id, PageSet ps) throws Exception {
		model.addAttribute("list", banner);
		model.addAttribute("na_id", na_id);
		model.addAttribute("ps", ps);
		model.addAttribute("banner", service.getNotificationAdDetailList(na_id));
	}
	
	@GetMapping("/admin/banner/update")
	public void updatePage(Model model, int na_id, PageSet ps) throws Exception {
		model.addAttribute("list", banner);
		model.addAttribute("banner", service.getNotificationAdDetailList(na_id));
	}
	
	@PostMapping("/admin/banner/insert")
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
		
		return "redirect:/admin/banner/main";
	}
	
	@GetMapping("/admin/banner/insert")
	public void insertPage(Model model) {
		model.addAttribute("list", banner);
	}
	
	@GetMapping("/admin/notice/main")
	public void noticePage(Model model, PageSet ps) throws Exception {
		model.addAttribute("list", notice);
		model.addAttribute("pageList", service.getAllNoticeList(ps));
		model.addAttribute("paging", new Paging(service.getNoticeTotal(ps), ps));
	}
	
	@GetMapping("/admin/notice/detail")
	public void noticeListPage(Model model, int notice_id, PageSet ps) throws Exception {
		model.addAttribute("list", notice);
		model.addAttribute("ps", ps);
		model.addAttribute("notice", service.getNotice(notice_id));
	}
	
	@GetMapping("/admin/notice/update")
	public void noticeUpdatePage(Model model, int notice_id, PageSet ps) throws Exception {
		model.addAttribute("list", notice);
		model.addAttribute("ps", ps);
		model.addAttribute("notice", service.getNotice(notice_id));
	}
	
	@GetMapping("/admin/notice/insert")
	public void noticeInsertPage(Model model) throws Exception {
		model.addAttribute("list", notice);
	}
}







