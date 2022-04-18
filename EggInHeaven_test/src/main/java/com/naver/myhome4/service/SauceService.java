package com.naver.myhome4.service;


import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Sauce;


public interface SauceService {

	//양념등록
	public abstract void insertSauce(Sauce sauce);
	
	//양념 수정
	public abstract int sauceModify(Sauce sauce);
			
	//양념 삭제
	public abstract int sauceDelete(int num);
			
	public abstract Map<String, Object> getDetail(int num);
}
