package com.naver.myhome4.domain;

import org.springframework.web.multipart.MultipartFile;

public class Cookimg {
	private int cook_num;
	private int recipe_num;
	private String[] cook_original;
	private String[] cook_db;
	private MultipartFile[] cook_uploadfile;
	
	private MultipartFile cook_uploadfile1;
	private MultipartFile cook_uploadfile2;
	private MultipartFile cook_uploadfile3;
	private MultipartFile cook_uploadfile4;
	
	public MultipartFile[] getUploadfileAll2() {
		return new MultipartFile[] {cook_uploadfile1,cook_uploadfile2,cook_uploadfile3,cook_uploadfile4};
	}
	

	

	public MultipartFile getCook_uploadfile1() {
		return cook_uploadfile1;
	}




	public void setCook_uploadfile1(MultipartFile cook_uploadfile1) {
		this.cook_uploadfile1 = cook_uploadfile1;
	}




	public MultipartFile getCook_uploadfile2() {
		return cook_uploadfile2;
	}




	public void setCook_uploadfile2(MultipartFile cook_uploadfile2) {
		this.cook_uploadfile2 = cook_uploadfile2;
	}




	public MultipartFile getCook_uploadfile3() {
		return cook_uploadfile3;
	}




	public void setCook_uploadfile3(MultipartFile cook_uploadfile3) {
		this.cook_uploadfile3 = cook_uploadfile3;
	}




	public MultipartFile getCook_uploadfile4() {
		return cook_uploadfile4;
	}




	public void setCook_uploadfile4(MultipartFile cook_uploadfile4) {
		this.cook_uploadfile4 = cook_uploadfile4;
	}




	public MultipartFile[] getCook_uploadfile() {
		return cook_uploadfile;
	}

	public int getRecipe_num() {
		return recipe_num;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setCook_uploadfile(MultipartFile[] cook_uploadfile) {
		this.cook_uploadfile = cook_uploadfile;
	}

	public void setCook_original(String[] cook_original) {
		this.cook_original = cook_original;
	}

	public void setCook_db(String[] cook_db) {
		this.cook_db = cook_db;
	}

	public int getCook_num() {
		return cook_num;
	}

	public void setCook_num(int cook_num) {
		this.cook_num = cook_num;
	}

	public String[] getCook_original() {
		return cook_original;
	}

	public String[] getCook_db() {
		return cook_db;
	}
}
