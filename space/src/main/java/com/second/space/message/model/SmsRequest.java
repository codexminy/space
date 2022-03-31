package com.second.space.message.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SmsRequest {
	
	private String type;
	private String contentType;
	private String countryCode;
	private String from;
	private String content;
	private List<MessagesDTO> messages;
}
