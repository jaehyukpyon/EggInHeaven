package com.naver.myhome4.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;



@ControllerAdvice
public class ExceptionController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(ExceptionController.class);
	
	// common 메소드는 Exception 타입으로 처리하는 모든 예외를 처리하도록 설정
	@ExceptionHandler(Exception.class)
	public ModelAndView common(Exception e, HttpServletRequest request) {
		logger.info(e.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/common");
		mav.addObject("exception",e);
		mav.addObject("url", request.getRequestURL());
		return mav;
	}
	
	
	
}
