package com.naver.myhome4.mybatis.mapper;

import java.util.List;

import com.naver.myhome4.domain.Category;
import com.naver.myhome4.domain.CategoryRecipeView;
import com.naver.myhome4.domain.Details;
import com.naver.myhome4.domain.Material;
import com.naver.myhome4.domain.Recipe;
import com.naver.myhome4.domain.RecipeCookImage;
import com.naver.myhome4.domain.RecipeMaterial;
import com.naver.myhome4.domain.RecipeSauce;
import com.naver.myhome4.domain.RecipeStep;
import com.naver.myhome4.domain.Sauce;

public interface RecipeMapper {
  
  // 신호준.
  //레시피 등록
	public abstract void insertRecipe(Recipe recipe);
		
	//레시피 수정
	public abstract int recipeModify(Recipe modifyrecipe);
		
	//레시피 삭제
	public abstract int recipeDelete(int recipe_num);
  
  
	// 변재혁.
	public abstract Recipe getDetail(int num);

	public abstract List<RecipeSauce> getSauce(int num);
	
	public abstract List<RecipeMaterial> getMaterial(int num);
	
	public abstract List<Category> getCategory(int num);

	public abstract int isAddedToLikeListTable(String member_id, int recipe_num);

	public abstract int removeFromLikeListTable(String member_id, int recipe_num);

	public abstract int addToLikeListTable(String member_id, int recipe_num);

	public abstract int isBested(String member_id, int recipe_num);

	public abstract int removeFromBestListTable(String member_id, int recipe_num);

	public abstract int decreaseBestRecipe(int recipe_num);

	public abstract int addToBestListTable(String member_id, int recipe_num);

	public abstract int increaseBestRecipe(int recipe_num);

	public abstract int getRecipeBestCount(int recipe_num);

	public abstract List<CategoryRecipeView> getCategories(int num);
	
	public abstract List<Recipe> getListWithPaging(Details det); 
	
	public abstract int getTotalCount(Details det);

	public abstract List<Recipe> getListWithPagingBestest(Details det);

	public abstract List<RecipeStep> getRecipeSteps(int recipe_num);

	public abstract List<RecipeCookImage> getRecipeCookImages(int recipe_num);

}
