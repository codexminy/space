package com.second.space.user_.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.second.space.user_.model.UserDTO;
import com.second.space.user_.service.UserService;
import com.second.space.user_.service.UserServiceImpl;


public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserServiceImpl service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userLoggedIn");
		
		if(obj == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				String sessionId = loginCookie.getValue();
				UserDTO user = service.checkUserWithSessionKey(sessionId);
				
				if(user != null) {
					session.setAttribute("userLoggedIn", user);
					return true;
				}
			}
			
			response.sendRedirect("/space/user_/login");
			return false;
		}
		
		return true;
	}
	
	 @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        super.postHandle(request, response, handler, modelAndView);
	    }
}
