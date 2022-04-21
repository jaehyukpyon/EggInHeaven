package com.naver.myhome4.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.MkView;
import com.naver.myhome4.mybatis.mapper.MkMapper;

@Service
public class MkServiceImple implements MkService{
   
   @Autowired
   private MkMapper dao;
   
   @Override
   public List<MkView> all() {
      return dao.all();
   }

   @Override
   public List<MkView> search(String material,int time) {
      Map<String, Object> map = new HashMap<String, Object>();      
      String temp[] = material.split(",");
      map.put("material", temp);
      map.put("time",time);
      return dao.search(map);
   }
   
}
