package com.naver.myhome4.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Comment;



public interface CommentMapper {

	// 글의 갯수 구하기
	public int getListCount(int commu_num);

	// 댓글 목록 가져오기
	public List<Comment> getCommentList(Map<String, Integer> map);

	// 댓글 등록하기
	public int commentsInsert(Comment c);

	//댓글 삭제
	public int commentsDelete(int num);

	// 댓글 수정
	public int commentsUpdate(Comment co);
	
	
}
