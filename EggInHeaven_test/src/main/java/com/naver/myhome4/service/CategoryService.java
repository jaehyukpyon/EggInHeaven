package com.naver.myhome4.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Category;

public interface CategoryService {
	
	//카테고리 등록
	public abstract void insertCategory(Category category);
	
	//카테고리 수정
	public abstract void categoryModify(Category category);
	
	//카테고리 삭제
	public abstract int categoryDelete(int num);
	
	//카테고리 보기
	public List<Map<String, Object>> getDetail(int category_num);
}
