package com.naver.myhome4.service;

import com.naver.myhome4.domain.Recipe;

public interface RecipeService {

	//레시피 등록
	public abstract void insertRecipe(Recipe recipe);
	
	//레시피 수정
	public abstract int recipeModify(Recipe recipemodify);
	
	//레시피 삭제
	public abstract int recipeDelete(int recipe_num);
	
	// 레시피 내용 보기
	public abstract Recipe getDetail(int num);
	
}
