package com.naver.myhome4.domain;

public class RecipeSauce {

	private int recipe_num;
	private String sauce_name;
	private String sauce_amount;

	public int getRecipe_num() {
		return recipe_num;
	}

	public String getSauce_name() {
		return sauce_name;
	}

	public String getSauce_amount() {
		return sauce_amount;
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
