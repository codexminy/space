package com.second.space.chatting.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import com.second.space.board.model.BoardDTO;
import com.second.space.chatting.model.ChatContentDTO;
import com.second.space.chatting.model.ChatRoomDTO;
import com.second.space.chatting.service.ChatServiceImpl;


import lombok.extern.log4j.Log4j;

@Log4j
@ServerEndpoint("/websocketChat/{roomid}/{userid}")
public class ChattingWebsocket {
	
		@Autowired
		ChatServiceImpl service;
		
	// 접속 된 클라이언트 WebSocket session 관리 리스트
		private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
		
		//<방번호, ArrayList<Session>
		private static Map<String, ArrayList<Session>> RoomList = new ConcurrentHashMap<String, ArrayList<Session>>();
		// session, 방번호
		private static Map<Session, String> sessionList = new ConcurrentHashMap<Session, String>();
		
		// 메시지에서 유저 명을 취득하기 위한 정규식 표현
		private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
		// WebSocket으로 브라우저가 접속하면 요청되는 함수
		@OnOpen
		public void handleOpen(Session userSession,@PathParam("roomid") String roomid, @PathParam("userid") String userid) {
		// 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
		sessionUsers.add(userSession);
		// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected... 여기여기");
		if(RoomList.get(roomid) == null) {
			
			// 채팅방에 들어갈 세션들
			ArrayList<Session> sessionTwo = new ArrayList<>();
			// session 추가
			sessionTwo.add(userSession);
			// sessionList 추가
			sessionList.put(userSession, roomid);
			// RoomList에 추가 
			RoomList.put(roomid, sessionTwo);
			System.out.println("새로운방방");
		}else if(RoomList.get(roomid) != null) {
			System.out.println("확인확인");
			//방확인
			RoomList.get(roomid).add(userSession);
			// 리스트 추가
			sessionList.put(userSession, roomid);
		}
		
	
		}
		// WebSocket으로 메시지가 오면 요청되는 함수
		@OnMessage
		public void handleMessage(String message, Session userSession, @PathParam("roomid") String roomid, @PathParam("userid") String userid) throws IOException {
		// 메시지 내용을 콘솔에 출력한다.
		System.out.println(message);
		System.out.println(roomid);
		System.out.println(userid);

		

		final String msg = message.replaceAll(pattern.pattern(), "");

		
		
		/*노력해보즈아!!!!!!!*/
		if(RoomList.get(roomid) == null) {
			
			// 채팅방에 들어갈 세션들
			ArrayList<Session> sessionTwo = new ArrayList<>();
			// session 추가
			sessionTwo.add(userSession);
			// sessionList 추가
			sessionList.put(userSession, roomid);
			// RoomList에 추가 
			RoomList.put(roomid, sessionTwo);
			System.out.println("새로운방");
		}else if(RoomList.get(roomid) != null) {
			
				//방확인
				RoomList.get(roomid).add(userSession);
				// 리스트 추가
				sessionList.put(userSession, roomid);
				
			List<Session> newList = RoomList.get(roomid).stream().distinct().collect(Collectors.toList());
			
			for(Session s : newList) {
				System.out.println(s);
				if(s == userSession) {
					System.out.println("같을때" + "/"+ s);
					
					
				}else {
					s.getBasicRemote().sendText(msg);
					System.out.println("하이하이" + "/"+  s);
					
				}
			}
			
			System.out.println("이게 되면 여기서 저장...");
		}

		}
		// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
		@OnClose
		public void handleClose(Session userSession, @PathParam("roomid") String roomid, @PathParam("userid") String userid) {
		// session 리스트로 접속 끊은 세션을 제거한다.
		sessionUsers.remove(userSession);
		// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("client is now disconnected...");
		}
}
