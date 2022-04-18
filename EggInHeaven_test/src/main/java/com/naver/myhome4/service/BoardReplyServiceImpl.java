package com.naver.myhome4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.BoardReply;
import com.naver.myhome4.domain.Details;
import com.naver.myhome4.mybatis.mapper.BoardReplyMapper;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Autowired
	private BoardReplyMapper mapper;

	@Override
	public List<BoardReply> getList(Details cri, int recipe_num) {
		return mapper.getList(cri, recipe_num);
	}
	
	@Override
	public int addNewComment(BoardReply reply) {
		return mapper.addNewComment(reply);
	}
	
	@Override
	public int updateComment(BoardReply reply) {
		return mapper.updateComment(reply);
	}
	
	@Override
	public int deleteComment(int reply_num) {
		return mapper.deleteComment(reply_num);
	}

}
