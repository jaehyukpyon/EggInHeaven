package com.naver.myhome4.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Material;


@Service
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	private com.naver.myhome4.mybatis.mapper.MaterialMapper dao;

	@Override
	public void insertMaterial(Material material) {
		dao.insertMaterial(material);
		
	}

	@Override
	public int materialModify(Material material) {
		return dao.materialModify(material);
	}

	@Override
	public int materialDelete(int num) {
		return dao.materialDelete(num);
	}

	@Override
	public Map<String, Object> getDetail(int num) {
		return dao.getDetail(num);
	}

	
	
	
}
