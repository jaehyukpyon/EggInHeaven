package com.naver.myhome4.domain;

public class Category {

private String matall_num;
private String matall_name;
private String[] category_num;
private int category;
private int recipe_num;

public String getMatall_num() {
	return matall_num;
}
public void setMatall_num(String matall_num) {
	this.matall_num = matall_num;
}
public String getMatall_name() {
	return matall_name;
}
public void setMatall_name(String matall_name) {
	this.matall_name = matall_name;
}
public String[] getCategory_num() {
	return category_num;
}
public void setCategory_num(String[] category_num) {
	this.category_num = category_num;
}
public int getCategory() {
	return category;
}
public void setCategory(int category) {
	this.category = category;
}
public int getRecipe_num() {
	return recipe_num;
}
public void setRecipe_num(int recipe_num) {
	this.recipe_num = recipe_num;
}


}
