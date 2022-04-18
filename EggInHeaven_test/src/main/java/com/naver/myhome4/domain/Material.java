package com.naver.myhome4.domain;

public class Material {
	private int recipe_num;
	private String[] material_name;
	private String[] material_amount;


	public int getRecipe_num() {
		return recipe_num;
	}

	public String getMaterial_name() {
		String result="";
		for(String s : material_name) {
			if(!s.equals(""))
			result += s + ",";
		}
		return result.substring(0, result.length()-1);
	}
	public void setMaterial_name(String[] material_name) {
		this.material_name = material_name;
	}

	public String getMaterial_amount() {
		String result="";
		for(String s : material_amount) {
			if(!s.equals(""))
			result += s + ",";
		}
		return result.substring(0, result.length()-1);
	}

	public void setMaterial_amount(String[] material_amount) {
		this.material_amount = material_amount;
	}


	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	
  
}
