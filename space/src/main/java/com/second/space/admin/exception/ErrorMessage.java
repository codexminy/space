package com.second.space.admin.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ErrorMessage {
	private int status;
	private String message;
	private long time;
}
