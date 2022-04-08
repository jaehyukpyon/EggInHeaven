package com.naver.myhome4.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.naver.myhome4.domain.Source;

public class SourceServiceImpl implements SourceService{

	@Autowired
	private com.naver.myhome4.mybatis.mapper.SourceMapper dao;
	
	@Override
	public void insertSource(Source source) {
		dao.insertSource(source);
		
	}

	@Override
	public int sourceModify(Source modifymaterial) {
		return dao.sourceModify(modifymaterial);
	}

	@Override
	public int sourceDelete(int source_num) {
		return dao.sourceDelete(source_num);
	}

	@Override
	public Source getDetail(int source_num) {
		return dao.getDetail(source_num);
	}

}
