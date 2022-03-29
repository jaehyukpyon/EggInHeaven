package com.naver.myhome4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="test")
public class testController {	
	
	@RequestMapping(value="2")
	public String header() {
		return "mk/header";
	}
	@RequestMapping(value ="3")
	public String searchTest() {
		return "mk/detailSearch";
	}
}
