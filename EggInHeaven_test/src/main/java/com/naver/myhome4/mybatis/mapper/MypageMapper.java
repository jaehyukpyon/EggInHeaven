package com.naver.myhome4.mybatis.mapper;

import java.util.List;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MainRecipe;

public interface MypageMapper {

	public int getMyListCount(String id);
	
	public List<MainRecipe> getMyList(String id);
	
	public int getLikeListCount(String id);
	
	public List<MainRecipe> getLikeList(String id);
	
public int getCommuListCount(String id);
	
	public List<Community> getCommuList(String id);
}
