package com.naver.myhome4.domain;


public class Step {
private int step_num;
private int recipe_num;
private String step_original;
private String step_db;
private String step_content;

public int getStep_num() {
	return step_num;
}
public void setStep_num(int step_num) {
	this.step_num = step_num;
}
public int getRecipe_num() {
	return recipe_num;
}
public void setRecipe_num(int recipe_num) {
	this.recipe_num = recipe_num;
}
public String getStep_original() {
	return step_original;
}
public void setStep_original(String step_original) {
	this.step_original = step_original;
}
public String getStep_db() {
	return step_db;
}
public void setStep_db(String step_db) {
	this.step_db = step_db;
}
public String getStep_content() {
	return step_content;
}
public void setStep_content(String step_content) {
	this.step_content = step_content;
}
}
