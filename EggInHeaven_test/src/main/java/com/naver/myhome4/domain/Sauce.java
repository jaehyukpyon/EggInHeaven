package com.naver.myhome4.domain;

public class Sauce {

	private int sauce_num;
	private int recipe_num;
	private String sauce_name;
	private String sauce_amount;

	public int getSauce_num() {
		return sauce_num;
	}

	public int getRecipe_num() {
		return recipe_num;
	}

	public String getSauce_name() {
		return sauce_name;
	}

	public String getSauce_amount() {
		return sauce_amount;
	}

	public void setSauce_num(int sauce_num) {
		this.sauce_num = sauce_num;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setSauce_name(String sauce_name) {
		this.sauce_name = sauce_name;
	}

	public void setSauce_amount(String sauce_amount) {
		this.sauce_amount = sauce_amount;
	}

}
