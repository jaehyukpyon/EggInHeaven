package com.naver.myhome4.service;

import java.util.List;

import com.naver.myhome4.domain.MkView;


public interface MkService {
	public List<MkView> all();
	public List<MkView> search(String material,int time);

}
