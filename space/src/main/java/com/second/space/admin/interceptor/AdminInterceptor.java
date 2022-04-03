package com.second.space.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.second.space.user_.model.UserDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");

		if(user != null) {
			if(user.getUser_id() == 1) {
				return true;
			}
		}

		request.getRequestDispatcher("/WEB-INF/views/error/error403/.jsp").forward(request, response);
		
		return false;
	}
	
}
