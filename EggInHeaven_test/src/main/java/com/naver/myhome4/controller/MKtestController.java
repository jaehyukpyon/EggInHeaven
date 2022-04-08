package com.naver.myhome4.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "test")
public class MKtestController {

	@RequestMapping(value = "2")
	public String recipe() {
		return "mk/recipe";
	}

	@RequestMapping(value = "4", method = { RequestMethod.GET })
	public String recipe2(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam(value = "time",defaultValue="0") int time) {
		String id[] = request.getParameterValues("id");
		String name[] = request.getParameterValues("name");
		
		
		model.addAttribute("id",id);
		model.addAttribute("name",name);
		model.addAttribute("time",time);
		return "mk/recipe";
	}

	@RequestMapping(value = "3")
	public String searchTest() {
		return "mk/detailSearch";
	}
}
