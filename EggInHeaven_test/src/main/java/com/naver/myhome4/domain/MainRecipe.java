package com.naver.myhome4.domain;

public class MainRecipe {
	
	private int recipe_num;
	private String recipe_title;
	private String recipe_content;
	private String recipe_time;
	private int recipe_readcount;
	private int recipe_best;
	private String recipe_date;
	private String member_id;
	
	private int cook_num;
	private String cook_original;
	private String cook_db;
	
	
	
	public String getCook_db() {
		return cook_db;
	}
	public void setCook_db(String cook_db) {
		this.cook_db = cook_db;
	}
	public int getCook_num() {
		return cook_num;
	}
	public void setCook_num(int cook_num) {
		this.cook_num = cook_num;
	}
	public String getCook_original() {
		return cook_original;
	}
	public void setCook_original(String cook_original) {
		this.cook_original = cook_original;
	}

	public int getRecipe_num() {
		return recipe_num;
	}
	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getRecipe_time() {
		return recipe_time;
	}
	public void setRecipe_time(String recipe_time) {
		this.recipe_time = recipe_time;
	}
	public int getRecipe_readcount() {
		return recipe_readcount;
	}
	public void setRecipe_readcount(int recipe_readcount) {
		this.recipe_readcount = recipe_readcount;
	}
	public int getRecipe_best() {
		return recipe_best;
	}
	public void setRecipe_best(int recipe_best) {
		this.recipe_best = recipe_best;
	}
	public String getRecipe_date() {
		return recipe_date;
	}
	public void setRecipe_date(String recipe_date) {
		this.recipe_date = recipe_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
}
