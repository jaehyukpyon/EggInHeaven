package com.naver.myhome4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Recipe;



@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private com.naver.myhome4.mybatis.mapper.RecipeMapper dao;
	
	@Override
	public void insertRecipe(Recipe recipemodify) {
		dao.insertRecipe(recipemodify);
		
	}

	@Override
	public int recipeModify(Recipe recipe) {
		return dao.recipeModify(recipe);
	}

	@Override
	public int recipeDelete(int recipe_num) {
		return dao.recipeDelete(recipe_num);
	}

	@Override
	public Recipe getDetail(int num) {
		return dao.getDetail(num);
	}

	

}
