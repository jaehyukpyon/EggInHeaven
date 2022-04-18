package com.naver.myhome4.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MainRecipe;
import com.naver.myhome4.service.MainService;


@Controller

public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	private MainService mainservice;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main");
		
		List<MainRecipe> bestRecipe = mainservice.getBestRec();
		List<MainRecipe> newRecipe = mainservice.getNewRec();
		List<Community> commList = mainservice.getNewComm();
		
		mv.addObject("bestReclist",bestRecipe);
		mv.addObject("newReclist",newRecipe);
		mv.addObject("newCommlist",commList);
		
		
		return mv;
	}
}
