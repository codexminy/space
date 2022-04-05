package com.second.space.chatting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.chatting.model.ChatContentDTO;
import com.second.space.chatting.model.ChatRoomDTO;
import com.second.space.mapper.UserXMLMapper;

@Service
public class ChatServiceImpl {
	
	@Autowired
	private UserXMLMapper userMapper;

	public String getLoginId(Integer user_login_id) {
		return userMapper.getLoginId(user_login_id);
	}

	public List<ChatContentDTO> getChatRoom(String user_id) {
		return userMapper.getChatRoom(user_id);
	}

	public BoardDTO getBoard(Integer board_id) {
		return userMapper.getBoard(board_id);
	}

	public BoardImgDTO getBoardImg(Integer board_id) {
		return userMapper.getBoardImg(board_id);
	}

	public ChatRoomDTO getChatRoom2(ChatRoomDTO room) {
		return userMapper.getChatRoom2(room);
	}

	public int insertChatRoom(ChatRoomDTO room) {
		return userMapper.insertChatRoom(room);
	}

	public List<ChatContentDTO> getChatContents(int room_id) {
		return userMapper.getChatContents(room_id);
	}

	public ChatRoomDTO getChatRoomById(String roomid) {
		return userMapper.getChatRoomById(roomid);
	}

	public int insertChatContent(ChatContentDTO content) {
		return userMapper.insertChatContent(content);
	}

	public int updateChatRead(int room_id) {
		return userMapper.updateChatRead(room_id);
	}

	public String getNickName(String user_id) {
		return userMapper.getNickName(user_id);
	}

	public Integer cntStatus(Integer room_id) {
		return userMapper.cntStatus(room_id);
	}

	public List<Integer> getBuyerId(ChatRoomDTO temp) {
		return userMapper.getBuyerId(temp);
	}


	
	
}
