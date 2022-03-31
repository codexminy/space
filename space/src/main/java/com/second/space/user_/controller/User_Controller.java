package com.second.space.user_.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.second.space.admin.model.NoticeDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.user_.model.LoginDTO;
import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.LoginInfoDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;
import com.second.space.user_.service.UserServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/user_")
@Controller
public class User_Controller {
	
	@Autowired
	UserServiceImpl userService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/login")
	public String login() {
		return "user_/login";
	}
	
	@PostMapping("/login")
	public String login(LoginInfoDTO login, HttpServletResponse response, HttpServletRequest request, Model model) {
		//http://www.joshi.co.kr/index.php?mid=SPRING&document_srl=305769
		String user_password = login.getUser_password();
		String login_id = login.getLogin_id();
		String autoLogin = login.getAutoLogin();
		String returnURL = "";
		HttpSession session = request.getSession();
		
		LoginDTO loginDTO = new LoginDTO();
		
		if(session.getAttribute("userLoggedIn") != null) {
			session.removeAttribute("userLoggedIn");
		}
		
		Integer user_login_id = userService.chkLoginId(login_id);
		
		if(user_login_id > 0) {
			UserDTO user = userService.chkLoginPwd(user_login_id);
			
			if(bcryptPasswordEncoder.matches(user_password, user.getUser_password())) {
				log.info(user);
				session.setAttribute("userLoggedIn", user);
				session.setAttribute("loginType", "general");
				session.setAttribute("user_login_id", user_login_id);
				
				List<MainInfoDTO> mainList = userService.getMainList(user.getUser_address());
				
				//공지사항
				List<NoticeDTO> noticeList = userService.getNoticeList();
				//커뮤니티
				List<CommunityBoardDTO> communityList = userService.getCommunityList(user.getUser_address());
				
				model.addAttribute("mainList", mainList);
				model.addAttribute("noticeList", noticeList);
				model.addAttribute("communityList", communityList);
				
				
				//자동로그인
				if(autoLogin != null) {
					if(autoLogin.equals("yes")) {
						loginDTO.setUseCookie(true);
						
						if(loginDTO.isUseCookie()) {
							Cookie cookie =  new Cookie("loginCookie", session.getId());
							cookie.setPath("/");
							int amount = 60*60*24*7;
							cookie.setMaxAge(amount);
							response.addCookie(cookie);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
							String sessionId = session.getId();
							userService.keepLogin(user_login_id, sessionId , sessionLimit);
							returnURL = "redirect:/main/space";
						}
						
					}
				}else {
					loginDTO.setUseCookie(false);
					returnURL = "redirect:/main/space";
				}
				
				
			}else {
				returnURL = "redirect/user_/login";
			}
		}else {
			returnURL = "redirect/user_/login";
		}

		return returnURL;
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Object obj = session.getAttribute("userLoggedIn");
		if(obj != null) {
			UserDTO user = (UserDTO)obj;
			session.removeAttribute("userLoggedIn");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				
				Date date = new Date(System.currentTimeMillis());
				
				userService.keepLogin(user.getUser_login_id(), session.getId(), date);
			}
		}
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
	@PostMapping("/info")
	public void info() {
		
	}
	
	@ResponseBody
	@PutMapping("/info")
	public Integer putId(@RequestBody Map<String, String> id) {
		
		log.info(id.get("id"));
		String userId = id.get("id");
		int userableId  = userService.userableId(userId); 
		log.info(userableId);
		return userableId;
	}
	
	@PostMapping("/joinAgree")
	public void joinAgree() {
		
	}
	
	@PostMapping("/joinFinish")
	public ModelAndView joinFinish(UserDTO user ,  LoginIdListDTO loginList, ModelAndView mav) {
		log.info(user);
		log.info(loginList);
		String temp = user.getUser_password();
		user.setUser_password(bcryptPasswordEncoder.encode(temp));
		int result = userService.insertUser(user, loginList);
		
		if(result > 0) {
			mav.addObject("loc", "/user_/login");
			mav.addObject("msg", "회원가입 성공");
			mav.setViewName("common/msg");
			return mav;
		}else {
			mav.addObject("loc", "/user_/join");
			mav.addObject("msg", "회원가입 실패");
			mav.setViewName("common/msg");
			return mav;
		}
		
		
	}
	
	@ResponseBody
	@PostMapping("/nickname")
	public Integer chkNickName(@RequestBody Map<String, String> nickname) {
		String nickName = nickname.get("nickname");
		log.info(nickName);
		int result = userService.chkNickName(nickName);
		return result;
	}
	
	@RequestMapping("/googleLogout")
	public ModelAndView revokeToken(@RequestParam(value = "token") String token, HttpSession session, ModelAndView mav) throws JsonProcessingException {
		Map<String, String> result = new HashMap<>();
		RestTemplate restTemplate = new RestTemplate();
		final String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/revoke")
				.queryParam("token", token).encode().toUriString();
		
		System.out.println("TOKEN ? " + token);
		
		String resultJson = restTemplate.postForObject(requestUrl, null, String.class);
	
		Object obj = session.getAttribute("userLoggedIn");
		if(obj != null) {
			UserDTO user = (UserDTO)obj;
			session.removeAttribute("userLoggedIn");
			session.invalidate();
		}
		mav.addObject("loc", "/main/space");
		mav.setViewName("common/loc");
		
		
		return mav;
	}

}
