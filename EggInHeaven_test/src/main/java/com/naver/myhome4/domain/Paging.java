package com.naver.myhome4.domain;

public class Paging {

	private int startPage;
	private int endPage;

	private boolean prev;
	private boolean next;

	private int total;

	private Details det;

	public Paging(Details det, int total) {
		this.det = det;
		this.total = total;

		this.endPage = (int) (Math.ceil(det.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / det.getAmount()));

		if (realEnd < this.endPage)
			this.endPage = realEnd;

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
		System.out.println("startPage: " + startPage + ", endPage: " + endPage);
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public Details getdet() {
		return det;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setDet(Details det) {
		this.det = det;
	}

}
