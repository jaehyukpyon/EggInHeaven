package com.naver.myhome4.service;

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

public interface BoardService {
	
	public abstract Recipe getDetail(int num);
	
	public abstract List<RecipeSauce> getSauce(int num);
	
	public abstract List<RecipeMaterial> getMaterial(int num);
	
	public abstract List<Category> getCategory(int num); 
	
	public abstract int isAddedToLikeListTable(String member_id, int recipe_num);

	public abstract int removeFromLikeListTable(String member_id, int recipe_num);

	public abstract int addToLikeListTable(String member_id, int recipe_num);

	public abstract int isBested(String member_id, int recipe_num);

	public abstract int removeFromBestListTable(String member_id, int recipe_num);

	public abstract int addToBestListTable(String member_id, int recipe_num);

	public abstract int getRecipeBestCount(int recipe_num);

	public abstract List<CategoryRecipeView> getCategories(int num);
	
	public abstract List<Recipe> getListWithPaging(Details cri); 
	
	public abstract int getTotalCount(Details det);

	public abstract List<Recipe> getListWithPagingBestest(Details det);

	public abstract List<RecipeStep> getRecipeSteps(int recipe_num);

	public abstract List<RecipeCookImage> getRecipeCookImages(int recipe_num);

}
