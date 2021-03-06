package com.second.space.login.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.second.space.admin.model.NoticeDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.login.dto.GoogleLoginDTO;
import com.second.space.login.dto.GoogleOAuthRequest;
import com.second.space.login.dto.GoogleOAuthResponse;
import com.second.space.login.service.loginServiceImpl;
import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class loginContoller {
	
	@Autowired
	loginServiceImpl loginService;
	
	@RequestMapping("/login/getGoogleAuthUrl")
	public @ResponseBody String getGoogleAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = loginService.getGoogleAuthUrl();
	 return reqUrl;
	}
	
	@ResponseBody
	@RequestMapping(value= "/login/oauth_google")
	public ModelAndView google(HttpServletRequest request, @RequestParam(value="code") String authCode, HttpServletResponse response, ModelAndView mav)
	throws JsonProcessingException  {
		 // restTemplate ??????
	    RestTemplate restTemplate = new RestTemplate();
	  
	    
	    GoogleOAuthRequest googleOAuthRequestParam =  GoogleOAuthRequest
			    .builder()
	            .clientId(loginService.getId())
	            .clientSecret(loginService.getSecret())
	            .code(authCode)
	            .redirectUri(loginService.getRedirectURL())
	            .grantType("authorization_code")
	            .build();
	   try{ 
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    HttpEntity<GoogleOAuthRequest> httpRequestEntity = new HttpEntity<>(googleOAuthRequestParam, headers);
	    ResponseEntity<String> apiResponseJson = restTemplate.postForEntity(loginService.getGoogleAuthUrl2()+ "/token", httpRequestEntity, String.class);
	    
	    
	    //   id_token??? jwt ??????
	    // ObjectMapper??? ?????? String to Object??? ??????
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        objectMapper.setSerializationInclusion(Include.NON_NULL); // NULL??? ?????? ?????? ????????????(NULL??? ????????? ??????)
        GoogleOAuthResponse googleLoginResponse = objectMapper.readValue(apiResponseJson.getBody(), new TypeReference<GoogleOAuthResponse>() {});
        
        // ???????????? ????????? JWT Token?????? ???????????? ??????, Id_Token??? ?????? ????????????.
        String jwtToken = googleLoginResponse.getIdToken();
        
        // JWT Token??? ????????? JWT ????????? ????????? ?????? ??????
        String requestUrl = UriComponentsBuilder.fromHttpUrl(loginService.getGoogleAuthUrl2() + "/tokeninfo").queryParam("id_token", jwtToken).toUriString();

        String resultJson = restTemplate.getForObject(requestUrl, String.class);
        
        if(resultJson != null) {
            GoogleLoginDTO userInfoDto = objectMapper.readValue(resultJson, new TypeReference<GoogleLoginDTO>() {});
            
            log.info(userInfoDto.getEmail());
            int user_login_id = loginService.checkId(userInfoDto.getEmail());
            
         
            
            HttpSession session = request.getSession();
        	if(session.getAttribute("userLoggedIn") != null) {
    			session.removeAttribute("userLoggedIn");
    		}
            
            if(user_login_id > 0) {
            	UserDTO user = loginService.selectUser(user_login_id);
            	session.setAttribute("userLoggedIn", user);
				session.setAttribute("loginType", "google");
				session.setAttribute("token", googleLoginResponse.getAccessToken());
				
				List<MainInfoDTO> mainList = loginService.getMainList(user.getUser_address());
				
				//????????????
				List<NoticeDTO> noticeList = loginService.getNoticeList();
				//????????????
				List<CommunityBoardDTO> communityList = loginService.getCommunityList(user.getUser_address());
				
				session.setAttribute("mainList", mainList);
				session.setAttribute("noticeList", noticeList);
				session.setAttribute("communityList", communityList);
				
				
				
	            mav.setViewName("common/loc");
	            mav.addObject("loc", "/login/google");
            }else {
            	//?????? ?????????
            	Map<String, String> result = new HashMap<>();
        		RestTemplate restTemplate2 = new RestTemplate();
        		final String requestUrl2 = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/revoke")
        				.queryParam("token", googleLoginResponse.getAccessToken()).encode().toUriString();
            	
        		String resultJson2 = restTemplate.postForObject(requestUrl2, null, String.class);
        		
	            mav.addObject("email", userInfoDto.getEmail());
	            mav.addObject("name", userInfoDto.getFamilyName() + userInfoDto.getGivenName());
	            mav.setViewName("user_/googleJoin");
	            return mav;
            }
        }
        else {
        	 mav.addObject("msg", "???????????????");
             mav.setViewName("common/msg");
             mav.addObject("loc", "/");
            throw new Exception("Google OAuth failed!");
          
        }
    }
    catch (Exception e) {
        e.printStackTrace();
    }

		return mav;
	}
	
	@RequestMapping("/login/googleFinish")
	public ModelAndView googleFinish(UserDTO user, LoginIdListDTO loginList, ModelAndView mav) {
		log.info(user);
		log.info(loginList);
		loginList.setUser_login_type("google");
		int result = loginService.insertGoogleUser(user, loginList);
		if(result > 0) {
			 mav.addObject("msg", "??????????????????");
             mav.setViewName("common/msg");
             mav.addObject("loc", "/user_/login");
		}else {
			mav.addObject("msg", "??????????????????");
            mav.setViewName("common/msg");
            mav.addObject("loc", "/user_/join");
		}
		
		return mav;
		
	}
	
	@RequestMapping("/login/google")
	public String loginGoogle(Model model , HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String token = (String)session.getAttribute("token");
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
		session.removeAttribute("token");
		
		List<MainInfoDTO> mainList = loginService.getMainList(user.getUser_address());
		
		//????????????
		List<NoticeDTO> noticeList = loginService.getNoticeList();
		//????????????
		List<CommunityBoardDTO> communityList = loginService.getCommunityList(user.getUser_address());
		
		model.addAttribute("token", token);
		model.addAttribute("mainList", mainList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("communityList", communityList);
		
		return "main/space";
	}
	
	
}
