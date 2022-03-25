package com.naver.myhome4.domain;

public class MailVO {

	private String form = "type your own email address";
	private String to;
	private String subject = "회원 가입을 축하드립니다. - 제목";
	private String content = "회원 가입을 축하드립니다. - 내용";

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
