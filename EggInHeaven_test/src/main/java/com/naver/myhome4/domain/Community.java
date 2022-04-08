package com.naver.myhome4.domain;

import org.springframework.web.multipart.MultipartFile;

public class Community {
	
	private MultipartFile uploadfile;
	
	private int commu_num;
	private String member_id;
	private String commu_pass;
	private String commu_subject;
	private String commu_content;
	private String commu_img;
	private int commu_readcount;
	private String commu_date;
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	public int getCommu_num() {
		return commu_num;
	}
	public void setCommu_num(int commu_num) {
		this.commu_num = commu_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCommu_pass() {
		return commu_pass;
	}
	public void setCommu_pass(String commu_pass) {
		this.commu_pass = commu_pass;
	}
	public String getCommu_subject() {
		return commu_subject;
	}
	public void setCommu_subject(String commu_subject) {
		this.commu_subject = commu_subject;
	}
	public String getCommu_content() {
		return commu_content;
	}
	public void setCommu_content(String commu_content) {
		this.commu_content = commu_content;
	}
	public String getCommu_img() {
		return commu_img;
	}
	public void setCommu_img(String commu_img) {
		this.commu_img = commu_img;
	}
	public int getCommu_readcount() {
		return commu_readcount;
	}
	public void setCommu_readcount(int commu_readcount) {
		this.commu_readcount = commu_readcount;
	}
	public String getCommu_date() {
		return commu_date;
	}
	public void setCommu_date(String commu_date) {
		this.commu_date = commu_date;
	}


	

}
