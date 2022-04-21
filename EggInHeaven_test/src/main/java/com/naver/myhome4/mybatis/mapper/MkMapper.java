package com.naver.myhome4.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.MkView;


public interface MkMapper {
  
   public List<MkView> all();

   public List<MkView> search(Map<String, Object> map);
}