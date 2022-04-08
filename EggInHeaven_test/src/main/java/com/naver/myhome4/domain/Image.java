package com.naver.myhome4.domain;

public class Image {

	private int cook_num;
	private int recipe_num;
	private String cook_original;
	private String cook_db;

	public int getCook_num() {
		return cook_num;
	}

	public int getRecipe_num() {
		return recipe_num;
	}

	public String getCook_original() {
		return cook_original;
	}

	public String getCook_db() {
		return cook_db;
	}

	public void setCook_num(int cook_num) {
		this.cook_num = cook_num;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setCook_original(String cook_original) {
		this.cook_original = cook_original;
	}

	public void setCook_db(String cook_db) {
		this.cook_db = cook_db;
	}

}
