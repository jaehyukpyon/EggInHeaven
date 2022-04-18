package com.naver.myhome4.domain;

public class RecipeMaterial {

	private int recipe_num;
	private String material_name;
	private String material_amount;

	public int getRecipe_num() {
		return recipe_num;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public String getMaterial_amount() {
		return material_amount;
	}

	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

	public void setMaterial_amount(String material_amount) {
		this.material_amount = material_amount;
	}

}
