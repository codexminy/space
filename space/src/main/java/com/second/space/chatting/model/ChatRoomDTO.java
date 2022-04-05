package com.second.space.chatting.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Data
public class ChatRoomDTO {
	 private Integer room_id;
	 private String seller_id;
	 private String buyer_id;
	 private Integer board_id;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 private Date room_createat;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 private Date room_updateat;
	 private String room_status;
	 private String seller_delete;
	 private String buyer_delete;
	 
}
