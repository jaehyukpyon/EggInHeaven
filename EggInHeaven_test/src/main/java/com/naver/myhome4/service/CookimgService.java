package com.naver.myhome4.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Cookimg;

public interface CookimgService {

	//요리사진 등록
	public abstract void insertCookimg(Cookimg cookimg,int length);

	//요리사진수정
	public abstract void cookModify(Cookimg cookimg,int length);
	
	//요리사진삭제
	public abstract int cookimgDelete(int num);
	
	//요리사진 보기
	public abstract List<Map<String, Object>> getDetail(int num);
}
