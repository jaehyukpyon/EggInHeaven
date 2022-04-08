package com.naver.myhome4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.MainRecipe;


@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private com.naver.myhome4.mybatis.mapper.MainMapper dao;

	@Override
	public List<MainRecipe> getBestRec() {
		List<MainRecipe> best_Rec_List = dao.getBestRec();
		
		return best_Rec_List;
	}

	
	@Override
	public List<MainRecipe> getNewRec() {
		List<MainRecipe> new_Rec_List = dao.getNewRec();
		return new_Rec_List;
	}

}
