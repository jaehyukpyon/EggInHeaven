package com.naver.myhome4.mybatis.mapper;

import java.util.List;

import com.naver.myhome4.domain.MkView;


public interface MkMapper {
  
	public List<MkView> all();

	public List<MkView> search(String material,int time);
}