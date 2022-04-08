package com.naver.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

// 로그인 실패 후 처리할 작업을 해야할 때 사용하는 인터페이스: AuthenticationFailureHandler

// java 클래스 파일로 설정 시, @Service 제거
// @Service 
public class LoginFailHandler implements AuthenticationFailureHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationFailureHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		if (exception instanceof BadCredentialsException) {
			logger.info("아이디 또는 비밀번호 불일치!");
		}
		
		HttpSession session = request.getSession();
		
		logger.info("exception.getMessage(): {}", exception.getMessage());
		logger.info("로그인 실패");
		//User is disabled
		if(exception.getMessage().contains("User is disabled")) {
			session.setAttribute("disabled", "disabled");
		}else {
			session.setAttribute("loginfail", "loginFailMsg");
		}
		
		
		String url = request.getContextPath() + "/member/login";
		
		response.sendRedirect(url);
	}

}
