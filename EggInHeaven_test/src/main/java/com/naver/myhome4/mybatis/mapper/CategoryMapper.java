package com.naver.myhome4.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Category;

public interface CategoryMapper {


	//카테고리 등록
	public abstract void insertCategory(Map<String, Object> map);
	
	//카테고리 수정
	public abstract int categoryModify(Category category);
	
	//카테고리 삭제
	public abstract int categoryDelete(int num);
	
	//카테고리 보기
	public abstract List<Map<String, Object>> getDetail(int category_num);

	public abstract void removecategory(int recipe_num);
}
