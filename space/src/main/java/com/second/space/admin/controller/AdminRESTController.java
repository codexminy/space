package com.second.space.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
//	@PostMapping(value = "/notice.do", produces = MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<NoticeDTO> noticeInsert(NoticeDTO dto) {
//		String path = "C:\\javaWeb\\repository\\space\\space\\src\\main\\webapp\\resources";
//		String root = path + "\\images\\notice";
//		
//		File fileCheck = new File(path);
//		
//		if(!fileCheck.exists()) {
//			fileCheck.mkdirs();
//		}
//		
//		List<Map<String, String>> fileList = new ArrayList<>();
//		List<MultipartFile> multiFileList = dto.getUploadFile();
//		
//		if (multiFileList != null && !multiFileList.isEmpty()) {
//			for(MultipartFile mf : multiFileList) {
//				String originFile = mf.getOriginalFilename();
//				String ext = originFile.substring(originFile.lastIndexOf("."));
//				String changeFile = UUID.randomUUID().toString() + ext;
//				
//				Map<String, String> map = new HashMap<>();
//				map.put("originFile", originFile);
//				map.put("changeFile", changeFile);
//				
//				fileList.add(map);
//			}
//			
//			try {
//				for(int i = 0; i < multiFileList.size(); i++) {
//					File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
//					dto.setNotice_img("images/notice/" + fileList.get(i).get("changeFile"));
//					multiFileList.get(i).transferTo(uploadFile);
//					service.insertNotice(dto);
//				}
//			} catch (IllegalStateException | IOException e) {
//				for(int i = 0; i < multiFileList.size(); i++) {
//					new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
//				}
//				e.printStackTrace();
//			}
//		} else {
//			service.insertNotice(dto);
//		}
//
//		
//		return ResponseEntity.ok(dto);
//	}
	
}
