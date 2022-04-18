package com.naver.myhome4.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Step;

@Service
public class StepServiceImpl implements StepService{
	
	@Autowired
	private com.naver.myhome4.mybatis.mapper.StepMapper dao;

	@Override
	public void insertStep(Step step) {
		for(int i=0;i<step.getStep_content().length;i++) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("recipe_num",step.getRecipe_num());
			map.put("step_index", i+1);
			map.put("step_original", step.getStep_original()[i]);
			map.put("step_db", step.getStep_db()[i]);
			map.put("step_content", step.getStep_content()[i]);
			dao.insertStep(map);	
		}
	}

	@Override
	public void stepModify(Step stepmodify) {
		dao.removestep(stepmodify.getRecipe_num());
		 insertStep(stepmodify);
	}

	
	@Override
	public List<Map<String, Object>> getDetail(int num) {
		return dao.getDetail(num);
	}

	@Override
	public int stepDelete(int num) {
		return dao.stepDelete(num);
	}

}
