package com.second.space.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.second.space.admin.model.NoticeDTO;
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
	public ResponseEntity<Notification_adDTO> createBanner(Notification_adDTO dto, HttpServletRequest request) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("");
		String root = path + "resources/images/notification_ad";
		
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
	
	@GetMapping(value = "/admin/page/user/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> userList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllUserList(ps));
		result.put("paging", new Paging(service.getUserTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/user/withdrawalList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> userwithdrawalList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllWithdrawalList(ps));
		result.put("paging", new Paging(service.getWithdrawalTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/board/sale", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> saleList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllSaleList(ps));
		result.put("paging", new Paging(service.getSaleTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/board/community", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> communityList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllCommunityList(ps));
		result.put("paging", new Paging(service.getCommunityTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/admin/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> adminList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllNoticeAdminList(ps));
		result.put("paging", new Paging(service.getNoticeAdminTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/enquiry/contactUs", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> contactUsList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllContactUsList(ps));
		result.put("paging", new Paging(service.getContactUsTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request)  {
		HashMap<String, Object> result = new HashMap<>();
		
		String contextRoot = request.getSession().getServletContext().getRealPath("");
		String fileRoot = contextRoot + "resources/images/notice/";
		String originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자
		String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
			result.put("url", "/space/resources/images/notice/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
			result.put("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
			result.put("responseCode", "error");
			e.printStackTrace();
		}
		
		JSONObject jsonObject = new JSONObject(result);
		
		return jsonObject.toJSONString();
	}
	
	@PostMapping(value = "/admin/page/notice/create", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NoticeDTO> insertNotice(@RequestBody NoticeDTO dto) throws Exception {
		
		service.insertNotice(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@GetMapping(value = "/admin/page/stats/stats", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> monthlyUser() throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("monthNew", service.getMonthlyNewUser());
		result.put("monthWd", service.getMonthlyWithdrawalUser());
		result.put("dailyVisit", service.getDailyVisit());
		
		return ResponseEntity.ok(result);
	}
}







