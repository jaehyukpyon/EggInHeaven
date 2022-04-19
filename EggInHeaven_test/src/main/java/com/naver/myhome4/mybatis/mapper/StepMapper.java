package com.naver.myhome4.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Step;

public interface StepMapper {
	
		//레시피순서 등록
		public abstract void insertStep(HashMap<String,Object> map);
		
		//레시피순서 수정
		public abstract int stepModify(Step stepmodify);
		
		//레시피순서 삭제
		public abstract int stepDelete(int num);
		
		//레시피순서 보기
		public abstract List<Map<String, Object>> getDetail(int num);

		public abstract void removestep(int recipe_num);

}
