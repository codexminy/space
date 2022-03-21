package com.second.space.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.admin.service.AdminService;

@RestController
public class AdminRESTController {
	
	@Autowired
	AdminService service;

	@GetMapping(value = "/admin/page/home", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> home() throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("notify", service.getNotificationCount());
		result.put("stats", service.getStatsCount());
		result.put("banner", service.getNotificationAdList());
		result.put("admin", service.getNoticeAdminList());
		
		return ResponseEntity.ok(result);
		
	}
	
	@GetMapping(value = "/admin/page/notification", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> board() throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		return ResponseEntity.ok(result);
		
	}
	
	@RequestMapping(value = "/admin/page/banner/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> bannerList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllNotificationAdList(ps));
		result.put("paging", new Paging(service.getNotificationAdTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping(value = "/admin/page/banner/create")
	public ResponseEntity<Notification_adDTO> createBanner(Notification_adDTO dto) throws Exception {
		String path = "C:\\javaWeb\\repository\\space\\space\\src\\main\\webapp\\resources";
		String root = path + "\\images\\notification_ad";
		
		File fileCheck = new File(path);
		
		if(!fileCheck.exists()) {
			fileCheck.mkdirs();
		}

		MultipartFile multiFile = dto.getUploadFile();

		if (multiFile != null && !multiFile.isEmpty()) {
			String originFile = multiFile.getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			
			try {
				File uploadFile = new File(root + "\\" + changeFile);
				dto.setNa_img("images/notification_ad/" + changeFile);
				multiFile.transferTo(uploadFile);
				service.createNotificationAd(dto);
			} catch (IllegalStateException | IOException e) {
				new File(root + "\\" + changeFile).delete();
				e.printStackTrace();
			}
		}

		return ResponseEntity.ok(dto);
	}
	
	@GetMapping(value = "/admin/page/banner/detail", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> detailBanner(int na_id) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getNotificationAdDetail(na_id));
		
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping(value = "/admin/page/notice/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> noticeList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("list", service.getAllNoticeList(ps));
		result.put("paging", new Paging(service.getNoticeTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/notice/detail", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> detailNotice(int notice_id) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getNoticeDetail(notice_id));
		
		return ResponseEntity.ok(result);
	}
}







