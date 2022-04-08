package com.naver.myhome4.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.naver.myhome4.domain.Comment;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private com.naver.myhome4.mybatis.mapper.CommentMapper dao;

	@Override
	public int getListCount(int commu_num) {
		return dao.getListCount(commu_num);
	}

	@Override
	public List<Comment> getCommentList(int commu_num, int page) {
		int startrow=1;
		int endrow=page*3;
	
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("commu_num", commu_num);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getCommentList(map);
	}

	@Override
	public int commentsInsert(Comment c) {
		return dao.commentsInsert(c);
	}

	@Override
	public int commentsDelete(int num) {
		return dao.commentsDelete(num);
	}

	@Override
	public int commentsUpdate(Comment co) {
		return dao.commentsUpdate(co);
	}
	


	
	
	
}
