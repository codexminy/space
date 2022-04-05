package com.second.space.error;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ErrorController {
	
	@RequestMapping(value="/error/error{error_code}/")
	public ModelAndView error(HttpServletRequest request, @PathVariable String error_code) {
		
		ModelAndView mnv = new ModelAndView("/error/error");
		
		String msg = (String) request.getAttribute("javax.servlet.error.message");
		String name = "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("STATUS_CODE", request.getAttribute("javax.servlet.error.status_code"));
		map.put("REQUEST_URI", request.getAttribute("javax.servlet.error.request_uri"));
		map.put("EXCEPTION_TYPE", request.getAttribute("javax.servlet.error.exception_type"));
		map.put("EXCEPTION", request.getAttribute("javax.servlet.error.exception"));
		map.put("CAUSE", request.getAttribute("javax.servlet.error.message"));
		map.put("SERVLET_NAME", request.getAttribute("javax.servlet.error.servlet_name"));
	
		try {
			int status_code = Integer.parseInt(error_code);
			
			switch (status_code) {
				case 400:
					msg = "잘못된 요청입니다.";
					name = HttpStatus.BAD_REQUEST.name().toString();
					break;
				case 403:
					msg = "접근이 금지되었습니다.";
					name = HttpStatus.FORBIDDEN.name().toString();
					break;
				case 404:
					msg = "페이지를 찾을 수 없습니다.";
					name = HttpStatus.NOT_FOUND.name().toString();
					break;
				case 405:
					msg = "요청된 메소드가 허용되지 않습니다.";
					name = HttpStatus.METHOD_NOT_ALLOWED.name().toString();
					break;
				case 500:
					msg = "서버에 오류가 발생하였습니다.";
					name = HttpStatus.INTERNAL_SERVER_ERROR.name().toString();
					break;
				case 503:
					msg = "서비스를 사용할 수 없습니다.";
					name = HttpStatus.SERVICE_UNAVAILABLE.name().toString();
					break;
				default:
					msg = "알 수 없는 오류가 발생하였습니다.";
					break;
			}
		} catch(Exception e) {
			msg = "기타 오류가 발생하였습니다.";
		} finally {
			map.put("MESSAGE", msg);
			map.put("NAME", name);
		}
	
//		if(map.isEmpty() == false ) {
//			Iterator<Entry<String, Object>> iterator = map.entrySet().iterator();
//			Entry<String, Object> entry = null;
//			
//			while(iterator.hasNext()) {
//				entry = iterator.next();
//				System.out.println(entry.getKey() + " : " + entry.getValue());
//			}
//		}
		
		mnv.addObject("error", map);
		
		return mnv;
	}
	
}
