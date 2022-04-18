package com.naver.myhome4.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MainRecipe;

public interface MainMapper {

	public List<MainRecipe> getBestRec();
	
	public List<MainRecipe> getNewRec();
	
	public List<Community> getNewComm();
}
