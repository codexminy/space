package com.second.space.admin.exception;

public class FailToCreateException extends RuntimeException {

	public FailToCreateException() {
		super();
	}
	
	public FailToCreateException(String message) {
		super(message);
	}
	
	public FailToCreateException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public FailToCreateException(Throwable cause) {
		super(cause);
	}
	
}
