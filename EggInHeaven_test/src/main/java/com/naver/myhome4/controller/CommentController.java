package com.naver.myhome4.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.naver.myhome4.domain.Comment;
import com.naver.myhome4.service.CommentService;

@RestController	//@Controller + @ResponseBody
@RequestMapping(value="/comment")
public class CommentController {
	
	
	@Autowired
	private CommentService commentService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	/* @ResponseBody와 jackson을 이용하여 JSON 사용하기 */
	
	@PostMapping(value = "/list")
	public Map<String,Object> CommentList(int commu_num, int page) {
		List<Comment> list = commentService.getCommentList(commu_num, page);
		int listcount = commentService.getListCount(commu_num);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("listcount",listcount);
		logger.info("/comment/list");
		return map;
	}
	
	
	
	@PostMapping(value = "/add")
	public int CommentAdd(Comment co) {
	     return commentService.commentsInsert(co); 
	   }
	

	@PostMapping(value = "/update")
	public int CommentUpdate(Comment co) {
	     return commentService.commentsUpdate(co); 
	   }
	
	@ResponseBody
	@PostMapping(value = "/delete")
	public int CommentDelete(int num) {
	     return commentService.commentsDelete(num); 
	   }
	
}


