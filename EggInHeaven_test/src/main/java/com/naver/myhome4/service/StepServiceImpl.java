package com.naver.myhome4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Step;

@Service
public class StepServiceImpl implements StepService{
	
	@Autowired
	private com.naver.myhome4.mybatis.mapper.StepMapper dao;

	@Override
	public void insertStep(Step step) {
		dao.insertStep(step);
		
	}

	@Override
	public int stepModify(Step stepmodify) {
		return dao.stepModify(stepmodify);
	}

	
	@Override
	public Step getDetail(int step_num) {
		return dao.getDetail(step_num);
	}

	@Override
	public int stepDelete(int step_num) {
		return dao.stepDelete(step_num);
	}

}
