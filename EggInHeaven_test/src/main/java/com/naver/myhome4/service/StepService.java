package com.naver.myhome4.service;


import com.naver.myhome4.domain.Step;

public interface StepService {

	//레시피순서 등록
	public abstract void insertStep(Step step);
	
	//레시피순서 수정
	public abstract int stepModify(Step stepmodify);
	
	//레시피순서 삭제
	public abstract int stepDelete(int step_num);
	
	//레시피순서 보기
	public abstract Step getDetail(int step_num);
}
