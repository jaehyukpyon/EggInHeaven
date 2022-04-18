package com.naver.myhome4.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private com.naver.myhome4.mybatis.mapper.CategoryMapper dao;

	@Override
	public void insertCategory(Category category) {
		for (String s : category.getCategory_num()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("category_num", s);
			map.put("recipe_num", category.getRecipe_num());
			dao.insertCategory(map);
		}
	}

	@Override
	public void categoryModify(Category category) {
		dao.removecategory(category.getRecipe_num());
		insertCategory(category);
		
	}

	@Override
	public int categoryDelete(int num) {
		return dao.categoryDelete(num);
	}

	@Override
	public List<Map<String, Object>> getDetail(int category_num) {
		return dao.getDetail(category_num);
	}
}
