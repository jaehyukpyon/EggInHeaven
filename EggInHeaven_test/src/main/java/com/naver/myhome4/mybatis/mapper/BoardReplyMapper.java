package com.naver.myhome4.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.myhome4.domain.BoardReply;
import com.naver.myhome4.domain.Criteria;

public interface BoardReplyMapper {

	public abstract List<BoardReply> getList(@Param("cri") Criteria cri, @Param("recipe_num") int recipe_num);

	public abstract int addNewComment(BoardReply reply);

	public abstract int updateComment(BoardReply reply);

	public abstract int deleteComment(int reply_num);

}
