package com.second.space.admin.exception;

import java.sql.SQLException;

import org.mybatis.spring.MyBatisSystemException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class AdminExceptionHandler {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView commonException404(NoHandlerFoundException e) {
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("code", HttpStatus.NOT_FOUND.value());
		mnv.addObject("errorName", HttpStatus.NOT_FOUND.name().toString());
		mnv.addObject("message", ErrorMessage.NOT_FOUND_ERROR_MSG);
		mnv.setViewName("/error/error");
		
		return mnv;
	}
	
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	@ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
	public ModelAndView commonException405(HttpRequestMethodNotSupportedException e) {
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("code", HttpStatus.METHOD_NOT_ALLOWED.value());
		mnv.addObject("errorName", HttpStatus.METHOD_NOT_ALLOWED.name().toString());
		mnv.addObject("message", ErrorMessage.METHOD_NOT_ALLOWED_ERROR_MSG);
		mnv.setViewName("/error/error");
		
		return mnv;
	}
	
	@ExceptionHandler(BadSqlGrammarException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView commonbsgException500(BadSqlGrammarException e) {
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("code", HttpStatus.INTERNAL_SERVER_ERROR.value());
		mnv.addObject("errorName", HttpStatus.INTERNAL_SERVER_ERROR.name().toString());
		mnv.addObject("message", ErrorMessage.SERVER_ERROR_MSG);
		mnv.setViewName("/error/error");
		
		return mnv;
	}
	
	@ExceptionHandler(SQLException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView commonSQLException500(SQLException e) {
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("code", HttpStatus.INTERNAL_SERVER_ERROR.value());
		mnv.addObject("errorName", HttpStatus.INTERNAL_SERVER_ERROR.name().toString());
		mnv.addObject("message", ErrorMessage.SERVER_ERROR_MSG);
		mnv.setViewName("/error/error");
		
		return mnv;
	}
	
	@ExceptionHandler(MyBatisSystemException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<ErrorMessage> commonmbsException500(MyBatisSystemException e) {
		ErrorMessage error = new ErrorMessage(HttpStatus.INTERNAL_SERVER_ERROR.name().toString(), ErrorMessage.SERVER_ERROR_MSG);
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).contentType(MediaType.APPLICATION_JSON).body(error);
	}
	
}
