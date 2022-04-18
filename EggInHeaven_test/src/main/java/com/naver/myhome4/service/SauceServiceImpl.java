package com.naver.myhome4.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.naver.myhome4.domain.Sauce;

@Service
public class SauceServiceImpl implements SauceService{

	@Autowired
	private com.naver.myhome4.mybatis.mapper.SauceMapper dao;
	
	@Override
	public void insertSauce(Sauce sauce) {
		dao.insertSauce(sauce);
		
	}

	@Override
	public int sauceModify(Sauce sauce) {
		 return dao.sauceModify(sauce);
	}

	@Override
	public int sauceDelete(int num) {
		return dao.sauceDelete(num);
	}

	@Override
	public Map<String, Object> getDetail(int num) {
		return dao.getDetail(num);
	}
}
