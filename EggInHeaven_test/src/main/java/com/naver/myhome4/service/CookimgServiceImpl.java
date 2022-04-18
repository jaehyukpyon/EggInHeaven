package com.naver.myhome4.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Cookimg;
@Service
public class CookimgServiceImpl implements CookimgService{
	
	@Autowired
	private com.naver.myhome4.mybatis.mapper.CookimgMapper dao;

	@Override
	public void insertCookimg(Cookimg cookimg,int length) {
		for(int i=0;i<length;i++) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("recipe_num",cookimg.getRecipe_num());
			map.put("cook_original", cookimg.getCook_original()[i]);
			map.put("cook_db", cookimg.getCook_db()[i]);
			dao.insertCookimg(map);	
		}
		
	}

	@Override
	public void cookModify(Cookimg cookimg,int length) {
		dao.removecook(cookimg.getRecipe_num());
		insertCookimg(cookimg,length);
	}

	@Override
	public int cookimgDelete(int num) {
		return dao.cookimgDelete(num);
	}

	@Override
	public List<Map<String, Object>> getDetail(int num) {
		return dao.getDetail(num);
	}

}
