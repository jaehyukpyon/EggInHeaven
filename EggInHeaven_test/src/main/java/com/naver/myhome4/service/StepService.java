package com.naver.myhome4.service;


import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Step;

public interface StepService {

	//레시피순서 등록
	public abstract void insertStep(Step step);
	
	//레시피순서 수정
	public abstract void stepModify(Step stepmodify);
	
	//레시피순서 삭제
	public abstract int stepDelete(int num);
	
	//레시피순서 보기
	public abstract List<Map<String, Object>> getDetail(int num);
}
