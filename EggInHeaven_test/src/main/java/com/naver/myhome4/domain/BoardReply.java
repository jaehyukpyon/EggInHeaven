package com.naver.myhome4.domain;

import java.util.Date;

public class BoardReply {

	private int reply_num;
	private int recipe_num;
	private String member_id;
	private String content;
	private Date reply_date;

	public int getReply_num() {
		return reply_num;
	}

	public int getRecipe_num() {
		return recipe_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public String getContent() {
		return content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

}
