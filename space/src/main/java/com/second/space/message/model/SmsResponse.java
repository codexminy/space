package com.second.space.message.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SmsResponse {
	private String requiredId;
	private LocalDateTime requestTime;
	private String statusCode;
	private String statusName;
}
