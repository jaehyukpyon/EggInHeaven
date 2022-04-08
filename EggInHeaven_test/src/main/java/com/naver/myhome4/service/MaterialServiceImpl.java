package com.naver.myhome4.service;

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
	public int materialModify(Material modifymaterial) {
		return dao.materialModify(modifymaterial);
	}

	@Override
	public int materialDelete(int material_num) {
		return dao.materialDelete(material_num);
	}

	@Override
	public Material getDetail(int material_num) {
		return dao.getDetail(material_num);
	}
	
	
}
