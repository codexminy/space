package com.second.space.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Request {
	private String recipientPhoneNumber;
	private String title;
	private String content;
}
