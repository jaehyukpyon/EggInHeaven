package com.naver.myhome4.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Material;

public interface MaterialMapper {
	
	//재료 등록
			public abstract void insertMaterial(Material material);
			
			//재료 수정
			public abstract int materialModify(Material material);
			
			//재료 삭제
			public abstract int materialDelete(int num);
			
			//재료 내용 보기
			public abstract Map<String, Object> getDetail(int num);

			

}
