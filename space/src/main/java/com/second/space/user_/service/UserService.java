package com.second.space.user_.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;

public interface UserService {

	int userableId(String userId) throws Exception;

	List<BoardDTO> getBoardList(String user_address) throws Exception;

	int chkNickName(String nickName) throws Exception;

	int insertUser(UserDTO user, LoginIdListDTO loginList) throws Exception;

	Integer chkLoginId(String login_id) throws Exception;

	UserDTO chkLoginPwd(int user_login_id) throws Exception;

	List<BoardImgDTO> getImgList(String user_address) throws Exception;

	UserDTO login(String login_id) throws Exception;

	int keepLogin(int user_login_id, String sessionId, Date sessionLimit) throws Exception;

	UserDTO checkUserWithSessionKey(String sessionId);

	List<MainInfoDTO> getMainList(String user_address);

	List<NoticeDTO> getNoticeList();

	List<CommunityBoardDTO> getCommunityList(String user_address);

}
