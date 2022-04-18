package com.naver.myhome4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MainRecipe;


@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private com.naver.myhome4.mybatis.mapper.MainMapper dao;

	@Override
	public List<MainRecipe> getBestRec() {
		
		return dao.getBestRec();
	}

	
	@Override
	public List<MainRecipe> getNewRec() {

		return dao.getNewRec();
	}


	@Override
	public List<Community> getNewComm() {
		
		return dao.getNewComm();
	}

}
