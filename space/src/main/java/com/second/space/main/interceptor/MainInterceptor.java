package com.second.space.main.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.second.space.user_.model.UserDTO;

public class MainInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UserDTO user = (UserDTO) request.getSession().getAttribute("userLoggedIn");

		if (user != null) {
			return true;
		}

		request.getRequestDispatcher("/WEB-INF/views/myspace/loginCheck.jsp").forward(request, response);

		return false;
	}

}
