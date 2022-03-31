package com.second.space.admin.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ErrorMessage {
	public final static String SERVER_ERROR_MSG = "서버 오류가 발생했습니다. 관리자에게 문의주시기 바랍니다.";
	public final static String NOT_FOUND_ERROR_MSG = "요청하신 URL을 찾을 수 없습니다.";
	public final static String METHOD_NOT_ALLOWED_ERROR_MSG = "요청을 찾을 수 없습니다.";
	
	private String code;
	private String message;
}
