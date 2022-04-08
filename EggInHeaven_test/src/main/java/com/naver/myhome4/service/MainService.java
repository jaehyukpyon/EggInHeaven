package com.naver.myhome4.service;

import java.util.List;

import com.naver.myhome4.domain.MainRecipe;


public interface MainService {

	
	public List<MainRecipe> getBestRec();
	
	public List<MainRecipe> getNewRec();
}
