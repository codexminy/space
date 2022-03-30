package com.second.space.admin.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice("com.second.space.admin.controller")
public class AdminRESTExceptionHandler {
	
	@ExceptionHandler(FailToCreateException.class)
	public ErrorMessage adminException(FailToCreateException e) {
		ErrorMessage error = new ErrorMessage(1,e.getMessage(), 20);
		return error;
	}
}
