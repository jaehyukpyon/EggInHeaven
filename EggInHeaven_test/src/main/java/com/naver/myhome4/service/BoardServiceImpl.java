package com.naver.myhome4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.naver.myhome4.mybatis.mapper.RecipeMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private RecipeMapper dao;

	@Override
	public Recipe getDetail(int num) {
		return dao.getDetail(num);
	}
	
	@Override
	public List<RecipeSauce> getSauce(int num) {
		return dao.getSauce(num);
	}
	
	@Override
	public List<RecipeMaterial> getMaterial(int num) {
		return dao.getMaterial(num);
	}
	
	@Override
	public List<Category> getCategory(int num) {
		return dao.getCategory(num);
	}
	
	@Override
	public int isAddedToLikeListTable(String member_id, int recipe_num) {
		return dao.isAddedToLikeListTable(member_id, recipe_num);
	}
	
	@Override
	public int removeFromLikeListTable(String member_id, int recipe_num) {
		return dao.removeFromLikeListTable(member_id, recipe_num);
	}
	
	@Override
	public int addToLikeListTable(String member_id, int recipe_num) {
		return dao.addToLikeListTable(member_id, recipe_num);
	}
	
	@Override
	public int isBested(String member_id, int recipe_num) {
		return dao.isBested(member_id, recipe_num);
	}
	
	@Override
	public int removeFromBestListTable(String member_id, int recipe_num) {
		// best_list 테이블에서 지우고
		int firstResult = dao.removeFromBestListTable(member_id, recipe_num);
		
		// recipe 테이블에서 1 감소시키기
		int secondResult = dao.decreaseBestRecipe(recipe_num);
		
		return (firstResult == 1 && secondResult == 1) ? 1 : 0;
	}
	
	@Override
	public int addToBestListTable(String member_id, int recipe_num) {
		// best_list 테이블에 추가하고
		int firstResult = dao.addToBestListTable(member_id, recipe_num);
		
		// recipe 테이블에서 1 증가시키기
		int secondResult = dao.increaseBestRecipe(recipe_num);
		
		return (firstResult == 1 && secondResult == 1) ? 1 : 0;
	}
	
	@Override
	public int getRecipeBestCount(int recipe_num) {
		return dao.getRecipeBestCount(recipe_num);
	}
	
	@Override
	public List<CategoryRecipeView> getCategories(int num) {
		return dao.getCategories(num);
	}
	
	@Override
	public List<Recipe> getListWithPaging(Details det) {
		return dao.getListWithPaging(det);
	}
	
	@Override
	public int getTotalCount(Details det) {
		return dao.getTotalCount(det);
	}
	
	@Override
	public List<Recipe> getListWithPagingBestest(Details det) {
		return dao.getListWithPagingBestest(det);
	}
	
	@Override
	public List<RecipeStep> getRecipeSteps(int recipe_num) {
		return dao.getRecipeSteps(recipe_num);
	}
	
	@Override
	public List<RecipeCookImage> getRecipeCookImages(int recipe_num) {
		return dao.getRecipeCookImages(recipe_num);
	}

}
