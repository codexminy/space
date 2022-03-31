package com.second.space.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.login.dto.GoogleOAuthRequest;
import com.second.space.mapper.UserXMLMapper;
import com.second.space.message.service.SmsService;
import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;

@PropertySource("classpath:google.properties")
@Log4j
@Transactional
@Service
public class loginServiceImpl implements loginService{
	
	@Autowired
	private UserXMLMapper userMapper;
	
	 @Value("${google.auth.url}") private String googleAuthUrl;
	 @Value("${google.login.url}") private String googleLoginUrl;
	 @Value("${google.redirect.url}") private String googleRedirectUrl;
	 @Value("${google.client.id}") private String googleClientId;
	 @Value("${google.secret}") private String secret;

	public String getGoogleAuthUrl() {
		return googleLoginUrl + "/o/oauth2/v2/auth?client_id=" + googleClientId + "&redirect_uri=" + googleRedirectUrl + 
				"&response_type=code&scope=email%20profile%20openid&access_type=offline";
	}

	public GoogleOAuthRequest getOAuthRequest(String authCode) {
		GoogleOAuthRequest request = GoogleOAuthRequest
			    .builder()
	            .clientId(googleClientId)
	            .clientSecret(secret)
	            .code(authCode)
	            .redirectUri(googleRedirectUrl)
	            .grantType("authorization_code")
	            .build();

		return request;
	}

	public String getGoogleAuthUrl2() {
		return googleAuthUrl;
	}

	public String getId() {
		return googleClientId;
	}

	public String getSecret() {
		return secret;
	}

	public String getRedirectURL() {
		return googleRedirectUrl;
	}
	
	@Override
	public int insertGoogleUser(UserDTO user, LoginIdListDTO loginList) {
		int loginInsert = userMapper.insertLoginId(loginList);
		int result = 0;
		
		
		if(loginInsert > 0) {
			String login_id = loginList.getLogin_id();
			int user_login_id = userMapper.getUserLoginId(login_id);
			
			if(user_login_id != 0) {
				user.setUser_login_id(user_login_id);
				user.setUser_admin("N");
				user.setUser_ban("N");
				user.setUser_followed(0);
				user.setUser_following(0);
				user.setUser_public_profile("N");
				user.setUser_delete("N");
				user.setUser_reported(0);
				user.setUser_check_email("N");
				String[] adr = user.getUser_address().split(" ");
				user.setUser_address(adr[0] + " " + adr[1]);
				log.info(user);
				result = userMapper.insertGoogleUser(user);
			}
		}

		return result;
	}

	public int checkId(String login_id) {
		return  userMapper.chkLoginId(login_id) == null? 0 : userMapper.chkLoginId(login_id);
	}

	public UserDTO selectUser(int user_login_id) {
		return userMapper.selectUser(user_login_id);
	}

	public List<MainInfoDTO> getMainList(String user_address) {
		return userMapper.getMainList(user_address);
	}

	public List<NoticeDTO> getNoticeList() {
		return userMapper.getNoticeList();
	}

	public List<CommunityBoardDTO> getCommunityList(String user_address) {
		return userMapper.getCommunityList(user_address);
	}
	

	



}
