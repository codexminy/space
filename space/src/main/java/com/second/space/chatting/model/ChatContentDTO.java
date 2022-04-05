package com.second.space.chatting.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Data
public class ChatContentDTO {
	private Integer chat_id;
	private Integer room_id;
	private String chat_contents;
	private String send_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chat_createat;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chat_updateat;
	private String chat_status;
	private String seller_id;
	private String buyer_id;
	private String nickname;
	private Integer board_id;
	private Integer cnt_status;
}
