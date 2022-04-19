package com.naver.myhome4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MainRecipe;
import com.naver.myhome4.mybatis.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper dao;
	
	public int getMyListCount(String id) {
		return dao.getMyListCount(id);
	};
	
	public List<MainRecipe> getMyList(String id){
		return dao.getMyList(id);
	}

	@Override
	public int getLikeListCount(String id) {
		// TODO Auto-generated method stub
		return dao.getLikeListCount(id);
	}

	@Override
	public List<MainRecipe> getLikeList(String id) {
		return dao.getLikeList(id);
	}

	@Override
	public int getCommuListCount(String id) {
		return dao.getCommuListCount(id);
	}

	@Override
	public List<Community> getCommuList(String id) {
		return dao.getCommuList(id);
	};
	
	
	
}
