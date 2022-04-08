package com.naver.myhome4.domain;

public class Criteria {

	private int pageNum;
	private int amount;

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
