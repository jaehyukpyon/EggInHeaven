package com.naver.myhome4.mybatis.mapper;

import com.naver.myhome4.domain.Recipe;

public interface RecipeMapper {

		//레시피 등록
		public abstract void insertRecipe(Recipe recipe);
		
		//레시피 수정
		public abstract int recipeModify(Recipe modifyrecipe);
		
		//레시피 삭제
		public abstract int recipeDelete(int recipe_num);
		
		// 글 내용 보기
		public abstract Recipe getDetail(int recipe_num); 
		
}
