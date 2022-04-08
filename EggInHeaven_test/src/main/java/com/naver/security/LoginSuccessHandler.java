package com.naver.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

// AuthenticationSuccessHandler 사용자 인증이 성공 후 처리할 작업을 직접 작성할 때 사용하는 interface

// @Service
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info(authentication.getPrincipal().toString());
		logger.info("로그인 성공");
		
		String url = request.getContextPath() + "/main";
		logger.info(url);
		
		response.sendRedirect(url);
	}

}
