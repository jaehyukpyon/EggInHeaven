package com.naver.myhome4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Recipe;



@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private com.naver.myhome4.mybatis.mapper.RecipeMapper dao;
	
	@Override
	public void insertRecipe(Recipe recipe) {
		dao.insertRecipe(recipe);
		
	}

	@Override
	public int recipeModify(Recipe modifyrecipe) {
		return dao.recipeModify(modifyrecipe);
	}

	@Override
	public int recipeDelete(int recipe_num) {
		return dao.recipeDelete(recipe_num);
	}

	@Override
	public Recipe getDetail(int recipe_num) {
		return dao.getDetail(recipe_num);
	}

	

}
