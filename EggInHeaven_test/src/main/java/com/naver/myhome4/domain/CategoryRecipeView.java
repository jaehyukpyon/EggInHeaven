package com.naver.myhome4.domain;

public class CategoryRecipeView {

	private String category_num;
	private int recipe_num;
	private String matall_name;
	private int category;

	public String getCategory_num() {
		return category_num;
	}

	public int getRecipe_num() {
		return recipe_num;
	}

	public String getMatall_name() {
		return matall_name;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory_num(String category_num) {
		this.category_num = category_num;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setMatall_name(String matall_name) {
		this.matall_name = matall_name;
	}

	public void setCategory(int category) {
		this.category = category;
	}

}
