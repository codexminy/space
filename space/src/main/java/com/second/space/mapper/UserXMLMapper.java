package com.second.space.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.second.space.admin.model.NoticeDTO;
import com.second.space.admin.model.Notification_adDTO;
import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.board.model.BoardLikeDTO;
import com.second.space.chatting.model.ChatContentDTO;
import com.second.space.chatting.model.ChatRoomDTO;
import com.second.space.community.model.CommunityBoardDTO;
import com.second.space.user_.model.LoginIdListDTO;
import com.second.space.user_.model.MainInfoDTO;
import com.second.space.user_.model.UserDTO;

public interface UserXMLMapper {

	String userableId(String userId);

	int insertLoginId(LoginIdListDTO loginList);

	int getUserLoginId(String login_id);

	int insertUser(UserDTO user);

	int chkNickName(String nickName);

	Integer chkLoginId(String login_id);

	UserDTO chkLoginPwd(int user_login_id);

	List<BoardDTO> getBoardList(String user_address);

	List<BoardImgDTO> getImgList(String user_address);

	int keepLogin(@Param("user_login_id") int user_login_id, @Param("sessionId") String sessionId, @Param("sessionLimit") Date sessionLimit);
	
	UserDTO checkUserWithSessionKey(String sessionId);

	int insertGoogleUser(UserDTO user);

	UserDTO selectUser(int user_login_id);

	List<MainInfoDTO> getMainList(String user_address);

	List<NoticeDTO> getNoticeList();

	List<CommunityBoardDTO> getCommunityList(String user_address);

	List<MainInfoDTO> getMain();

	List<CommunityBoardDTO> getCommunity();

	List<BoardLikeDTO> getBoardLikeList(Integer user_id);

	String getLoginId(Integer user_login_id);

	List<ChatContentDTO> getChatRoom(String user_id);

	BoardDTO getBoard(Integer board_id);

	BoardImgDTO getBoardImg(Integer board_id);

	ChatRoomDTO getChatRoom2(ChatRoomDTO room);

	int insertChatRoom(ChatRoomDTO room);

	List<ChatContentDTO> getChatContents(int room_id);

	ChatRoomDTO getChatRoomById(String room_id);

	int insertChatContent(ChatContentDTO content);

	int updateChatRead(int room_id);

	String getNickName(String user_id);

	Integer cntStatus(Integer room_id);

	List<Integer> getBuyerId(ChatRoomDTO temp);
	
	public List<Notification_adDTO> getNotificationAdList();

}
