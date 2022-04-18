package com.naver.myhome4.service;

import java.util.List;

import com.naver.myhome4.domain.BoardReply;
import com.naver.myhome4.domain.Details;

public interface BoardReplyService {

	public abstract List<BoardReply> getList(Details cri, int recipe_num);

	public abstract int addNewComment(BoardReply reply);

	public abstract int updateComment(BoardReply reply);

	public abstract int deleteComment(int reply_num);

}
