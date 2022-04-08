package com.naver.myhome4.service;

import java.util.List;

import com.naver.myhome4.domain.CategoryRecipeView;
import com.naver.myhome4.domain.Material;
import com.naver.myhome4.domain.Recipe;
import com.naver.myhome4.domain.Sauce;

public interface BoardService {
	
	public abstract Recipe getDetail(int num);
	
	public abstract List<Sauce> getSauce(int num);
	
	public abstract List<Material> getMaterial(int num);
	
	public abstract int isAddedToLikeListTable(String member_id, int recipe_num);

	public abstract int removeFromLikeListTable(String member_id, int recipe_num);

	public abstract int addToLikeListTable(String member_id, int recipe_num);

	public abstract int isBested(String member_id, int recipe_num);

	public abstract int removeFromBestListTable(String member_id, int recipe_num);

	public abstract int addToBestListTable(String member_id, int recipe_num);

	public abstract int getRecipeBestCount(int recipe_num);

	public abstract List<CategoryRecipeView> getCategories(int num);

}
