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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.second.space.admin.model.A_boardDTO;
import com.second.space.admin.model.DeleteCheckDTO;
import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notice_adminDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.admin.model.NotifyDTO;
import com.second.space.admin.model.PageSet;
import com.second.space.admin.model.Paging;
import com.second.space.admin.model.UserDTO;
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
	
	@GetMapping(value = "/admin/notify/notify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> notifyBoard(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("list", service.getBoardNotifyList(ps));
		result.put("paging", new Paging(service.getBoardNotifyCount(ps), ps));
		
		return ResponseEntity.ok(result);
		
	}
	
	@PutMapping(value = "/admin/notify/notify/{kind}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NotifyDTO> updateNotifyBoard(@PathVariable String kind, @RequestBody NotifyDTO dto) throws Exception {
		
		if(kind.equals("board-cancel")) {
			service.updateBoardDelete(dto);
			service.updateCancelReported(dto);
		} else if(kind.equals("community-board-cancel")) {
			service.updateCommunityBoardDelete(dto);
			service.updateCancelReported(dto);
		} else if(kind.equals("board")) {
			service.updateBoardDelete(dto);
			service.updateReported(dto);
		} else if(kind.equals("community-board")) {
			service.updateCommunityBoardDelete(dto);
			service.updateReported(dto);
		}
		
		// 반려 혹은 반려 취소 요청일 경우 이것만 실행
		service.updateBoardHandling(dto);
		
		return ResponseEntity.ok(dto);
	}

	@GetMapping(value = "/admin/notify/notify/cmt", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> notifyCmt(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("list", service.getCmtNotifyList(ps));
		result.put("paging", new Paging(service.getCmtNotifyCount(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@PutMapping(value = "/admin/notify/notify/cmt/{kind}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NotifyDTO> updateNotifyCmt(@PathVariable String kind, @RequestBody NotifyDTO dto) throws Exception {
		
		if(kind.equals("cmt-cancel")) {
			service.updateCmtDelete(dto);
			service.updateCancelReported(dto);
		} else if(kind.equals("cmt")) {
			service.updateCmtDelete(dto);
			service.updateReported(dto);
		}
		
		// 반려 혹은 반려 취소 요청일 경우 이것만 실행
		service.updateCmtHandling(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@GetMapping(value = "/admin/notify/notify/review", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> notifyReview(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("list", service.getReviewNotifyList(ps));
		result.put("paging", new Paging(service.getReviewNotifyCount(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@PutMapping(value = "/admin/notify/notify/review/{kind}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NotifyDTO> updateNotifyReview(@PathVariable String kind, @RequestBody NotifyDTO dto) throws Exception {
		
		if(kind.equals("review-cancel")) {
			service.updateReviewDelete(dto);
			service.updateCancelReported(dto);
		} else if(kind.equals("review")) {
			service.updateReviewDelete(dto);
			service.updateReported(dto);
		}
		
		// 반려 혹은 반려 취소 요청일 경우 이것만 실행
		service.updateReviewHandling(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@GetMapping(value = "/admin/banner/banner", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> bannerList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllNotificationAdList(ps));
		result.put("paging", new Paging(service.getNotificationAdTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping(value = "/admin/banner/banner")
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
	
	@GetMapping(value = "/admin/banner/banner/{na_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> detailBanner(@PathVariable int na_id) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getNotificationAdDetail(na_id));
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping(value = "/admin/banner/banner/{na_id}")
	public ResponseEntity<Notification_adDTO> updateBanner(@PathVariable int na_id, Notification_adDTO dto, HttpServletRequest request) throws Exception {
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
				service.updateBanner(dto);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			service.updateBanner(dto);
		}

		return ResponseEntity.ok(dto);
	}
	
	@DeleteMapping(value = "/admin/banner/banner/{na_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public int deleteBanner(@PathVariable int na_id) throws Exception {
		return service.deleteBanner(na_id);
	}
	
	@GetMapping(value = "/admin/banner/banner/endDate", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> bannerEndDateList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllBannerEndDateList(ps));
		result.put("paging", new Paging(service.getBannerEndDateTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping(value = "/admin/notice/notice", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> noticeList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("list", service.getAllNoticeList(ps));
		result.put("paging", new Paging(service.getNoticeTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/notice/notice/{notice_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> detailNotice(@PathVariable int notice_id) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getNoticeDetail(notice_id));
		
		return ResponseEntity.ok(result);
	}
	
	@PutMapping(value = "/admin/notice/notice/{notice_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NoticeDTO> updateNotice(@PathVariable int notice_id, @RequestBody NoticeDTO dto) throws Exception {

		service.updateNotice(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@DeleteMapping(value = "/admin/notice/notice/{notice_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> deleteNotice(@PathVariable int notice_id) throws Exception {
		return ResponseEntity.ok(service.deleteNotice(notice_id));
	}
	
	@GetMapping(value = "/admin/user/user/user", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> userList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllUserList(ps));
		result.put("paging", new Paging(service.getUserTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/user/user/withdrawal", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> userwithdrawalList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllWithdrawalList(ps));
		result.put("paging", new Paging(service.getWithdrawalTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/board/board/sale", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> saleList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllSaleList(ps));
		result.put("paging", new Paging(service.getSaleTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@PutMapping(value = "/admin/board/board/{board_hidden}/{board_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<A_boardDTO> updateHidden(@PathVariable String board_hidden, @PathVariable int board_id) throws Exception {
		A_boardDTO dto = new A_boardDTO();
		
		dto.setBoard_id(board_id);
		dto.setBoard_hidden(board_hidden);
		
		service.updateHidden(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@GetMapping(value = "/admin/board/board/community", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> communityList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllCommunityList(ps));
		result.put("paging", new Paging(service.getCommunityTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/admin/admin", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> adminList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllNoticeAdminList(ps));
		result.put("paging", new Paging(service.getNoticeAdminTotal(), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/admin/admin/{notice_admin_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> adminList(@PathVariable int notice_admin_id) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getNoticeAdmin(notice_admin_id));
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping(value = "/admin/admin/admin", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Notice_adminDTO> insertAdmin(@RequestBody Notice_adminDTO dto) throws Exception {

		service.insertNoticeAdmin(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@PutMapping(value = "/admin/admin/admin/{notice_admin_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> updateAdmin(@RequestBody Notice_adminDTO dto) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.updateNoticeAdmin(dto));
		
		return ResponseEntity.ok(result);
	}
	
	@DeleteMapping(value = "/admin/admin/admin/{notice_admin_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> deleteAdmin(@PathVariable int notice_admin_id) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.deleteNoticeAdmin(notice_admin_id));
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/enquiry/enquiry/contactUs", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> contactUsList(PageSet ps) throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("list", service.getAllContactUsList(ps));
		result.put("paging", new Paging(service.getContactUsTotal(ps), ps));
		
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile/{kind}", produces = "application/json; charset=utf8")
	public String uploadSummernoteImageFile(@PathVariable String kind, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request)  {
		HashMap<String, Object> result = new HashMap<>();
		
		String path = "/space/";
		String contextRoot = request.getSession().getServletContext().getRealPath("");
		String fileRoot = "";
		String root = "";
		
		if(kind.equals("board")) {
			root = "resources/images/board/";
		} else if(kind.equals("contact-us")) {
			root = "resources/images/contact_us/";
		} else if(kind.equals("main")) {
			root = "resources/images/main/";
		} else if(kind.equals("my-space")) {
			root = "resources/images/mySpace/";
		} else if(kind.equals("notice")) {
			root = "resources/images/notice/";
		} else if(kind.equals("notice-admin")) {
			root = "resources/images/notice_admin/";
		} else if(kind.equals("notification-ad")) {
			root = "resources/images/notification_ad/";
		} else if(kind.equals("notification-popup")) {
			root = "resources/images/notification_popup/";
		} else if(kind.equals("profile")) {
			root = "resources/images/profile/";
		} else if(kind.equals("review")) {
			root = "resources/images/review/";
		} else if(kind.equals("user")) {
			root = "resources/images/user_/";
		}
		
		fileRoot = contextRoot + root;

		String originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자
		String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
			result.put("url", path + root + savedFileName);
			//result.put("url", "/space/resources/images/notice/" + savedFileName);
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
			e.printStackTrace();
		}
		
		JSONObject jsonObject = new JSONObject(result);

		return jsonObject.toJSONString();
	}
	
	@PostMapping(value = "/admin/notice/notice", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NoticeDTO> insertNotice(@RequestBody NoticeDTO dto) throws Exception {
		
		service.insertNotice(dto);
		
		return ResponseEntity.ok(dto);
	}
	
	@GetMapping(value = "/admin/page/stats/stats", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> monthlyUser() throws Exception {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("dayL", service.getDailyLabel());
		result.put("dayN", service.getDailyNewUser());
		result.put("dayW", service.getDailyWithdrawalUser());
		result.put("dayV", service.getDailyVisit());
		result.put("weekL", service.getWeeklyLabel());
		result.put("weekN", service.getWeeklyNewUser());
		result.put("weekW", service.getWeeklyWithdrawalUser());
		result.put("weekV", service.getWeeklyVisit());
		result.put("monthL", service.getMonthlyLabel());
		result.put("monthN", service.getMonthlyNewUser());
		result.put("monthW", service.getMonthlyWithdrawalUser());
		result.put("monthV", service.getMonthlyVisit());
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/stats/board", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> statsBoardUser() throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("dayL", service.getDailyLabel());
		result.put("sDayN", service.getDailySaleList());
		result.put("cDayN", service.getDailyCommunityList());
		result.put("weekL", service.getWeeklyLabel());
		result.put("sWeekN", service.getWeeklySaleList());
		result.put("cWeekN", service.getWeeklyCommunityList());
		result.put("monthL", service.getMonthlyLabel());
		result.put("sMonthW", service.getMonthlySaleList());
		result.put("cMonthV", service.getMonthlyCommunityList());
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping(value = "/admin/page/stats/notification", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<HashMap<String, Object>> statsNotificationUser() throws Exception {
		HashMap<String, Object> result = new HashMap<>();

		result.put("dayL", service.getDailyLabel());
		result.put("bDayN", service.getDailyBoardNotifyList());
		result.put("cDayN", service.getDailyCmtNotifyList());
		result.put("rDayN", service.getDailyReviewNotifyList());
		result.put("weekL", service.getWeeklyLabel());
		result.put("bWeekN", service.getWeeklyBoardNotifyList());
		result.put("cWeekN", service.getWeeklyCmtNotifyList());
		result.put("rWeekN", service.getWeeklyReviewNotifyList());
		result.put("monthL", service.getMonthlyLabel());
		result.put("bMonthN", service.getMonthlyBoardNotifyList());
		result.put("cMonthN", service.getMonthlyCmtNotifyList());
		result.put("rMonthN", service.getMonthlyReviewNotifyList());
		
		return ResponseEntity.ok(result);
	}
	
	@DeleteMapping(value = "/admin/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<DeleteCheckDTO> deleteCheck(@RequestBody DeleteCheckDTO dto) throws Exception {
		int[] arr = dto.getIdArr();
		
		for(int i=0; i<arr.length; ++i) {
			dto.setId(arr[i]);
			service.deleteCheck(dto);
		}
		
		return ResponseEntity.ok(dto);
	}
}












