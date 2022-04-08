package com.naver.myhome4.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.myhome4.domain.BoardReply;
import com.naver.myhome4.domain.Criteria;
import com.naver.myhome4.service.BoardReplyService;

@RestController
@RequestMapping("/boardReplies/")
public class BoardReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardReplyService service;

	@GetMapping(value = "/pages/{recipe_num}/{page}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<BoardReply>> getList(@PathVariable("recipe_num") int recipe_num, @PathVariable("page") int page) {
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<List<BoardReply>>(service.getList(cri, recipe_num), HttpStatus.OK);
	}
	
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addNewComment(@RequestBody BoardReply reply) {
		logger.info("BoardReply: " + reply);
		
		int insertCount = service.addNewComment(reply);
		
		logger.info("Insert New Comment Count: " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/{reply_num}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateComment(@RequestBody BoardReply reply, @PathVariable("reply_num") int reply_num) {
		logger.info("BoardReply: " + reply);
		
		reply.setContent(reply.getContent() + " - (수정됨)");
		
		int updateCount = service.updateComment(reply);
		
		logger.info("Update Comment Count: " + updateCount);
		
		return updateCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/{reply_num}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE }) 
	public ResponseEntity<String> deleteComment(@PathVariable("reply_num") int reply_num) {
		logger.info("BoardReply: " + reply_num);
		
		int deleteCount = service.deleteComment(reply_num);
		
		logger.info("Delete Comment Count: " + deleteCount);
		
		return deleteCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
