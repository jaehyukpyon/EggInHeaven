package com.naver.myhome4.domain;

public class Sauce {

	private int recipe_num;
	private String[] sauce_name;
	private String[] sauce_amount;


	public int getRecipe_num() {
		return recipe_num;
	}

	public String getSauce_name() {
		String result="";
		for(String s : sauce_name) {
			if(!s.equals(""))
			  result += s + ",";
		}
		
		 //1,2,  substring(0,3) => 1,2
		return result.substring(0, result.length()-1);
	}

	public String getSauce_amount() {
		String result="";
		for(String s : sauce_amount) {
			if(!s.equals(""))
			result += s + ",";
		}
		return result.substring(0, result.length()-1);
	}


	public void setRecipe_num(int recipe_num) {
		this.recipe_num = recipe_num;
	}

	public void setSauce_name(String[] sauce_name) {
		this.sauce_name = sauce_name;
	}

	public void setSauce_amount(String[] sauce_amount) {
		this.sauce_amount = sauce_amount;
	}

}
