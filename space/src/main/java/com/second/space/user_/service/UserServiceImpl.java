package com.second.space.user_.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.BoardLikeDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.mapper.UserXMLMapper;
import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserXMLMapper userMapper;
	
	@Override
	public int userableId(String userId) {
		log.info(userId);
		String result = userMapper.userableId(userId);
		log.info(result + "0");
		if(result != null) {
			return 0;
		}else {
			log.info(result + "1");
			return 1;
		}
		
		
	}
	
	@Override
	public int insertUser(UserDTO user, LoginIdListDTO loginList) {
		
		loginList.setUser_login_type("general");
		int loginInsert = userMapper.insertLoginId(loginList);
		int result = 0;
		
		
		if(loginInsert > 0) {
			String login_id = loginList.getLogin_id();
			int user_login_id = userMapper.getUserLoginId(login_id);
			
			if(user_login_id != 0) {
				//3. user �씤�꽌�듃 
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
				result = userMapper.insertUser(user);
			}
		}

		return result;
	}

	@Override
	public int chkNickName(String nickName) {
		return userMapper.chkNickName(nickName);
	}
	
	@Override
	public Integer chkLoginId(String login_id) {
		if(userMapper.chkLoginId(login_id) == null) {
			return 0;
		}
		return userMapper.chkLoginId(login_id);
	}
	
	@Override
	public UserDTO chkLoginPwd(int user_login_id) {
		return  userMapper.chkLoginPwd(user_login_id);
	}
	
	@Override
	public List<BoardDTO> getBoardList(String user_address) {
		return userMapper.getBoardList(user_address);
	}
	
	@Override
	public List<BoardImgDTO> getImgList(String user_address) {
		return userMapper.getImgList(user_address);
	}
	
	@Override
	public UserDTO login(String login_id) {
		return null;
	}
	
	@Override
	public int keepLogin(int user_login_id, String sessionId, Date sessionLimit) {
		return userMapper.keepLogin(user_login_id, sessionId, sessionLimit);
	}
	
	@Override
	public UserDTO checkUserWithSessionKey(String sessionId) {
		return userMapper.checkUserWithSessionKey(sessionId);
	}
	
	@Override
	public List<MainInfoDTO> getMainList(String user_address) {
		return userMapper.getMainList(user_address);
	}
	
	@Override
	public List<NoticeDTO> getNoticeList() {
		return userMapper.getNoticeList();
	}
	
	@Override
	public List<CommunityBoardDTO> getCommunityList(String user_address) {
		return userMapper.getCommunityList(user_address);
	}

	public List<MainInfoDTO> getMain() {
		return userMapper.getMain();
	}

	public List<CommunityBoardDTO> getCommunity() {
		return userMapper.getCommunity();
	}
	
	public List<BoardLikeDTO> getBoardLikeList(Integer user_id) {
		return userMapper.getBoardLikeList(user_id);
	}

	@Override
	public List<Notification_adDTO> getNotificationAdList() {
		return userMapper.getNotificationAdList();
	}
}
