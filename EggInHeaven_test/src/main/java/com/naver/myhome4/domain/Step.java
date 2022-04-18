package com.naver.myhome4.domain;

import org.springframework.web.multipart.MultipartFile;

public class Step {
	private int step_num;
	private int recipe_num;
	private int step_index;
	private String[] step_original;
	private String[] step_db;
	private String[] step_content;
	private MultipartFile[] uploadfile;
	
	private MultipartFile uploadfile1;
	private MultipartFile uploadfile2;
	private MultipartFile uploadfile3;
	private MultipartFile uploadfile4;
	private MultipartFile uploadfile5;
	
	public MultipartFile[] getUploadfileAll() {
		return new MultipartFile[] {uploadfile1,uploadfile2,uploadfile3,uploadfile4,uploadfile5};
	}
	
	public MultipartFile getUploadfile5() {
		return uploadfile5;
	}

	public void setUploadfile5(MultipartFile uploadfile5) {
		this.uploadfile5 = uploadfile5;
	}

	public MultipartFile getUploadfile1() {
		return uploadfile1;
	}

	public void setUploadfile1(MultipartFile uploadfile1) {
		this.uploadfile1 = uploadfile1;
	}

	public MultipartFile getUploadfile2() {
		return uploadfile2;
	}

	public void setUploadfile2(MultipartFile uploadfile2) {
		this.uploadfile2 = uploadfile2;
	}

	public MultipartFile getUploadfile3() {
		return uploadfile3;
	}

	public void setUploadfile3(MultipartFile uploadfile3) {
		this.uploadfile3 = uploadfile3;
	}

	public MultipartFile getUploadfile4() {
		return uploadfile4;
	}

	public void setUploadfile4(MultipartFile uploadfile4) {
		this.uploadfile4 = uploadfile4;
	}

	public int getStep_num() {
		return step_num;
	}

	public void setStep_num(int step_num) {
		this.step_num = step_num;
	}

	public int getRecipe_num() {
		return recipe_num;
	}

	public int getStep_index() {
		return step_index;
	}

	public String[] getStep_original() {
		return step_original;
	}

	public String[] getStep_db() {
		return step_db;
	}

	public String[] getStep_content() {
		return step_content;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setStep_index(int step_index) {
		this.step_index = step_index;
	}

	public void setStep_original(String[] step_original) {
		this.step_original = step_original;
	}

	public void setStep_db(String[] step_db) {
		this.step_db = step_db;
	}

	public void setStep_content(String[] step_content) {
		this.step_content = step_content;
	}

	public MultipartFile[] getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile[] uploadfile) {
		this.uploadfile = uploadfile;
	}
  
}
