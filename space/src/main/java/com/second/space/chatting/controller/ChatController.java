package com.second.space.chatting.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.second.space.board.model.BoardDTO;
import com.second.space.board.model.BoardImgDTO;
import com.second.space.chatting.model.ChatContentDTO;
import com.second.space.chatting.model.ChatRoomDTO;
import com.second.space.chatting.service.ChatServiceImpl;
import com.second.space.user_.model.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/chatting")
@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl chatService;
	
	@GetMapping("/chat")
	public void chat(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");

		Integer user_login_id = user.getUser_login_id();
		String user_id = chatService.getLoginId(user_login_id);

		List<ChatContentDTO> content = chatService.getChatRoom(user.getUser_id()+"");

		
		for(ChatContentDTO c : content) {

			int num = user.getUser_id();
			int num2 = Integer.parseInt(c.getSeller_id());

			if(num == num2) {

				c.setNickname(chatService.getNickName(c.getBuyer_id()));

			}else {

				c.setNickname(chatService.getNickName(c.getSeller_id()));
			}
			
			if(c.getChat_status() != null) {
			
				if(c.getChat_status().equals("N")) {
					c.setCnt_status(chatService.cntStatus(c.getRoom_id()));
				}
			}
		}
		
		model.addAttribute("content", content);
		model.addAttribute("user", user);
	}
	@GetMapping("/chatPartner")
	public String chatPartner(@RequestParam(value="board_id") Integer board_id, HttpServletRequest request , 
			@RequestParam(value="buyer_id") Integer buyer_id
		,	Model model) {
		
		String path = "chatting/chatPartner";
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userLoggedIn");
	
		//보드 정보 가져오기 
		BoardDTO board = chatService.getBoard(board_id);
		BoardImgDTO boardImg = chatService.getBoardImg(board_id);
		
		int seller_id = board.getUser_id();
		List<ChatContentDTO> content = null;

		ChatRoomDTO temp = new ChatRoomDTO();
		temp.setSeller_id(seller_id+"");
		temp.setBoard_id(board_id);
		temp.setBuyer_id(buyer_id+"");
		ChatRoomDTO room = chatService.getChatRoom2(temp);
		
		
		
		
			log.info(room);
			
			if(room == null) {
				int result = chatService.insertChatRoom(temp);
				log.info(result);
				if(result > 0) {
					room = chatService.getChatRoom2(temp);
					log.info(room);
				}
			}else {
				int room_id = room.getRoom_id();
				content = chatService.getChatContents(room_id);
				log.info(content);
			}
		
		int update = chatService.updateChatRead(room.getRoom_id());
	
		model.addAttribute("roomid", room.getRoom_id());
		model.addAttribute("board", board);
		model.addAttribute("boardImg", boardImg);
		model.addAttribute("user", user);
		model.addAttribute("content", content);
		
		return path;
		
	}
	
	@ResponseBody
	@RequestMapping("/read")
	public void chatRead(@RequestBody Map<String, Integer> params) {
		int room_id = params.get("room_id");
		int result = chatService.updateChatRead(room_id);
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public void insertChat(@RequestBody Map<String, String> params) {
		// 상대가 보낸거
		String room_id = params.get("room_id");
		String user_id = params.get("user_id");
		String contents = params.get("content");
		
		System.out.println(room_id);
		System.out.println(user_id);
		System.out.println(contents);
		
		ChatRoomDTO room = chatService.getChatRoomById(room_id);
		ChatContentDTO content = new ChatContentDTO();
		System.out.println(room);
		if(room != null) {
			if(room.getBuyer_id().equals(user_id)) {
				content.setSend_id(room.getSeller_id());
			}else {
				content.setSend_id(room.getBuyer_id());
			}
		}
		
		content.setSend_id(room.getBuyer_id());
		content.setChat_contents(contents);
		content.setRoom_id(Integer.parseInt(room_id));
		int result = chatService.insertChatContent(content);
		
	}
	
	@ResponseBody
	@RequestMapping("/sendInsert")
	public void sendInsert(@RequestBody Map<String, String> params) {
		//내가 보낸거 
		String room_id = params.get("room_id");
		String user_id = params.get("user_id");
		String contents = params.get("content");
		
		ChatRoomDTO room = chatService.getChatRoomById(room_id);
		System.out.println(room);
		ChatContentDTO content = new ChatContentDTO();
		content.setSend_id(user_id);
		content.setChat_contents(contents);
		content.setRoom_id(Integer.parseInt(room_id));
		int result = chatService.insertChatContent(content);
	}
	
}
